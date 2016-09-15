%  SortPopulation.m : performs sort operation according to      
%                     rank and crowding distance, and           
%                     prepares population before selection      
function [pop, F] = SortPopulation(pop,F)
  % First order by Crowding Distance
  CD            = [pop.CrowdingDistance];
  [~, CD_order] = sort(CD,'descend');
  pop           = pop(CD_order); % Orders population in the new order by CD
  
  % Then order by Rank
  Rk            = [pop.Rank];
  [~, Rk_order] = sort(Rk);
  pop           = pop(Rk_order); % Orders population in the new order by Rank
  
  % identify the members of the population for each front once again
  for ifront = 1:numel(F);
    new_F = find([pop.Rank] == ifront);
    F{ifront} = new_F;
  end
end