function [f,g]=RosenSuzuki(x)
% Rosen-Suzuki.m 
% Implements the benchmark single objective function
% http://www.phoenix-int.com/software/benchmark_report/rosen_suzuki_discrete.php
% The optimum is:
%   f* = -44  
%   x* = [0, 1, 2, -1]
% this one is known in literature as the Kursawe function
%   n=numel(x);
%   global nvar
  global nfuneval
  global nviolate
  g = [0 0 0];
  f = [0 0];
  % this are the Constraints of the variables {g(1), g(2), g(3) >=0}
  g(1) = -1.0*x(1)*x(1) - 1.0*x(2)*x(2) - x(3)*x(3) - 1.0*x(4)*x(4) - x(1) + x(2) - x(3) + x(4) + 8.0;
  g(2) = -1.0*x(1)*x(1) - 2.0*x(2)*x(2) - x(3)*x(3) - 2.0*x(4)*x(4) + x(1) + x(4) + 10.0;
  g(3) = -2.0*x(1)*x(1) - 1.0*x(2)*x(2) - x(3)*x(3) - 2.0*x(1) + x(2) + x(4) + 5.0;
  if any(g < 0); % if it violates a constraint apply high value to objective function
    f = [1e6 1e6];
    nviolate = nviolate + 1;
  else
    f(1) = x(1)*x(1) + x(2)*x(2) + 2.0*x(3)*x(3) + x(4)*x(4) - 5.0*x(1) - 5.0*x(2) - 21.0*x(3) + 7.0*x(4);
    f(2) = f(1);
  end
  nfuneval = nfuneval + 1;
end