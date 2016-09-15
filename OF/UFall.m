% Unconstrained Functions
function fobj = UFall(name)
  switch name
    case 'UF1'
      fobj = @UF1;
    case 'UF2'
      fobj = @UF2;
    case 'UF3'
      fobj = @UF3;
    case 'UF4'
      fobj = @UF4;
    case 'UF5'
      fobj = @UF5;
    case 'UF6'
      fobj = @UF6;
    case 'UF7'
      fobj = @UF7;
    case 'UF8'
      fobj = @UF8;
    case 'UF9'
      fobj = @UF9;
    case 'UF10'
      fobj = @UF10;
  end
end
%% UF1
% x and y are columnwise, the imput x must be inside the search space and
% it could be a matrix
function y = UF1(x)
  [dim, num]  = size(x);
  tmp         = zeros(dim,num);
  tmp(2:dim,:)= (x(2:dim,:) - sin(6.0*pi*repmat(x(1,:),[dim-1,1]) + pi/dim*repmat((2:dim)',[1,num]))).^2;
  tmp1        = sum(tmp(3:2:dim,:));  % odd index
  tmp2        = sum(tmp(2:2:dim,:));  % even index
  y(1,:)      = x(1,:)             + 2.0*tmp1/size(3:2:dim,2);
  y(2,:)      = 1.0 - sqrt(x(1,:)) + 2.0*tmp2/size(2:2:dim,2);
  clear tmp;
end

%% UF2
% x and y are columnwise, the imput x must be inside the search space and
% it could be a matrix
function y = UF2(x)
  [dim, num]  = size(x);
  X1          = repmat(x(1,:),[dim-1,1]);
  A           = 6*pi*X1 + pi/dim*repmat((2:dim)',[1,num]);
  tmp         = zeros(dim,num);
  tmp(2:dim,:)= (x(2:dim,:) - 0.3*X1.*(X1.*cos(4.0*A)+2.0).*cos(A)).^2;
  tmp1        = sum(tmp(3:2:dim,:));  % odd index
  tmp(2:dim,:)= (x(2:dim,:) - 0.3*X1.*(X1.*cos(4.0*A)+2.0).*sin(A)).^2;
  tmp2        = sum(tmp(2:2:dim,:));  % even index
  y(1,:)      = x(1,:)             + 2.0*tmp1/size(3:2:dim,2);
  y(2,:)      = 1.0 - sqrt(x(1,:)) + 2.0*tmp2/size(2:2:dim,2);
  clear X1 A tmp;
end

%% UF3
% x and y are columnwise, the imput x must be inside the search space and
% it could be a matrix
function y = UF3(x)
  [dim, num]   = size(x);
  Y            = zeros(dim,num);
  Y(2:dim,:)   = x(2:dim,:) - repmat(x(1,:),[dim-1,1]).^(0.5+1.5*(repmat((2:dim)',[1,num])-2.0)/(dim-2.0));
  tmp1         = zeros(dim,num);
  tmp1(2:dim,:)= Y(2:dim,:).^2;
  tmp2         = zeros(dim,num);
  tmp2(2:dim,:)= cos(20.0*pi*Y(2:dim,:)./sqrt(repmat((2:dim)',[1,num])));
  tmp11        = 4.0*sum(tmp1(3:2:dim,:)) - 2.0*prod(tmp2(3:2:dim,:)) + 2.0;  % odd index
  tmp21        = 4.0*sum(tmp1(2:2:dim,:)) - 2.0*prod(tmp2(2:2:dim,:)) + 2.0;  % even index
  y(1,:)       = x(1,:)             + 2.0*tmp11/size(3:2:dim,2);
  y(2,:)       = 1.0 - sqrt(x(1,:)) + 2.0*tmp21/size(2:2:dim,2);
  clear Y tmp1 tmp2;
end

%% UF4
% x and y are columnwise, the imput x must be inside the search space and
% it could be a matrix
function y = UF4(x)
  [dim, num]  = size(x);
  Y           = zeros(dim,num);
  Y(2:dim,:)  = x(2:dim,:) - sin(6.0*pi*repmat(x(1,:),[dim-1,1]) + pi/dim*repmat((2:dim)',[1,num]));
  H           = zeros(dim,num);
  H(2:dim,:)  = abs(Y(2:dim,:))./(1.0+exp(2.0*abs(Y(2:dim,:))));
  tmp1        = sum(H(3:2:dim,:));  % odd index
  tmp2        = sum(H(2:2:dim,:));  % even index
  y(1,:)      = x(1,:)          + 2.0*tmp1/size(3:2:dim,2);
  y(2,:)      = 1.0 - x(1,:).^2 + 2.0*tmp2/size(2:2:dim,2);
  clear Y H;
end

%% UF5
% x and y are columnwise, the imput x must be inside the search space and
% it could be a matrix
function y = UF5(x)
  N           = 10.0;
  E           = 0.1;
  [dim, num]  = size(x);
  Y           = zeros(dim,num);
  Y(2:dim,:)  = x(2:dim,:) - sin(6.0*pi*repmat(x(1,:),[dim-1,1]) + pi/dim*repmat((2:dim)',[1,num]));
  H           = zeros(dim,num);
  H(2:dim,:)  = 2.0*Y(2:dim,:).^2 - cos(4.0*pi*Y(2:dim,:)) + 1.0;
  tmp1        = sum(H(3:2:dim,:));  % odd index
  tmp2        = sum(H(2:2:dim,:));  % even index
  tmp         = (0.5/N+E)*abs(sin(2.0*N*pi*x(1,:)));
  y(1,:)      = x(1,:)      + tmp + 2.0*tmp1/size(3:2:dim,2);
  y(2,:)      = 1.0 - x(1,:)+ tmp + 2.0*tmp2/size(2:2:dim,2);
  clear Y H;
end

%% UF6
% x and y are columnwise, the imput x must be inside the search space and
% it could be a matrix
function y = UF6(x)
  N            = 2.0;
  E            = 0.1;
  [dim, num]   = size(x);
  Y            = zeros(dim,num);
  Y(2:dim,:)  = x(2:dim,:) - sin(6.0*pi*repmat(x(1,:),[dim-1,1]) + pi/dim*repmat((2:dim)',[1,num]));
  tmp1         = zeros(dim,num);
  tmp1(2:dim,:)= Y(2:dim,:).^2;
  tmp2         = zeros(dim,num);
  tmp2(2:dim,:)= cos(20.0*pi*Y(2:dim,:)./sqrt(repmat((2:dim)',[1,num])));
  tmp11        = 4.0*sum(tmp1(3:2:dim,:)) - 2.0*prod(tmp2(3:2:dim,:)) + 2.0;  % odd index
  tmp21        = 4.0*sum(tmp1(2:2:dim,:)) - 2.0*prod(tmp2(2:2:dim,:)) + 2.0;  % even index
  tmp          = max(0,(1.0/N+2.0*E)*sin(2.0*N*pi*x(1,:)));
  y(1,:)       = x(1,:)       + tmp + 2.0*tmp11/size(3:2:dim,2);
  y(2,:)       = 1.0 - x(1,:) + tmp + 2.0*tmp21/size(2:2:dim,2);
  clear Y tmp1 tmp2;
end

%% UF7
% x and y are columnwise, the imput x must be inside the search space and
% it could be a matrix
function y = UF7(x)
  [dim, num]  = size(x);
  Y           = zeros(dim,num);
  Y(2:dim,:)  = (x(2:dim,:) - sin(6.0*pi*repmat(x(1,:),[dim-1,1]) + pi/dim*repmat((2:dim)',[1,num]))).^2;
  tmp1        = sum(Y(3:2:dim,:));  % odd index
  tmp2        = sum(Y(2:2:dim,:));  % even index
  tmp         = (x(1,:)).^0.2;
  y(1,:)      = tmp       + 2.0*tmp1/size(3:2:dim,2);
  y(2,:)      = 1.0 - tmp + 2.0*tmp2/size(2:2:dim,2);
  clear Y;
end

%% UF8
% x and y are columnwise, the imput x must be inside the search space and
% it could be a matrix
function y = UF8(x)
  [dim, num]  = size(x);
  Y           = zeros(dim,num);
  Y(3:dim,:)  = (x(3:dim,:) - 2.0*repmat(x(2,:),[dim-2,1]).*sin(2.0*pi*repmat(x(1,:),[dim-2,1]) + pi/dim*repmat((3:dim)',[1,num]))).^2;
  tmp1        = sum(Y(4:3:dim,:));  % j-1 = 3*k
  tmp2        = sum(Y(5:3:dim,:));  % j-2 = 3*k
  tmp3        = sum(Y(3:3:dim,:));  % j-0 = 3*k
  y(1,:)      = cos(0.5*pi*x(1,:)).*cos(0.5*pi*x(2,:)) + 2.0*tmp1/size(4:3:dim,2);
  y(2,:)      = cos(0.5*pi*x(1,:)).*sin(0.5*pi*x(2,:)) + 2.0*tmp2/size(5:3:dim,2);
  y(3,:)      = sin(0.5*pi*x(1,:))                     + 2.0*tmp3/size(3:3:dim,2);
  clear Y;
end

%% UF9
% x and y are columnwise, the imput x must be inside the search space and
% it could be a matrix
function y = UF9(x)
  E           = 0.1;
  [dim, num]  = size(x);
  Y           = zeros(dim,num);
  Y(3:dim,:)  = (x(3:dim,:) - 2.0*repmat(x(2,:),[dim-2,1]).*sin(2.0*pi*repmat(x(1,:),[dim-2,1]) + pi/dim*repmat((3:dim)',[1,num]))).^2;
  tmp1        = sum(Y(4:3:dim,:));  % j-1 = 3*k
  tmp2        = sum(Y(5:3:dim,:));  % j-2 = 3*k
  tmp3        = sum(Y(3:3:dim,:));  % j-0 = 3*k
  tmp         = max(0,(1.0+E)*(1-4.0*(2.0*x(1,:)-1).^2));
  y(1,:)      = 0.5*(tmp+2*x(1,:)).*x(2,:)     + 2.0*tmp1/size(4:3:dim,2);
  y(2,:)      = 0.5*(tmp-2*x(1,:)+2.0).*x(2,:) + 2.0*tmp2/size(5:3:dim,2);
  y(3,:)      = 1-x(2,:)                       + 2.0*tmp3/size(3:3:dim,2);
  clear Y;
end

%% UF10
% x and y are columnwise, the imput x must be inside the search space and
% it could be a matrix
function y = UF10(x)
  [dim, num]  = size(x);
  Y           = zeros(dim,num);
  Y(3:dim,:)  = x(3:dim,:) - 2.0*repmat(x(2,:),[dim-2,1]).*sin(2.0*pi*repmat(x(1,:),[dim-2,1]) + pi/dim*repmat((3:dim)',[1,num]));
  H           = zeros(dim,num);
  H(3:dim,:)  = 4.0*Y(3:dim,:).^2 - cos(8.0*pi*Y(3:dim,:)) + 1.0;
  tmp1        = sum(H(4:3:dim,:));  % j-1 = 3*k
  tmp2        = sum(H(5:3:dim,:));  % j-2 = 3*k
  tmp3        = sum(H(3:3:dim,:));  % j-0 = 3*k
  y(1,:)      = cos(0.5*pi*x(1,:)).*cos(0.5*pi*x(2,:)) + 2.0*tmp1/size(4:3:dim,2);
  y(2,:)      = cos(0.5*pi*x(1,:)).*sin(0.5*pi*x(2,:)) + 2.0*tmp2/size(5:3:dim,2);
  y(3,:)      = sin(0.5*pi*x(1,:))                     + 2.0*tmp3/size(3:3:dim,2);
  clear Y H;
end