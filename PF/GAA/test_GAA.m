% loads General Aviation benchmark obtained from Matthew Woodruff
% and compare with the matlab execute function.
% Results are contained in a benchmark file located in GitHub
% 
%
%
% This script is free software: you can redistribute it and/or modify
% it under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% This script is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
% GNU Lesser General Public License for more details.
% You should have received a copy of the GNU Lesser General Public License
% along with this script. If not, see <http://www.gnu.org/licenses/>.
% ===================================================================
% Developed by:
% PhD Mario Castro Gama
% Researcher UNESCO-IHE
% 2016-08-01
%

clc;
clear;
close all;
fclose all;
format long g; 

nvar = 27;
nobj = 10;

%% load file containing the data of 27 decision variables and 10 objectives
filename = 'GAA_27_10_benchmark.csv';
data     = load(filename);
nfeval   = size(data,1);
vars     = data(:,1:nvar);
objs     = data(:,nvar+1:end);
clear data;

%% create new arrays and evaluate GAA
objs2  = zeros(nfeval,10);
cons2  = zeros(nfeval,1);
for ii = 1:nfeval;
  [obji, consi] = GAA_Evaluate(vars(ii,:));
  objs2(ii,:) = obji;
  cons2(ii,1) = consi;
end
clear ii consi obji;

%% Find the maximum of the absolute error for all 10 objectives
MAXerrOF = max(max(abs(objs(1:nfeval,:)-objs2)));
disp(['Maximum error Benchmark vs MATLAB : ',num2str(MAXerrOF)]);