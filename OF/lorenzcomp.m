function [f,c] = lorenzcomp(x)
  global nfuneval  
  
  % Known values of Lorenz
  po = [28, 10, 8/3];
  [to, yo] = mylorenz(po);
  
  % Estimate with x
  [ti, yi] = mylorenz(x);
  yq = interp1(ti,yi,to);
  
  % Obtain the absolute error for each variable
  f = abs(sum(yq-yo));
  c = [];
  nfuneval = nfuneval + 1;
end