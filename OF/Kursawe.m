%  Kursawe.m : implements the benchmark bi-objective cost function
function [f,g]=Kursawe(x)
% this one is known in literature as the Kursawe (1991) function
  n=numel(x);
  global nvar
  global nfuneval
  f = [0.0 0.0];
  f(1) = sum(-10.0.*exp(-0.2*sqrt(x(1:n-1).^2 + x(2:n).^2)));
  f(2) = sum( abs(x).^0.8 + 5.0*sin(x.^3) );
  g = 0.0;
  nfuneval = nfuneval + 1;
end