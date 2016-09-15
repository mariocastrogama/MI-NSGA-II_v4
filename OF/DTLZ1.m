function [objs, const] = DTLZ1(x)
  global nfuneval
  global nviolate
  global nvar
  global nobj
  
  objs = zeros(size(x,1),nobj);
  const = [];
  x3nmp5 = x(:,3:nvar)-0.5;
  g = 100*(nvar-2)+ 100*sum(x3nmp5.*x3nmp5 - cos(20*pi*(x3nmp5)));
  objs(1) = (1 + g)*x(1)*x(2);
  objs(2) = (1 + g)*x(1)*(1-x(2));
  objs(3) = (1 + g)*(1-x(1));
  nfuneval = nfuneval +1;
end
