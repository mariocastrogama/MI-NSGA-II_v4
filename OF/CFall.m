% Constrained Functions
function fobj = CFall(name)
  switch name
    case 'CF1'
      fobj = @CF1;
    case 'CF2'
      fobj = @CF2;
    case 'CF3'
      fobj = @CF3;
    case 'CF4'
      fobj = @CF4;
    case 'CF5'
      fobj = @CF5;
    case 'CF6'
      fobj = @CF6;
    case 'CF7'
      fobj = @CF7;
    case 'CF8'
      fobj = @CF8;
    case 'CF9'
      fobj = @CF9;
    case 'CF10'
      fobj = @CF10;
  end
end


%% CF5
% x and y are columnwise, the imput x must be inside the search space and
% it could be a matrix
function [y,c] = CF5(x)
  [dim, num]  = size(x);
  tmp         = zeros(dim,num);
  tmp(2:dim,:)= x(2:dim,:) - 0.8*repmat(x(1,:),[dim-1,1]).*cos(6.0*pi*repmat(x(1,:),[dim-1,1]) + pi/dim*repmat((2:dim)',[1,num]));
  tmp1        = sum(2.0*tmp(3:2:dim,:).^2-cos(4.0*pi*tmp(3:2:dim,:))+1.0);  % odd index
  tmp(2:dim,:)= x(2:dim,:) - 0.8*repmat(x(1,:),[dim-1,1]).*sin(6.0*pi*repmat(x(1,:),[dim-1,1]) + pi/dim*repmat((2:dim)',[1,num]));
  tmp2        = sum(2.0*tmp(4:2:dim,:).^2-cos(4.0*pi*tmp(4:2:dim,:))+1.0);  % odd index
  index1      = tmp(2,:) < (1.5-0.75*sqrt(2.0));
  index2      = tmp(2,:)>= (1.5-0.75*sqrt(2.0));
  tmp(2,index1) = abs(tmp(2,index1));
  tmp(2,index2) = 0.125 + (tmp(2,index2)-1.0).^2;
  y(1,:)      = x(1,:)                  + tmp1;
  y(2,:)      = 1.0 - x(1,:) + tmp(2,:) + tmp2;
  c(1,:)      = x(2,:) - 0.8*x(1,:).*sin(6.0*pi*x(1,:)+2.0*pi/dim) - 0.5*x(1,:) + 0.25;
  clear tmp;
end

%% CF6
% x and y are columnwise, the imput x must be inside the search space and
% it could be a matrix
function [y,c] = CF6(x)
  [dim, num]  = size(x);
  tmp         = zeros(dim,num);
  tmp(2:dim,:)= x(2:dim,:) - 0.8*repmat(x(1,:),[dim-1,1]).*cos(6.0*pi*repmat(x(1,:),[dim-1,1]) + pi/dim*repmat((2:dim)',[1,num]));
  tmp1        = sum(tmp(3:2:dim,:).^2);  % odd index
  tmp(2:dim,:)= x(2:dim,:) - 0.8*repmat(x(1,:),[dim-1,1]).*sin(6.0*pi*repmat(x(1,:),[dim-1,1]) + pi/dim*repmat((2:dim)',[1,num]));
  tmp2        = sum(tmp(2:2:dim,:).^2);  % even index
  y(1,:)      = x(1,:)            + tmp1;
  y(2,:)      = (1.0 - x(1,:)).^2 + tmp2;
  tmp         = 0.5*(1-x(1,:))-(1-x(1,:)).^2;
  c(1,:)      = x(2,:) - 0.8*x(1,:).*sin(6.0*pi*x(1,:)+2*pi/dim) - sign(tmp).*sqrt(abs(tmp));
  tmp         = 0.25*sqrt(1-x(1,:))-0.5*(1-x(1,:));
  c(2,:)      = x(4,:) - 0.8*x(1,:).*sin(6.0*pi*x(1,:)+4*pi/dim) - sign(tmp).*sqrt(abs(tmp));
  clear tmp;
end

%% CF7
% x and y are columnwise, the imput x must be inside the search space and
% it could be a matrix
function [y,c] = CF7(x)
  [dim, num]  = size(x);
  tmp         = zeros(dim,num);
  tmp(2:dim,:)= x(2:dim,:) - cos(6.0*pi*repmat(x(1,:),[dim-1,1]) + pi/dim*repmat((2:dim)',[1,num]));
  tmp1        = sum(2.0*tmp(3:2:dim,:).^2-cos(4.0*pi*tmp(3:2:dim,:))+1.0);  % odd index
  tmp(2:dim,:)= x(2:dim,:) - sin(6.0*pi*repmat(x(1,:),[dim-1,1]) + pi/dim*repmat((2:dim)',[1,num]));
  tmp2        = sum(2.0*tmp(6:2:dim,:).^2-cos(4.0*pi*tmp(6:2:dim,:))+1.0);  % even index
  tmp(2,:)    = tmp(2,:).^2;
  tmp(4,:)    = tmp(4,:).^2;
  y(1,:)      = x(1,:)                                  + tmp1;
  y(2,:)      = (1.0 - x(1,:)).^2 + tmp(2,:) + tmp(4,:) + tmp2;
  tmp         = 0.5*(1-x(1,:))-(1-x(1,:)).^2;
  c(1,:)      = x(2,:) - sin(6.0*pi*x(1,:)+2*pi/dim) - sign(tmp).*sqrt(abs(tmp));
  tmp         = 0.25*sqrt(1-x(1,:))-0.5*(1-x(1,:));
  c(2,:)      = x(4,:) - sin(6.0*pi*x(1,:)+4*pi/dim) - sign(tmp).*sqrt(abs(tmp));
  clear tmp;
end



%% CF9
% x and y are columnwise, the imput x must be inside the search space and
% it could be a matrix
function [y,c] = CF9(x)
  N           = 2.0;
  a           = 3.0;
  [dim, num]  = size(x);
  Y           = zeros(dim,num);
  Y(3:dim,:)  = (x(3:dim,:) - 2.0*repmat(x(2,:),[dim-2,1]).*sin(2.0*pi*repmat(x(1,:),[dim-2,1]) + pi/dim*repmat((3:dim)',[1,num]))).^2;
  tmp1        = sum(Y(4:3:dim,:));  % j-1 = 3*k
  tmp2        = sum(Y(5:3:dim,:));  % j-2 = 3*k
  tmp3        = sum(Y(3:3:dim,:));  % j-0 = 3*k
  y(1,:)      = cos(0.5*pi*x(1,:)).*cos(0.5*pi*x(2,:)) + 2.0*tmp1/size(4:3:dim,2);
  y(2,:)      = cos(0.5*pi*x(1,:)).*sin(0.5*pi*x(2,:)) + 2.0*tmp2/size(5:3:dim,2);
  y(3,:)      = sin(0.5*pi*x(1,:))                     + 2.0*tmp3/size(3:3:dim,2);
  c(1,:)      = (y(1,:).^2+y(2,:).^2)./(1.0-y(3,:).^2) - a*sin(N*pi*((y(1,:).^2-y(2,:).^2)./(1.0-y(3,:).^2)+1.0)) + 1.0;
  clear Y;
end

%% CF10
% x and y are columnwise, the imput x must be inside the search space and
% it could be a matrix
function [y,c] = CF10(x)

end
