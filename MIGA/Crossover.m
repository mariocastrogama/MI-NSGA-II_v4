function ch = Crossover(p1,p2)
% function ch = Crossover(p1,p2)
% Implements crossover operation
%
% Input arguments
%  p1 and p2 : 2 parents of population
% Output arguments
%  gernerates 2 children from the parents 
%
% Created by
% MSc Mario Castro Gama
% PhD Researcher
% IWSG UNESCO-IHE
% Last Update 2016-03-04
%
  global nvar
  global CrossType
  global VarMax
  global VarMin
  global BoundType
%   global nc
%   global nc_1
  switch CrossType
    case 'Binary'
  	  x1	    = p1.DecisionVariables;
  	  x2      = p2.DecisionVariables;
  	  ch      = CreateEmptyIndividuals(2);
  	  [a1,a2] = Binarybreak; % create two points of break
      tmp = x1(1,a1:a2);
      x1(1,a1:a2) = x2(1,a1:a2);
      x2(1,a1:a2) = tmp;
      ch(1).DecisionVariables = x1;
      ch(2).DecisionVariables = x2;
    case 'SBX'
      x1    = p1.DecisionVariables;
      x2    = p2.DecisionVariables;
      uj    = rand(1,nvar);
      bq    = SBXdistribution(uj);
      y1    = 0.5*(((1 + bq).*x1) + (1 - bq).*x2);
      y2    = 0.5*(((1 - bq).*x1) + (1 + bq).*x2);
      ch    = CreateEmptyIndividuals(2);
      ch(1).DecisionVariables = CheckBoundaries(y1);
      ch(2).DecisionVariables = CheckBoundaries(y2);
    case 'UNDX'
      x1    = p1.DecisionVariables;
      x2    = p2.DecisionVariables;
      alpha = rand(1,nvar);
      y1    = alpha.*x1 + (1-alpha).*x2;
      y2    = alpha.*x2 + (1-alpha).*x1;
      ch    = CreateEmptyIndividuals(2);
      ch(1).DecisionVariables = CheckBoundaries(y1);
      ch(2).DecisionVariables = CheckBoundaries(y2);
    case 'DE'
      % Still to develop requires 4 members of population
  end
end