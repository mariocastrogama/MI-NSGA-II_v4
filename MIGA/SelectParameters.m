function [answer]=SelectParameters(problem)
  disp('MI-NSGA-II');
  disp(['Problem Selected      : @',problem])
  prompt={'Enter the number of islands:','Enter the population size:',...
    'Enter the number of generations:','Crossover prob. [0.0 , 1.0]',...
    'Mutation prob. [0.0 , 1.0]','Migration prob. [0.00 , 0.10]'};
  numlines = 1;
  name                = 'MI-MOOGA tool';
  defaultanswer       = {'1','100','1000','1.00','0.01','0.05'};
  options.Resize      = 'on';
  options.WindowStyle = 'normal';
  options.Interpreter = 'tex';
  answer = inputdlg(prompt,name,numlines,defaultanswer,options);
  drawnow;
  if ~isempty(answer)
    disp(['Number of Islands     : ',answer{1}]);
    disp(['Population per island : ',answer{2}]);
    disp(['Number of Generations : ',answer{3}]);
    disp(['Crossover probability : ',answer{4}]);
    disp(['Mutation probability  : ',answer{5}]);
    disp(['Migration probability : ',answer{6}]);
    disp(' ');
  else
    disp('Cancelled');
  end
%   clear defaultanswer numlines options prompt name ans
end