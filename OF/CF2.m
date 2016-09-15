function [f,c] = CF2(x)
  %% CF2
% x and y are columnwise, the imput x must be inside the search space and
% it could be a matrix
  x = x';
  a           = 1.0;
  N           = 2.0;
  [dim, num]  = size(x);
  tmp         = zeros(dim,num);
  tmp(2:dim,:)= (x(2:dim,:) - sin(6.0*pi*repmat(x(1,:),[dim-1,1]) + pi/dim*repmat((2:dim)',[1,num]))).^2;
  tmp1        = sum(tmp(3:2:dim,:));  % odd index
  tmp(2:dim,:)= (x(2:dim,:) - cos(6.0*pi*repmat(x(1,:),[dim-1,1]) + pi/dim*repmat((2:dim)',[1,num]))).^2;
  tmp2        = sum(tmp(2:2:dim,:));  % even index
  f(1,:)      = x(1,:)             + 2.0*tmp1/size(3:2:dim,2);
  f(2,:)      = 1.0 - sqrt(x(1,:)) + 2.0*tmp2/size(2:2:dim,2);
  t           = f(2,:) + sqrt(f(1,:)) - a*sin(N*pi*(sqrt(f(1,:))-f(2,:)+1.0)) - 1.0;
  c(1,:)      = sign(t).*abs(t)./(1.0+exp(4.0*abs(t)));
  f = f';
  c = c';
  clear tmp;
end