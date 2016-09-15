function [f,g]=BinhKorn_TF2(x)
% This is the Binh and Korn test case 2
% Binh T. & Korn, U. MOBES with Linear and Nonlinear Constraints 
% In: Proceedings of the Third International Conference on Genetic Algorithms, 1997, 176-182
  global nfuneval
  global nviolate
  global nvar
  global nobj
  f = [0 0 0];
  g = zeros(1,2);
  g(1) = -x(1)*x(1) - (x(2) - 0.5)*(x(2) - 0.5) + 9.0;                % <= 0
  g(2) = (x(1) - 1.0)*(x(1) - 1.0) + (x(2) - 0.5)*(x(2) - 0.5) -6.25; % <= 0
  if any(g > 0); % because constraints are <= 0.
    f = f + [1e3 1e3 1e3]; % Assign a value 
    nviolate = nviolate + 1;
  else
    f(1) = 1.500 - x(1)*(1.0 - x(2));
    f(2) = 2.250 - x(1)*(1.0 - x(2)^2);
    f(3) = 2.625 - x(1)*(1.0 - x(2)^3);
  end
  nfuneval = nfuneval + 1;
end