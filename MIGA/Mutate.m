function [q] = Mutate(p)
% Mutate.m : implements the mutation operator
% Accepts 
% MutType which can be Random or Polinomial for Real variables
% MutType can Flipbit for Binary variables
% MutType can be Swap for Real, Binary or integers, or Permutations
%
% Developed by: 
% MSc. Mario Castro-Gama
% 2016-05-20
% 2016-11-10, included the 'Swap' required for Permutations
  global nvar;
  global MutType;
  global VarMin;
  global VarMax;
  global probab_mut
  global nm % Exponent of Mutation
  global nm_1
  
  q = CreateEmptyIndividuals();
  y = p.DecisionVariables;
  switch MutType
    case 'Swap'
      % Can be applied to real, integers and permutations
      % Exchanges the values of two positions in the same Chromosome
      for j = 1:nvar
        % because probab_mut is low find lower value
        if rand < probab_mut 
          ii    = randi(nvar);
          tmp   = y(j);
          y(j)  = y(ii);
          y(ii) = tmp;
        end
      end
    case 'Flipbit'
      % This one is explicitly intended for binary decision variables
      for j = 1:nvar
        if rand < probab_mut % because probab_mut is low find lower value
          y(j) = 1-y(j);
        end
      end
    case 'Random'
      % This one is explicitly intended for real decision variables
      for j = 1:nvar
        if rand < probab_mut
          y(j) = VarMin(j) + (VarMax(j) - VarMin(j)) * rand; 
          % y(j)=unifrnd(VarMin,VarMax); % if you have Statistical Toolbox
        end
      end
    case 'Polinomial'
      % This one is explicitly intended for real decision variables
      for j=1:nvar
        if rand < probab_mut
          rj = rand;
          if (rj < 0.5)
            delta_1 = (y(j) - VarMin(j))/(VarMax(j)-VarMin(j));
            delta_q = (2*rj+(1-2*rj)*(1-delta_1)^(nm+1))^nm_1 - 1;
          else
            delta_2 = (VarMax(j) - y(j))/(VarMax(j)-VarMin(j));
            delta_q = 1 - (2*(1-rj)+2*(rj-0.5)*(1-delta_2)^(nm+1))^nm_1;
          end
          y(j) = y(j) + delta_q.*(VarMax(j) - VarMin(j));
        end
      end
  end
  % Check boundaries and return values
  q.DecisionVariables = CheckBoundaries(y);
end
