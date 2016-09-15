function MIGAwriteXLS(FlagXLS,problem,DVnames,COnames,OFnames)
% This script allows to store in an XLS file for review of the results of
% MIGA
%
%  Developed by  : Mario Castro Gama
%                  MSc. Hydroinformatics
%  e-mail        : m.castrogama@unesco-ihe.org
%
%  MI_NSGA_II.m  : main file of the program
%
%  last update   : 2016-05-09, 
%                  1. Include date and time in filename
%                  2. now stores everything in the results folder
% last update   : 2016-05-23, 
%                  1. XLS file stores the MOO parameters
%                  2. filename has number output corrected to
%                  yyyy-mm-dd_HH.MM --> 2016-05-06_07.18
%

  global islands
  global nislands
  global nvar
  global ncon
  global nobj
  global npop
  global ngen
  
  global VarMin
  global VarMax

  
  global CrossType
  global probab_cro
  global nc
  global nc_1
  
  global MutType
  global probab_mut
  global nm
  global nm_1
    
  global MigType
  global probab_mig
  
  global BoundType
  
  global nfuneval
  global nfuneval_ini
  global nviolate
  global nviolate_ini
  
  
  warning('off','MATLAB:xlswrite:AddSheet');
  
  if (FlagXLS == 1)
    disp(' ');
    disp(' ');
    currtime = clock;
    strtime = [sprintf('%02d',currtime(1)),'-',sprintf('%02d',currtime(2)),'-',sprintf('%02d',currtime(3)),'_',sprintf('%02d',currtime(4)),'.',sprintf('%02d',currtime(5))];
    filename = ['Results/MOO_Results_',problem,'_r',num2str(nislands),'_p',num2str(sum(npop)/nislands),'_g',num2str(ngen),'_',strtime,'.xls'];
    disp(['Writing EXCEL file: ',filename]);
    if exist(filename,'file')==2;
      delete(filename);
    end
    
    icol = 0;
    DVheader = {};
    COheader = {};
    OFheader = {};
    DVdata = zeros(max(npop),nislands*(nvar+1));
    COdata = zeros(max(npop),nislands*(ncon+1));
    OFdata = zeros(max(npop),nislands*(nobj+1));
    for r = 1:nislands
      sheet = 'DecisionVariables'; % Store decision variables
      icol = (r-1)*nvar+r;
      xlRange = 'A1'; 
      [~, ~] = xlswrite(filename,{'Decision Variables'},sheet,xlRange);
      x = reshape([islands(r).pop.DecisionVariables],nvar,npop(r));
      DVdata(1:npop(r),icol:icol+nvar) = [(1:npop(r))', x'];
      DVheader = cat(2,DVheader,[{['Island ',num2str(r)]},DVnames]);
      if (r == nislands)
        xlRange = 'A1';
        [status, message] = xlswrite(filename,{'Decision Variables'},sheet,xlRange);
        xlRange = 'A2';
        [status, message] = xlswrite(filename,DVheader,sheet,xlRange);
        xlRange = 'A3';
        [status, message] = xlswrite(filename,DVdata,sheet,xlRange);
      end
      
      sheet = 'ConstraintFunctions'; % Store Constraints
      icol = (r-1)*ncon+r;
      x = reshape([islands(r).pop.Constraints],ncon,npop(r));
      COdata(1:npop(r),icol:icol+ncon) = [(1:npop(r))', x'];
      COheader = cat(2,COheader,[{['Island ',num2str(r)]},COnames]);
      if (r == nislands)
        xlRange = 'A1';
        [status, message] = xlswrite(filename,{'Constraint Functions'},sheet,xlRange);
        xlRange = 'A2';
        [status, message] = xlswrite(filename,COheader,sheet,xlRange);
        xlRange = 'A3';
        [status, message] = xlswrite(filename,COdata,sheet,xlRange);
      end
      
      sheet = 'ObjectiveFunctions'; % Store Objective functions
      icol = (r-1)*nobj+r;
      x = reshape([islands(r).pop.ObjectiveFunctions],nobj,npop(r));
      OFdata(1:npop(r),icol:icol+nobj) = [(1:npop(r))', x'];
      OFheader = cat(2,OFheader,[{['Island ',num2str(r)]},OFnames]);
      if (r == nislands)
        xlRange = 'A1';
        [status, message] = xlswrite(filename,{'Objective Functions'},sheet,xlRange);
        xlRange = 'A2';
        [status, message] = xlswrite(filename,OFheader,sheet,xlRange);
        xlRange = 'A3';
        [status, message] = xlswrite(filename,OFdata,sheet,xlRange);
      end
    end % r
    
    sheet  = 'Summary';
    xlRange = 'A1';
    [status, message] = xlswrite(filename,{'Problem'},sheet,xlRange);%,sheet,xlRange);
    xlRange = 'B1';
    [status, message] = xlswrite(filename,{problem},sheet,xlRange);
    xlRange = 'A2';
    [status, message] = xlswrite(filename,{'n islands'},sheet,xlRange);
    xlRange = 'B2';
    [status, message] = xlswrite(filename,nislands,sheet,xlRange);
    
    xlRange = 'A3';
    [status, message] = xlswrite(filename,{'n objectives'},sheet,xlRange);
    xlRange = 'B3';
    [status, message] = xlswrite(filename,nobj,sheet,xlRange);
    xlRange = 'A4';
    [status, message] = xlswrite(filename,{'n constraints'},sheet,xlRange);
    xlRange = 'B4';
    [status, message] = xlswrite(filename,ncon,sheet,xlRange);
    xlRange = 'A5';
    [status, message] = xlswrite(filename,{'n variables'},sheet,xlRange);
    xlRange = 'B5';
    [status, message] = xlswrite(filename,nvar,sheet,xlRange);
    xlRange = 'A6';
    [status, message] = xlswrite(filename,{'VarMin'},sheet,xlRange);
    xlRange = 'B6';
    [status, message] = xlswrite(filename,VarMin,sheet,xlRange);
    xlRange = 'A7';
    [status, message] = xlswrite(filename,{'VarMax'},sheet,xlRange);
    xlRange = 'B7';
    [status, message] = xlswrite(filename,VarMax,sheet,xlRange);
    
    xlRange = 'A9';
    [status, message] = xlswrite(filename,{'n population'},sheet,xlRange);
    xlRange = 'B9';
    [status, message] = xlswrite(filename,npop,sheet,xlRange);
    xlRange = 'A10';
    [status, message] = xlswrite(filename,{'n generations'},sheet,xlRange);
    xlRange = 'B10';
    [status, message] = xlswrite(filename,ngen,sheet,xlRange);
    
    xlRange = 'A12';
    [status, message] = xlswrite(filename,{'Crossover Type'},sheet,xlRange);
    xlRange = 'B12';
    [status, message] = xlswrite(filename,{CrossType},sheet,xlRange);
    xlRange = 'A13';
    [status, message] = xlswrite(filename,{'Probability Crossover'},sheet,xlRange);
    xlRange = 'B13';
    [status, message] = xlswrite(filename,probab_cro,sheet,xlRange);
    xlRange = 'A14';
    [status, message] = xlswrite(filename,{'Index Crossover'},sheet,xlRange);
    xlRange = 'B14';
    [status, message] = xlswrite(filename,nc,sheet,xlRange);
    xlRange = 'C14';
    [status, message] = xlswrite(filename,nc_1,sheet,xlRange);
    xlRange = 'A15';
    [status, message] = xlswrite(filename,{'Boundary Type'},sheet,xlRange);
    xlRange = 'B15';
    [status, message] = xlswrite(filename,{BoundType},sheet,xlRange);
    
    xlRange = 'A17';
    [status, message] = xlswrite(filename,{'Mutation type'},sheet,xlRange);
    xlRange = 'B17';
    [status, message] = xlswrite(filename,{MutType},sheet,xlRange);
    xlRange = 'A18';
    [status, message] = xlswrite(filename,{'Probability of Mutation'},sheet,xlRange);
    xlRange = 'B18';
    [status, message] = xlswrite(filename,probab_mut,sheet,xlRange);
    xlRange = 'A19';
    [status, message] = xlswrite(filename,{'Index Mutation'},sheet,xlRange);
    xlRange = 'B19';
    [status, message] = xlswrite(filename,nm,sheet,xlRange);
    xlRange = 'C19';
    [status, message] = xlswrite(filename,nm_1,sheet,xlRange);

    xlRange = 'A21';
    [status, message] = xlswrite(filename,{'Migration type'},sheet,xlRange);
    xlRange = 'B21';
    [status, message] = xlswrite(filename,{MigType},sheet,xlRange);
    xlRange = 'A22';
    [status, message] = xlswrite(filename,{'Probability of Migration'},sheet,xlRange);
    xlRange = 'B22';
    [status, message] = xlswrite(filename,probab_mig,sheet,xlRange);
     
    xlRange = 'B24';
    [status, message] = xlswrite(filename,{'Total'},sheet,xlRange);
    xlRange = 'C24';
    [status, message] = xlswrite(filename,{'Initial'},sheet,xlRange);
    xlRange = 'A25';
    [status, message] = xlswrite(filename,{'n funeval'},sheet,xlRange);
    xlRange = 'B25';
    [status, message] = xlswrite(filename,nfuneval,sheet,xlRange);
    xlRange = 'C25';
    [status, message] = xlswrite(filename,nfuneval_ini,sheet,xlRange);
    xlRange = 'A26';
    [status, message] = xlswrite(filename,{'n violate'},sheet,xlRange);
    xlRange = 'B26';
    [status, message] = xlswrite(filename,nviolate,sheet,xlRange);
    xlRange = 'C26';
    [status, message] = xlswrite(filename,nviolate_ini,sheet,xlRange);
  end % if (FlagXLS)
end