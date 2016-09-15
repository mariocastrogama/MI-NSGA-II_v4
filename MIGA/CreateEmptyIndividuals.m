%  CreateEmptyIndividuals.m : creates a strucures containing the required fields         
function [pop] = CreateEmptyIndividuals(n)
  if (nargin < 1)
    n = 1;
  end
  individual.DecisionVariables  = [];
  individual.ObjectiveFunctions = [];
  individual.Constraints        = [];
  individual.Rank               = [];
  individual.CrowdingDistance   = [];
  individual.DominatedCount     = [];
  individual.DominationSet      = [];
%   individual.F                 = {};
  pop = repmat(individual,n,1);
end