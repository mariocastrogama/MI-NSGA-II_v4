function [f, g] = UF1(x)
  % UF1
  % x and y are columnwise, the imput x must be inside the search space and
  % it could be a matrix
  global nfuneval 
  global nviolate
  x = x';
  [dim, num]  = size(x);
  tmp         = zeros(dim,num);
  tmp(2:dim,:)= (x(2:dim,:) - sin(6.0*pi*repmat(x(1,:),[dim-1,1]) + pi/dim*repmat((2:dim)',[1,num]))).^2;
  tmp1        = sum(tmp(3:2:dim,:));  % odd index
  tmp2        = sum(tmp(2:2:dim,:));  % even index
  f(1,:)      = x(1,:)             + 2.0*tmp1/size(3:2:dim,2);
  f(2,:)      = 1.0 - sqrt(x(1,:)) + 2.0*tmp2/size(2:2:dim,2);
  f = f';
  g = 0;
  nfuneval = nfuneval + 1;
  clear tmp;
end