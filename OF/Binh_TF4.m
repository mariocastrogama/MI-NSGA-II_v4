function [f,g]=Binh_TF4(x)
% Binh T. (1999) A multiobjective evolutionary algorithm. The study cases. 
% Technical report. Institute for Automation and Communication. Barleben, Germany
  global nfuneval
  global nviolate
  global nvar
  global nobj
  f = [0 0];
  g = zeros(1,3);
  g(1) =  6.5 - x(1)/6.0 - x(2);           % >= 0
  g(2) =  7.5 - 0.5*x(1) - x(2);           % >= 0
  g(3) = 30.0 - 5.0*x(1) - x(2);           % >= 0
  
  if any(-g > 0); % because all constraints are higher than zero need to make them negative
    f = f + [1e3 1e3]; % Assign a value 
    nviolate = nviolate + 1;
  else
    f(1) = x(1)*x(1) - x(2);
    f(2) = -0.5*x(1) - x(2) -1.0;
  end
  nfuneval = nfuneval + 1;
end