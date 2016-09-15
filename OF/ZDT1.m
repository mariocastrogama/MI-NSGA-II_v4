%  ZDT1.m : implements the benchmark bi-objective cost function
function [f,cons] = ZDT1(x)
% this one is known in literature as the ZDT1 function
% it requires 30 variables x in [0, 1]
  global nvar
  global nfuneval
  global nviolate
  f = zeros(1,2);
  cons = 0;
  f(1) = x(1);
  g = (9/(nvar-1))*sum(x(2:end)) + 1.0;
  f(2) = g.*(1.0 - (f(1)./g).^0.5);
  if cons > 0;
    nviolate = nviolate +1;
  end
  nfuneval = nfuneval + 1;
end