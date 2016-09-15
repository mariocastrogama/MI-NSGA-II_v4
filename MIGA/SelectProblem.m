function [problem, flag]=SelectProblem()
% Library of functions implemented with MI-NSGA-II
  global EvaluateObjective
  global VarMin
  global VarMax
  global nvar
  global nobj
  global ncon
  list_problems = {'Ray, Tai & Seow','Ray, Tai & Seow Modified','Tanaka','Rosen & Suzuki','Kursawe','Rosenbrock','Rosenbrock Extended',...
    'DTLZ1','DTLZ2','ZDT3','MOP7',...
    'Viennet','Lorenz','Osyczka & Kundu','Binh TF4',...
    'ConstrEx','CTP1','BinhKorn_TF1','BinhKorn_TF2','BinhKorn_TF3',...
    'UF1','UF2','UF3','UF4','UF5'};
  [s,~] = listdlg('PromptString','Select a Problem to solve:','SelectionMode','single','ListString',list_problems);
  if isempty(s)
    disp('No problem selected');
    problem =[];
    flag = 0;
    return
  else
    problem = list_problems{s};
    flag = 1;
    switch s
      case 1
        EvaluateObjective = @RayTaiSeow;                    % Define the problem to solve
        nvar = 3;                                           % number of unknown variables
        VarMin = [0.01, 0.01, 0.01];                        % lower bound of unknown variables
        VarMax = [0.45, 0.10, 0.10];                        % upper bound of unknown variables
      case 2
        EvaluateObjective = @RayTaiSeowModified;            % Define the problem to solve
        nvar = 3;                                           % number of unknown variables
        VarMin = [0.01, 0.01, 0.01];                        % lower bound of unknown variables
        VarMax = [0.45, 0.10, 0.10];                        % upper bound of unknown variables  
      case 3
        EvaluateObjective = @Tanaka;                     % Define the problem to solve
        nvar = 2;                                        % number of unknown variables
        VarMin = [0, 0];                                 % lower bound of unknown variables
        VarMax = [pi, pi];                               % upper bound of unknown variables
      case 4
        EvaluateObjective = @RosenSuzuki;                 % Define the problem to solve
        nvar   = 4;                                       % number of unknown variables
        VarMin = -3.0 + zeros(1,nvar);                    % lower bound of unknown variables
        VarMax = +3.0 + zeros(1,nvar);                    % upper bound of unknown variables
      case 5
        EvaluateObjective = @Kursawe;                     % Define the problem to solve  
        nvar   = 3;                                       % number of unknown variables
        VarMin = -5.0 + zeros(1,nvar);                    % lower bound of unknown variables
        VarMax = +5.0 + zeros(1,nvar);                    % upper bound of unknown variables
      case 6
        EvaluateObjective = @Rosenbrock;                  % Define the problem to solve  
        nvar   = 2;                                       % number of unknown variables
        VarMin = -2.048 + zeros(1,nvar);                  % lower bound of unknown variables
        VarMax = +2.048 + zeros(1,nvar);                  % upper bound of unknown variables
      case 7
        EvaluateObjective = @RosenbrockExtended;          % Define the problem to solve  
        nvar   = 4;                                       % number of unknown variables
        VarMin = -30 + zeros(1,nvar);                  % lower bound of unknown variables
        VarMax = +30 + zeros(1,nvar);                  % upper bound of unknown variables
      case 8
        EvaluateObjective = @DTLZ1;             % Define the problem to solve  
        nobj = 3;
        nvar = 10;
        VarMin = zeros(1,nvar);
        VarMax = ones(1,nvar);
      case 9
        EvaluateObjective = @DTLZ2;          % Define the problem to solve  
        nobj = 3;
        nvar = nobj+9;
        VarMin = zeros(1,nvar);
        VarMax = ones(1,nvar);
      case 10
        EvaluateObjective = @ZDT3;
        nvar   = 30;            % number of unknown variables
        VarMin = zeros(1,nvar); % lower bound of unknown variables
        VarMax = ones(1,nvar);  % upper bound of unknown variables
      case 11
        EvaluateObjective = @MOP7; % The 7th function of the Van Valedhuizen's test suite.
        nvar = 2;
        VarMin = -400*ones(1,nvar);
        VarMax =  400*ones(1,nvar);
      case 12
        EvaluateObjective = @Viennet;
        nvar = 2;
        VarMin = -3*ones(1,nvar);
        VarMax =  3*ones(1,nvar);
      case 13
        EvaluateObjective = @lorenzcomp;
        nvar = 3;
        VarMin = [25.0  5.0  1.0];
        VarMax = [30.0 15.0 10.0];
      case 14
        EvaluateObjective = @OsyczkaKundu;
        nvar = 6;
        VarMin = [ 0  0 1 0 1  0];
        VarMax = [10 10 5 6 5 10];
      case 15
        EvaluateObjective = @Binh_TF4;
        nvar = 2;
        VarMin = [-7.0 -7.0];
        VarMax = [+4.0 +4.0];
      case 16
        EvaluateObjective = @ConstrEx;
        nvar = 2;
        VarMin = [-0.1  0.0];
        VarMax = [+1.0  5.0];
      case 17
        EvaluateObjective = @CTP1;
        nvar = 2;
        VarMin = [0.0  0.0];
        VarMax = [1.0  1.0];
      case 18
        EvaluateObjective = @BinhKorn_TF1;
        nvar = 2;
        VarMin = [-20.0 -20.0];
        VarMax = [ 20.0  20.0];
      case 19
        EvaluateObjective = @BinhKorn_TF2;
        nvar = 2;
        VarMin = [-10.0 -10.0];
        VarMax = [ 10.0  10.0];
      case 20
        EvaluateObjective = @BinhKorn_TF3;
        nvar = 2;
        VarMin = [-15.0 -15.0];
        VarMax = [ 30.0  30.0];
      case 21
        EvaluateObjective = @UF1;               % Define the problem to solve  
        nvar   = 30;                            % number of unknown variables
        VarMin = [0, -ones(1,nvar-1)];          % lower bound of unknown variables
        VarMax = ones(1,nvar);                  % upper bound of unknown variables
      case 22
        EvaluateObjective = @UF2;               % Define the problem to solve  
      case 23
        EvaluateObjective = @UF3;               % Define the problem to solve  
      case 24
        EvaluateObjective = @UF4;               % Define the problem to solve  
      case 25
        EvaluateObjective = @UF5;               % Define the problem to solve  
    end % switch
    [OF, CO] = EvaluateObjective(zeros(1,nvar));           % number of objective functions
    nobj = length(OF);
    ncon = length(CO);
  end %isempty
end
