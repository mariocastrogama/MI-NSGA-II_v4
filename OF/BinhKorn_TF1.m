function [f,g]=BinhKorn_TF1(x)
% This is the Binh and Korn test case 1
% Binh T. & Korn, U. MOBES with Linear and Nonlinear Constraints 
% In: Proceedings of the Third International Conference on Genetic Algorithms, 1997, 176-182
  global nfuneval
  global nviolate
  global nvar
  global nobj
  f = [0 0];
  g = zeros(1,2);
  g(1) = x(1)*x(1) + x(2)*x(2) - 225.0;     % <= 0
  g(2) = x(1) - 3.0*x(2) + 10.0;  % <= 0
    
  if any(g > 0); % because constraints are <= 0.
    f = f + [1e3 1e3]; % Assign a value 
    nviolate = nviolate + 1;
  else
    f(1) = (x(1)-2.0)*(x(1)-2.0) + (x(2)-1.0)*(x(2)-1.0) + 2.0;
    f(2) = 9.0*x(1) - (x(2)-1.0)*(x(2)-1.0);
  end
  nfuneval = nfuneval + 1;
end