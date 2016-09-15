function Initialization(FlagInit)
% function Initialization(FlagInit)
% Allows the initialization of the Decision Variables
% Input arguments
%  FlagInit : 'New', start a new population from scratch if the constraints
%             are violated it does not add this Decision Variables (DV) to the
%             population.
%             If the DV are real values then it creates them using the
%             ranges of the variables. If the DV are Binary then it creates
%             a random set of zeros and ones.
%
%             'Continue', loads the values form a previous analysis into
%             the population the only variable to be updated is the
%             population size (npop) of each island
%
%
% Output arguments
% []  : empty becasue it modifies the population in the islands
%
% Created by
% MSc Mario Castro Gama
% PhD researcher 
% IWSG Hydroinformatics
% Last update 2016-03-02
%

  global islands
  global VarMax
  global VarMin
  global nislands
  global npop
  global nviolate
  global nvar
  global EvaluateObjective
  global CrossType
  
  
  switch FlagInit
    case 'New'
      switch CrossType
        case 'SBX';
          islands = [];
          rangevar = (VarMax - VarMin);
          for r = 1: nislands;
            islands(r).pop = CreateEmptyIndividuals(npop(r));
            ipop = 0;
            while ipop <npop(r);
              flag = nviolate;
              DV = VarMin +  rangevar.* rand(1,nvar);
              [OF, CO] = EvaluateObjective(DV);
              if (nviolate-flag)==0;
                ipop = ipop+1;
                islands(r).pop(ipop).DecisionVariables  = DV;
                islands(r).pop(ipop).ObjectiveFunctions = OF;
                islands(r).pop(ipop).Constraints        = CO;
              end
            end
            clear DV OF
            [islands(r).pop, F] = NonDominatedSorting(islands(r).pop);
            islands(r).pop      = CalcCrowdingDistance(islands(r).pop, F);
          end % r
        case 'Binary'
          islands = [];
          for r = 1: nislands;
            islands(r).pop = CreateEmptyIndividuals(npop(r));
            ipop = 0;
            while ipop < npop(r); %% I'm correcting here
              flag = nviolate;
              DV = randi(2,1,nvar)-1;
              [OF, CO] = EvaluateObjective(DV);
              if (nviolate-flag)==0;
                ipop = ipop+1;
                islands(r).pop(ipop).DecisionVariables  = DV;
                islands(r).pop(ipop).ObjectiveFunctions = OF;
                islands(r).pop(ipop).Constraints        = CO;
              end % violates?
            end % while
            clear DV OF
            [islands(r).pop, F] = NonDominatedSorting(islands(r).pop);
            islands(r).pop      = CalcCrowdingDistance(islands(r).pop, F);
          end % r
      end % CrossType
    case 'Continue'
      nislands = length(islands);
      for r = 1:nislands
        npop(r) = numel(islands(r).pop);
      end % r
  end % FlagInit
end % function