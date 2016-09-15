%  Rosenbrock.m : implements the benchmark bi-objective cost function
function [f,g]=Rosenbrock(x)
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
  f(1) = 100*(x(1)^2-x(2))^2+(x(1)-1)^2;
  f(2) = f(1);
  nfuneval = nfuneval + 1;
end