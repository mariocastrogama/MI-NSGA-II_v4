clc;
clear;

po = [28, 10, 8/3];
[to, xo] = mylorenz(po);

nsim  = 2000;%1000;
param = zeros(nsim,3);
OF    = zeros(nsim,3);
tic;
for isim = 1:nsim
  param(isim,1) = 25.0 + 5.0*rand;
  param(isim,2) =  7.5 + 5.0*rand;
  param(isim,3) =  1.0 + 4.0*rand;
  
  pi = param(isim,:);
  [ti, xi] = mylorenz(pi);
  xq = interp1(ti,xi,to); % interpolate
  
  OF1 = sum(abs(xq-xo));
  OF(isim,:) = OF1;%sum(abs(xq-xo));
end
toc;

f = paretofront(OF);
selpareto = find(f==1);
[hh] = PlotObjectives3DM(OF);