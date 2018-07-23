function [y1, y2] = cross2points(x1,x2)
% function [y1, y2] = cross2points(x1,x2)
% Specifically designed for decision variables which correspond to 
% permutations. Example Traveling Salesman Problem requires a set of integers of 
% which cities and in which order, however, there is no need to visit a city twice.
%
%  Developed by  : Mario Castro Gama
%                  MSc. Hydroinformatics
%  e-mail        : m.e.castrogama@hhs.nl
%
%  last update   : 2017-11-13

  global nvar
  
  % Select 2 break points
  [a1,a2] = Binarybreak; % create two points of break
  
  % select exchange values in between parents
  tmp1 = x1(1,a1:a2);
  tmp2 = x2(1,a1:a2);
  
  % create children decision variables
  y1   = zeros(1,nvar);
  y2   = zeros(1,nvar);
  
  % fill in the values which where selected in each Children
  % coming from the other Parent
  y1(1,a1:a2) = tmp2;
  y2(1,a1:a2) = tmp1;
  
  % Now mark the values which already exists in each chromosome
  miss1       = zeros(1,nvar);
  miss1(tmp2) = -1; % Negative means marked
  miss2       = zeros(1,nvar);
  miss2(tmp1) = -1; % Negative means marked
  
  % Check if value already exist in the parent
  for ii = [1:a1-1, a2+1:nvar]
    if isempty(find(tmp1 == x2(ii)))
      % if enters here the value in the original parent is different from the crossover
      % and must remain in the children
      % also mark the missing value as negative, it mean that value already
      % exists
      y2(ii) = x2(ii);
      miss2(x2(ii)) = -1;
    end
    % Do it also for the second children
    if isempty(find(tmp2 == x1(ii)))
      y1(ii)        = x1(ii);
      miss1(x1(ii)) = -1;
    end
  end % for

  % find missing values, it means the ones which remain ZERO
  miss1 = find(miss1==0);
  miss2 = find(miss2==0);
  % find length of missing values for each children
  n1 = length(miss1);
  n2 = length(miss2);
  % Create a random permutation of missing values
  miss1 = miss1(randperm(n1,n1));
  miss2 = miss2(randperm(n2,n2));
  % Assign missing values to the children
  y1(y1 == 0) = miss1;
  y2(y2 == 0) = miss2;
end % function