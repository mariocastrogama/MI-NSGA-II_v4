function [a1,a2] = Binarybreak
  global nvar
  a1 = randi([1 floor(nvar/2)]);   % from the first half
  a2 = randi([ceil(nvar/2) nvar]); % from the first half
  while (a1 == a2)
    a2 = randi([ceil(nvar/2) nvar]);
  end
  if a2<a1; % not really needed
    tmp = a1; a1 = a2; a2 = tmp;
  end
end