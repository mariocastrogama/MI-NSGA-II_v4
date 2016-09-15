function [f,g]=BinhKorn_TF3(x)
% This is the Binh and Korn problem from
% Binh T. and Korn U. (1997) MOBES: A Multiobjective Evolution Strategy for Constrained Optimization Problems. 
% In: Proceedings of the Third International Conference on Genetic Algorithms. Czech Republic. pp. 176-182
  global nfuneval
  global nviolate
  global nvar
  global nobj
  f = [0 0];
  g = zeros(1,2);
  g(1) = (x(1)-5.0)*(x(1)-5.0) + x(2)*x(2) - 25.0;                     % <= 0
  g(2) = -(x(1) - 8.0)*(x(1) - 8.0) - (x(2) + 3.0)*(x(2) + 3.0) + 7.7; % <= 0
  
  if any(g > 0); % because first constraint <= 0 and second >= 0.
    f = f + [1e3 1e3]; % Assign a value 
    nviolate = nviolate + 1;
  else
    f(1) = 4*x(1)*x(1) + 4*x(2)*x(2);
    f(2) = (x(1) - 5.0)^2 + (x(2) - 5.0)^2;
  end
  nfuneval = nfuneval + 1;
end