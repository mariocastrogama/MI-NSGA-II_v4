function [f,g]=CTP1(x)
% This is the CTP1 problem from
% Deb, Kalyanmoy (2002) Multiobjective optimization using evolutionary algorithms (Repr. ed.). 
% Chichester [u.a.]: Wiley. ISBN 0-471-87339-X.
  global nfuneval
  global nviolate
  global nvar
  global nobj
  f = [0 0];
  f(1) = x(1);
  f(2) = (1 + x(2))*exp(-x(1)/(1 + x(2)));
  g = zeros(1,2);
  g(1) = f(2)/(0.858*exp(-0.541*f(1))) - 1.0;           % >= 0
  g(2) = f(2)/(0.728*exp(-0.295*f(1))) - 1.0;           % >= 0
    
  if any(-g > 0); % because all constraints are higher than zero need to make them negative
    f = f + [1e3 1e3]; % Assign a value 
    nviolate = nviolate + 1;
  end
  nfuneval = nfuneval + 1;
end