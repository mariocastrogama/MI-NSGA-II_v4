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


%%
clc;
DVnames = {'CSPD2','AR2','SWEEP2','DPROP2','WINGLD2','AF2','SEATW2','ELODT2','TAPER2',...
           'CSPD4','AR4','SWEEP4','DPROP4','WINGLD4','AF4','SEATW4','ELODT4','TAPER4',...
           'CSPD6','AR6','SWEEP6','DPROP6','WINGLD6','AF6','SEATW6','ELODT6','TAPER6'};
OFnames = {{'NOISE [dB]'},{'WEMP [10^{3}lb]'},{'DOC [USD/hr]'},{'ROUGH [Ratio]'},{'WFUEL [10^{2}lb]'},...
           {'PURCH [10^{3}USD]'},{'RANGE [10^{3}nmi]'},{'LDMAX [Ratio]'},{'VCMAX [knots]'},{'PFPF [Ratio]'}};
sel_var = [1: 10]';
byColor = 10;
bySize  = 4;
ncolor  = 8;
nsizes  = 6;
out_clr = [1, 0, 0; 1 1 0; 0 0.65 1];

% [h2A,idx2A] = PlotObjectivesMv2(objs(:,[2 6]),OFnames(:,[2 6]),{},1,2,ncolor,nsizes,out_clr);
% [h2B,idx2B] = PlotObjectivesMv2(objs(:,[2 5]),OFnames(:,[2 5]),{},1,2,ncolor,nsizes,out_clr);
% [h2C,idx2C] = PlotObjectivesMv2(objs(:,[4 8]),OFnames(:,[4 8]),{},1,2,ncolor,nsizes,out_clr);
% [h2D,idx2D] = PlotObjectivesMv2(objs(:,[4 7]),OFnames(:,[4 7]),{},1,2,ncolor,nsizes,out_clr);
% [h2E,idx2E] = PlotObjectivesMv2(objs(:,[1 3]),OFnames(:,[1 3]),{},1,2,ncolor,nsizes,out_clr);
% [h2F,idx2F] = PlotObjectivesMv2(objs(:,[1 7]),OFnames(:,[1 7]),{},1,2,ncolor,nsizes,out_clr);
% 
% [h3,idx3] = PlotObjectives3DMv2(objs(sel_brush,sel_var),OFnames(:,sel_var),{},byColor,bySize,ncolor,nsizes,out_clr);

[h6,idx6] = PlotOFParallelM(objs(:,sel_var),byColor,OFnames(:,sel_var),ncolor,out_clr,[0, 0.008]);