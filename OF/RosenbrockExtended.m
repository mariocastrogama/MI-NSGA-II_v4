%  RosenbrockExtended.m : implements the benchmark bi-objective cost function
function [f,g]=RosenbrockExtended(x)
% this one is known in literature as the Rosenbrock function
% it requires 2 variables only
  global nvar
  global nfuneval
  global nviolate
  f = [0,0];
  g = 0;
  if g>0
    nviolate = nviolate +1;
  end
  aa=(x(1:nvar-1)).^2;
  bb=x(2:nvar);
  cc=x(1:nvar-1);
  f(1) = sum(100.*(aa-bb).^2+(cc-1).^2);
  f(2) = f(1);
  nfuneval = nfuneval + 1;
end