function [f,g] = UF5(x)
  % UF5
  % x and y are columnwise, the input x must be inside the search space and
  % it could be a matrix
  global nfuneval
  global nviolate
  x = x';
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
  f(1,:)      = x(1,:)      + tmp + 2.0*tmp1/size(3:2:dim,2);
  f(2,:)      = 1.0 - x(1,:)+ tmp + 2.0*tmp2/size(2:2:dim,2);
  f = f';
  nfuneval = nfuneval + 1;
  g = 0;
  clear Y H;
end