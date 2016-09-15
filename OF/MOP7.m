function [f,cons] = MOP7(x)
% MOP7 : Multi-Objective Problem No. 7
%   The 7th function of the Van Valedhuizen's test suite.
%   all objectives other than those of MOP3 are to be MINIMIZED.
%
%   Input arguments   
%
%     x  : Decision Variable Vector. X is a matrix with as many rows as
%          trial vector and as many columns as decision variables.
%          x domain is [-400 400]
%          number of variables is 2. (x1,x2)
%
%   Output arguments
%     f  : The objective Vector. J is a matrix with as many rows as
%          trial vectors in X and as many columns as objectives.
%          number of objectives is 3. f1(x1,x2), f2(x1,x2), f3(x1,x2)
%
% Usage:
%   x = rand(5,2);
%   f = MOP7(x);
%
% -----------------------------------
% code: REZA AHMADZADEH  
% (reza.ahmadzadeh@iit.it)
% -----------------------------------
% adapted by
% MSc Mario Castro Gama
% IWSG / UNESCO-IHE
%

  global nvar
  global nfuneval
  global nviolate
  cons = 0;
  if cons > 0;
    nviolate = nviolate +1;
  end
  f(:,1) = 0.5*(x(:,1)-2.0).^2 + ((x(:,2)+1.0).^2)/13.0 + 3.0;
  f(:,2) = ((x(:,1)+x(:,2)-3.0).^2)/36.0 + ((x(:,2)-x(:,1)+2).^2)/8.0 -17.0;
  f(:,3) = ((x(:,1)+ 2.0*x(:,2)-1.0).^2)/175.0 + ((2*x(:,2)-x(:,1)).^2)/17.0 -13.0;
  nfuneval = nfuneval + 1;
end