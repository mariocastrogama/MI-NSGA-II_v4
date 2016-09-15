function bq = SBXdistribution(u)
% Required for Crossover SBX
  global nvar
  global nc_1
  bq = zeros(1,nvar);
  for j=1:length(u)
    if u(j) <= 0.5
      bq(j) = (2.0*u(j))^nc_1;
    else
      bq(j) = (1.0/(2.0*(1-u(j))))^nc_1;
    end
  end
end