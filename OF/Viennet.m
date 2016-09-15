function [f,cons] = Viennet(x)
% Viennet Multi-Objective function
% Input arguments
%   x  : Decision Variable Vector. Is a matrix with as many rows as
%        trial vector and as many columns as decision variables.
%   
%   f  : The objective Vector. Is a matrix with as many rows as
%        trial vectors in X and as many columns as objectives.
%
%   the X parameter domain is [-3 3]
%   number of variables is 2.  x(1), x(2)
%   number of objectives is 3. f(1) f(2) f(3)
%
% Usage:
%   x = -3+6*rand(1,2);
%   f = Viennet(x);
%


  global nvar
  global nfuneval
  global nviolate
  f = [0,0,0];
  cons = 0;
  if cons > 0;
    nviolate = nviolate +1;
  end
  x2 = x(1)*x(1);
  y2 = x(2)*x(2);
  f(:,1) = 0.5*(x2+y2) + sin(x2+y2);
  f(:,2) = (3*x(1)-2*x(2)+4).^2/8 + (x(1)-x(2)+1.0).^2/27 + 15.0;
  f(:,3) = 1.0/(x2+y2+1) - 1.1*exp(-(x2 + y2));
  nfuneval = nfuneval + 1;
end