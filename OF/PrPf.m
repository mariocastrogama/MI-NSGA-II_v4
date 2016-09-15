function [f,cons] = PrPf(x)
% function y = PrPf(x)
% Pressure Vessel Design Problem
% Number of variables: 4 variables.
%
% Matlab Code by A. Hedar (Nov. 23, 2005).
%
  f = 0.6224*x(1)*x(3)*x(4)+1.7781*x(2)*x(3)^2+3.1661*x(1)^2*x(4)+19.84*x(1)^2*x(3);

  % Constraints
  cons(1) = -x(1)+0.0193*x(3);
  cons(2) = -x(2)+0.00954*x(3);
  cons(3) = -pi*x(3)^2*x(4)-(4/3)*pi*x(3)^3+1296000;
  cons(4) = x(4)-240;
end
