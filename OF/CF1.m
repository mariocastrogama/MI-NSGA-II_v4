%% CF1
% x and y are columnwise, the imput x must be inside the search space and
% it could be a matrix
function [f,c] = CF1(x)
% x = [0.2092, 0.9901, 0.0583, 0.0946, 0.2565, 0.2997, 0.8078, 0.2123, 0.5681, 0.4560];
% CF1(x) = [0.6278, 0.9997];
%  Result as column
%   a            = 1.0;
%   N            = 10.0;
%   [dim, num]   = size(x);
%   Y            = zeros(dim,num);
%   Y(2:dim,:)   = (x(2:dim,:) - repmat(x(1,:),[dim-1,1]).^(0.5+1.5*(repmat((2:dim)',[1,num])-2.0)/(dim-2.0))).^2;
%   tmp1         = sum(Y(3:2:dim,:));% odd index
%   tmp2         = sum(Y(2:2:dim,:));% even index
%   f(1,:)       = x(1,:)       + 2.0*tmp1/size(3:2:dim,2);
%   f(2,:)       = 1.0 - x(1,:) + 2.0*tmp2/size(2:2:dim,2);
%   c(1,:)       = f(1,:) + f(2,:) - a*abs(sin(N*pi*(f(1,:)-f(2,:)+1.0))) - 1.0;
%   clear Y;

%  Result as column
  a            = 1.0;
  N            = 10.0;
  [nf, nvar]   = size(x);
  Y            = zeros(nf,nvar);
  Y(:,2:nvar)   = (x(:,2:nvar) - repmat(x(:,1),[1,nvar-1]).^(0.5+1.5*(repmat((2:nvar),[nf,1])-2.0)/(nvar-2.0))).^2;
  tmp1         = sum(Y(:,3:2:nvar));% odd index (can change direction)
  tmp2         = sum(Y(:,2:2:nvar));% even index (can change direction)
  f(:,1)       = x(:,1)       + 2.0*tmp1/size(3:2:nvar,2);
  f(:,2)       = 1.0 - x(:,1) + 2.0*tmp2/size(2:2:nvar,2);
  c(:,1)       = f(:,1) + f(:,2) - a*abs(sin(N*pi*(f(:,1)-f(:,2)+1.0))) - 1.0;
  clear Y;
end