% load GAA benchmark obtained by
% Matthew Woodruff
%
 
clc;
clear;
close all;
fclose all;
format long g; 

nvar = 27;
nobj = 10;

% filename = [num2str(nvar),'_',num2str(nobj),'_1.0.recalc'];
% data=load(filename);


% filename = 'GAA_27_10_benchmark.csv';
filename = 'GAA_27_10_benchmark_ALL.csv';
% filename = 'GAA_27_10_benchmark_Borg.csv';
% filename = 'GAA_27_10_benchmark_eMOEA.csv';

data=load(filename);
vars = data(:,1:27);
objs = data(:,28:37);
objs(:,2) = objs(:,2)/1000;
objs(:,5) = objs(:,5)/100;
objs(:,6) = objs(:,6)/1000;
objs(:,7) = objs(:,7)/1000;
maxPFPF = max(objs(:,10));
minPFPF = min(objs(:,10));
objs(:,10) = minPFPF + objs(:,10)/(maxPFPF - minPFPF);

%% All possible tradeoffs 2D
all_combos = nchoosek(1:10,4);
ncombos = size(all_combos,1);

DVnames = {'CSPD2','AR2','SWEEP2','DPROP2','WINGLD2','AF2','SEATW2','ELODT2','TAPER2',...
           'CSPD4','AR4','SWEEP4','DPROP4','WINGLD4','AF4','SEATW4','ELODT4','TAPER4',...
           'CSPD6','AR6','SWEEP6','DPROP6','WINGLD6','AF6','SEATW6','ELODT6','TAPER6'};
OFnames = {'NOISE [dB]','WEMP [10^{3}lb]','DOC [USD/hr]','ROUGH [Ratio]','WFUEL [10^{2}lb]',...
           'PURCH [10^{3}USD]','RANGE [10^{3}nmi]','LDMAX [Ratio]','VCMAX [Knots]','PFPF [Ratio]'};

for icombo = 1: 28;%ncombos;
  sel_var = all_combos(icombo,:);
  byColor = 3;
  bySize  = 4;
  ncolor  = 20;
  nsizes  = 6;
  out_clr = [1, 0, 0; 1 1 0; 0 0.65 1];
 [h2A,idx2A] = PlotObjectivesMv2(objs(:,sel_var),OFnames(:,sel_var),{},byColor,bySize,ncolor,nsizes,out_clr);
end