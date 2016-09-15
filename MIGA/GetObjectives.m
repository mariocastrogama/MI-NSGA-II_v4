function [objs] = GetObjectives(pop)
% function [objs] = GetObjectives(pop)
% Reshape objective functions of a population.
% Extracts the values of each member of the population and arranges it as a
% matrix.
%
% Input Arguments
% pop : structure containing a population
%
% Output Arguments
% objs : matrix of the objectives, useful for calculations
%
% Developed by
% MSc Mario Castro Gama
% PhD Researcher IWSG, UNESCO-IHE
% Last update 2016-03-04
%
  global nobj
%   % This one works with OF as [npop x nobj]
%   objectives = reshape([pop.ObjectiveFunctions],nobj,[]);
  
  % This one is the trial version with OF as [npop x nobj]
  objs = reshape([pop.ObjectiveFunctions],nobj,[])';
end