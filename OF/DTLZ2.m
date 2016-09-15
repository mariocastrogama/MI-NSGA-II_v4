function [objs, const] = DTLZ2(x)
  global nfuneval
  global nviolate
  global nvar
  global nobj
  
  g = sum((x(nobj:nvar) - 0.5*ones(1, nvar-nobj+1)).^2);
  objs = (1+g)*ones(1, nobj);
  for i=1:nobj
    for j=1:nobj-i
      objs(i) = objs(i) * cos(0.5 * pi * x(j));
    end
    if i > 1
      objs(i) = objs(i) * sin(0.5 * pi * x(nobj-i+1));
    end
  end
  const = [];
  nfuneval = nfuneval +1;
end

