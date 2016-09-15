function [f,g] = Tanaka(x)
%  Tanaka.m : implements the benchmark single objective function  
%  x is valid inside [0, pi]
  global nfuneval 
  global nviolate
  f = [0, 0];
  g = [0, 0];
  % constraints {g(1), g(2) >=0}
  g(1) = x(1).^2 + x(2).^2 - 1.0 - 0.1.*cos(16.0.*atan(x(1)./x(2)));
  g(2) = 1.0 - 2.0*(x(1)-0.5).^2 +(x(2)-0.5).^2;
  if any(g < 0)
    f = [1e6 1e6];
    nviolate = nviolate + 1;
  else
    f = [x(1) x(2)];
  end
  nfuneval = nfuneval + 1;
end