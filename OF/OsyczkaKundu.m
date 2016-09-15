function [f,c]=OsyczkaKundu(x)
  global nfuneval
  global nviolate
  global nvar
  global nobj
  f = [0 0];
  c = zeros(1,6);
  c(1) = x(1) + x(2) - 2;           % >= 0
  c(2) = 6 - x(1) - x(2);           % >= 0
  c(3) = 2 - x(2) + x(1);           % >= 0
  c(4) = 2 - x(1) + 3* x(2);        % >= 0
  c(5) = 4 - (x(3) - 3).^2 - x(4);  % >= 0
  c(6) = (x(5) - 3).^2 + x(6) - 4;  % >= 0
  if any(-c > 0); % because all constraints are higher than zero need to make them negative
    f = f + [1e3 1e3]; % Assign a value 
    nviolate = nviolate + 1;
  else
    f(1) = -25.0*(x(1)-2).^2 - (x(2)-2).^2 - (x(3)-1).^2 - (x(4)-4).^2 - (x(5)-1).^2;
    f(2) = x*x';
  end
  nfuneval = nfuneval + 1;
end

