function p = BinaryTournamentSelection(pop)
% function p = BinaryTournamentSelection(pop)
% This function selects the elements using Binary Tournament Selection
%
% Input arguments
%  pop : Population containing the memebers to be selected
% Output arguments
%  p   : selected parent 
% 
% Created by
% MSc Mario Castro Gama
% PhD Researcher
% IWSG UNESCO-IHE
% Last Update 2016-03-04
%
  npop_curr = numel(pop);
  i = round(1+(npop_curr-1)*rand(1,2));
  while (i(1) == i(2)); % update one if they are the same
    i(2) = round(1+(npop_curr-1)*rand); 
  end % while
  p1 = pop(i(1));
  p2 = pop(i(2));
  if (p1.Rank < p2.Rank)
    p = p1;
  elseif (p1.Rank > p2.Rank)
    p = p2;
  else
    if p1.CrowdingDistance > p2.CrowdingDistance
      p = p1;
    else
      p = p2;
    end
  end % if
end % function