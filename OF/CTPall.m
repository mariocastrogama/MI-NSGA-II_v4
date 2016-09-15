% CTP
function fobj = CTPall(name)
  switch name
    case 'CTP1'
      fobj = @CTP1;
    case 'CTP2'
      fobj = @CTP2;
    case 'CTP3'
      fobj = @CTP3;
    case 'CTP4'
      fobj = @CTP4;
    case 'CTP5'
      fobj = @CTP5;
    case 'CTP6'
      fobj = @CTP6;
    case 'CTP7'
      fobj = @CTP7;
    case 'CTP18'
      fobj = @CTP8;
  end
end
%% CTP4
function [y,constr] = CTP4(x)
  theta = -0.2*pi;
  a = 0.75;
  b = 10.0;
  c = 1.0;
  d = 0.5;
  ee = 1.0;
  g = 1.0 + x(2);
  f1 = x(1);
  f2 = g.*(1.0  - sqrt(f1./g));
  exp1 = (f2-ee).*cos(theta) - f1.*sin(theta);
  exp2 = (f2-ee).*sin(theta) + f1.*cos(theta);
  exp2 = b.*pi.*exp2.^c;
  exp2 = abs(sin(exp2));
  exp2 = a.*exp2.^d;
  if sum(exp2) == 0.0
    constr(1) = 0.0;
  else
    constr(1) = 1.0 - exp1./exp2;
  end
  y = [f1;f2];
end
