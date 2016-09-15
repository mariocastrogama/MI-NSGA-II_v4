function [q] = Mutate(p)
% Mutate.m : implements the mutation operator
% Accepts MutType which can be Random or Polinomial
% 
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
    case 'Flipbit'
      for j = 1:nvar;
        if rand < probab_mut % because probab_mut is low find lower value
          y(j) = 1-y(j);
        end
      end
    case 'Random'
      for j = 1:nvar;
        if rand < probab_mut
          y(j) = VarMin(j) + (VarMax(j) - VarMin(j)) * rand; 
          % y(j)=unifrnd(VarMin,VarMax); % if you have Statistical Toolbox
        end
      end
    case 'Polinomial'
      for j=1:nvar;
        if rand < probab_mut
          rj = rand;
          if rj < 0.5;
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
  q.DecisionVariables = y;
end