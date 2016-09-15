%  Multiple Island Non-dominated Sorting Genetic Algorithm II (MI-NSGA-II)
%  Developed by  : Mario Castro Gama
%                  MSc. Hydroinformatics
%  e-mail        : m.castrogama@unesco-ihe.org
%  MI_NSGA_II.m  : main file of the program
%  last update   : 2016-05-09, updated folders to display strcuture of files
%  last update   : 2016-05-11, updated probab_mut nad probab_cro to global
%  variables
%
clc;
% clear all;
close all;  
fclose all;

global nvar
global nobj
global ncon
global VarMin
global VarMax
global islands
global nislands
global npop
global igen
global ngen
global nmigra
global nc
global nc_1
global nm
global nm_1
global probab_cro
global probab_mut
global probab_mig

global CrossType
global BoundType
global MutType
global MigType
global nfuneval
global nfuneval_ini
global nviolate
global nviolate_ini
global EvaluateObjective                     % Defines the problem to solve

%% Define Problem
[problem,FlagProblem] = SelectProblem;
if FlagProblem == 1;
  % This part needs to become a MENU, there are many parameters and values
  % to pass to the function
  [answer] = SelectParameters(problem);
  if isempty(answer);
    clear nvar nobj VarMin VarMax islands npop ngen MutType nm nm_1 nislands
    clear nfuneval nfuneval_ini nviolate nviolate_ini
    clear EvaluateObjective answer
    disp('Operation cancelled');
  else
    tic;
    nfuneval = 0;
    nviolate = 0;
    
    %% Parameters of GA
    nislands   = str2double(answer{1});                    % Number of Islands (Parallel populations)
    npop       = str2double(answer{2})*ones(1,nislands);   % main population size per island
    ngen       = str2double(answer{3});                    % maximum number of iterations
    
    % Crossover
    CrossType  = 'SBX'; %'Binary'; %'UNDX';                % Crossover type
    nc         = 30.0;                                     % Index of Crossover
    nc_1       = 1.0 / (nc+1);
    probab_cro = str2double(answer{4});                    % Crossover ratio
    ncross     = round(probab_cro*npop/2)*2;               % Number of parents (also offsprings)
    BoundType  = 'Limit'; %'Reflective';  
    
    % Mutation
    MutType    = 'Polinomial'; %'Flipbit'; %  'Random';   % Mutation Type
    probab_mut = str2double(answer{5});                    % Probability of mutation
    nm         = 15.0;                                     % Index of Mutation
    nm_1       = 1.0 / (nm+1);
    nmutat     = round(probab_mut*npop);                   % number of mutants
    
    % Parameters of Migration
    MigType    = 'Random';                                 % Migration Type
    probab_mig = str2double(answer{6});                    % Probability of migration
    nmigra     = round(probab_mig*npop);                   % number of migrants
    FlagPlot   = [0 0 1];                                  % Plot Options       : (1) Plot, [DV, CO, OF], (0) No Plot
    FlagXLS    = 1;                                        % Store in XLS Option: (1) Write XLS, (0) Do Nothing
    
    clear answer
    
    tic;
    % Initialization - Creates a new population/ Or continue from a previous one
    FlagInit     = 'New';% 'Continue'; % 
    Initialization(FlagInit);
    nviolate_ini = nviolate;
    nfuneval_ini = nfuneval;
    disp('  igen/ngen, time [s], n-feval(n-fviol), Population/Island');
    disp(['     0/',sprintf('%4d',ngen),',',sprintf('%9.2f',toc),',',sprintf('%8d',nfuneval),'(',sprintf('%7d',nviolate),'),',sprintf('%5d\t',npop)]);
    
    [DVscales,COscales,OFscales,DVnames,OFnames,COnames]=create_namesall;
    
    
    %% Main loop
    % The iteration occurs here among number of generations
    % for each of the islands where a population resides
    %
    totaltime = 0;
    time_frac = tic;
    igen = 0;
    while (igen < ngen );%|| (nfuneval >maxfuneval));
      tic;
      igen = igen + 1;
      for r = 1:nislands;
        if npop(r) > 0;
          % Crossover
          pop2 = CreateEmptyIndividuals(ncross(r));
%           k=0;
%           while k <ncross(r)/2
%             k=k+1;
%             idx = randperm(npop(r),2);
%             ch = Crossover(islands(r).pop(idx(1)),islands(r).pop(idx(2)));
%             [ch(1).ObjectiveFunctions, ch(1).Constraints] = EvaluateObjective(ch(1).DecisionVariables);
%             [ch(2).ObjectiveFunctions, ch(2).Constraints] = EvaluateObjective(ch(2).DecisionVariables);
%             pop2(2*k-1) = ch(1);
%             pop2(2*k)   = ch(2);
%           end
          for k = 1:ncross(r)/2;
            p1 = BinaryTournamentSelection(islands(r).pop);
            p2 = BinaryTournamentSelection(islands(r).pop);
            ch = Crossover(p1,p2); % Execute crossover
            [ch(1).ObjectiveFunctions, ch(1).Constraints] = EvaluateObjective(ch(1).DecisionVariables);
            [ch(2).ObjectiveFunctions, ch(2).Constraints] = EvaluateObjective(ch(2).DecisionVariables);
            pop2(2*k-1) = ch(1);
            pop2(2*k)   = ch(2);
          end % k, crossover
          clear ch p1 p2 k p1 p2 ch
          
          % Mutation
          pop3 = CreateEmptyIndividuals(nmutat(r));
          for k = 1:nmutat(r);
            p = BinaryTournamentSelection(islands(r).pop);
            q = Mutate(p); % Execute mutate
            [q.ObjectiveFunctions, q.Constraints] = EvaluateObjective(q.DecisionVariables);
            pop3(k) = q;
          end % k, mutation
          clear p q k
          
          if and(nislands > 1, nmigra(r)>0);
            % Migrate some population with probability 'probab_mig'
            if npop(r) > nmigra(r);
              for k = 1:nmigra(r);
                jmig        = randi(npop(r));  % which member of population of THIS island
                jmig_island = randi(nislands); % to which island must migrate
                npop(r)     = npop(r) - 1;
                npop(jmig_island) = npop(jmig_island) + 1; % update size of population
                islands(jmig_island).pop(end+1,1) = islands(r).pop(jmig); % migrate the selected one
              end % k, migration do it until all migrants have departed = nmigra(r)
              clear k jmig jmigisland
            end % if (npop > nmigra(r))
          end % and(nislands > 1, nmigra(r)>0);
          
          islands(r).pop      = [islands(r).pop; pop2; pop3];
          islands(r).F        = {};
          % numel(islands(r).pop) % show number of elements
          
          clear pop2 pop3
          % this one works.
          % [islands(r).pop, F] = NonDominatedSorting(islands(r).pop);
          %  islands(r).pop      = CalcCrowdingDistance(islands(r).pop, F);

          % this is the trial version where the front is presented inside
          % the population
          [islands(r).pop, F] = NonDominatedSorting(islands(r).pop);
          islands(r).pop      = CalcCrowdingDistance(islands(r).pop, F);
          [islands(r).pop, F] = SortPopulation(islands(r).pop, F);
          islands(r).F = F;
          
          % This one will
          % work with small popuations or Pareto fronts hard to achieve 
          % if new_npop > npop(r); npop(r) = new_npop; end; 
          
          % Update population size
          islands(r).pop      = islands(r).pop(1:npop(r));
        end % npop(r) > 0;
      end % r, islands
      clear r
      itertime  = toc;
      totaltime = totaltime + itertime;
      if or(~mod(igen,round(ngen/10)),(igen == ngen)); % Do ti every x% or when is the last generation
        time_frac = toc(time_frac);
        disp(['  ',sprintf('%4d',igen),'/',sprintf('%4d',ngen),', ',sprintf('%8.2f',time_frac),',',sprintf('%8d',nfuneval),'(',sprintf('%7d',nviolate),'),',sprintf('%5d\t',npop)]);
        if FlagPlot(1) == 1;
          PlotDecision(islands,DVscales,DVnames);
        end
        if FlagPlot(2) == 1;
          PlotConstraints(islands,COscales,COnames);
        end
        if FlagPlot(3) == 1;
          PlotObjectives(islands,OFscales,OFnames);
        end
        time_frac = tic;
      end
      %     PlotFronts(island(nislands).pop,F);
    end % igen
    disp('_______________________________________________________');
    disp(['Total time       :',sprintf('%8.2f',totaltime),' [s]']);
    if isnan(nviolate_ini/nfuneval_ini); 
      pv = 0; 
    else
      pv = nviolate_ini/nfuneval_ini; 
    end
    disp('  ');
    disp(' During Initialization');
    disp(['  nviolate (ini) :',sprintf('%8.0d',nviolate_ini),', (',sprintf('%3.2f',pv*100),'%)']);
    disp(['  nfuneval (ini) :',sprintf('%8.0d',nfuneval_ini),', (',sprintf('%3.2f',100),'%)']);
    disp('---------------------------------------------');
    disp(' During MOO');
    disp(['  nviolate (gen) :',sprintf('%8.0d',nviolate-nviolate_ini),', (',sprintf('%3.2f',(nviolate-nviolate_ini)/(nfuneval-nfuneval_ini)*100),'%)']);
    disp(['  nfuneval (gen) :',sprintf('%8.0d',nfuneval-nfuneval_ini),', (',sprintf('%3.2f',100),'%)']);
    if FlagPlot(1) == 1;
      PlotDecision(islands,DVscales,DVnames);     % Plot Decision Variables
    end
    if FlagPlot(2) == 1;
      PlotConstraints(islands,COscales,COnames);  % Plot Constraints
    end
    if FlagPlot(3) == 1;
      PlotObjectives(islands,OFscales,OFnames);   % Plot Functions
    end
    if FlagXLS
      MIGAwriteXLS(FlagXLS,problem,DVnames,COnames,OFnames); % Store into XLS file
    end
  end %if isempty(answer)
end %FlagProblem