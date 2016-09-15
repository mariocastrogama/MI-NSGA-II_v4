%  ZDT3.m : implements the benchmark bi-objective cost function
function [f,cons] = ZDT3(x)
% this one is known in literature as the ZDT3 function
% it requires 30 variables
  global nvar
  global nfuneval
  global nviolate
  f = [0,0];
  cons = 0;
  f(1) = x(1);
  g = 1 + 9/29*sum(x(2:end));
  k = f(1)/g;
  h = 1 - (k)^0.5 - k * sin(10*pi*f(1));
  f(2) = g*h;
  if cons > 0;
    nviolate = nviolate +1;
  end
  nfuneval = nfuneval + 1;
end