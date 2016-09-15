function [OF] = ObjectiveFunction2(pop)
%  ObjectiveFunction2.m : gathers OF of a population
  global nobj
  OF = reshape([pop.ObjectiveFunctions],nobj,[]);
end