%  NonDominatedSorting.m : implements the non-dominated sorting procedures 
function [pop, F]=NonDominatedSorting(pop)
%   global npop;
  npop_curr = numel(pop);
  F{1} = [];
  for ipop = 1:npop_curr
    p = pop(ipop);
    p.DominationSet  = [];
    p.DominatedCount = 0;
    for jpop = 1:npop_curr
      if (jpop == ipop)
        continue;
      end
      q = pop(jpop);
      if Dominates(p.ObjectiveFunctions, q.ObjectiveFunctions)
        p.DominationSet = [p.DominationSet, jpop];
      elseif Dominates(q.ObjectiveFunctions, p.ObjectiveFunctions)
        p.DominatedCount = p.DominatedCount + 1;
      end
    end % jpop
    if (p.DominatedCount == 0);
      p.Rank = 1;
      F{1} = [F{1}, ipop];
    end
    pop(ipop) = p;
  end % ipop
  
  f = 1;
  while true
    Q = [];
    for ipop = 1:numel(F{f})
      p = pop(F{f}(ipop));
      for jpop = 1:numel(p.DominationSet)
        q = pop(p.DominationSet(jpop));
        q.DominatedCount = q.DominatedCount-1;
        if (q.DominatedCount == 0)
          q.Rank = f+1;
          Q = [Q, p.DominationSet(jpop)];
        end
        pop(p.DominationSet(jpop)) = q;
      end % jpop
    end % ipop
    if isempty(Q)
      break;
    end % isempty(Q)
    F{f+1} = Q;
    f = f+1;
  end % while
end % Function