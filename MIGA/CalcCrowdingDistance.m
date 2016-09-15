%  CalcCrowdingDistance.m : calculates crowding distances 
function [pop] = CalcCrowdingDistance(pop,F)
  global nobj;
  nfronts = numel(F);
% This code works properly with OF in rows
%   for ifront = 1:nfronts
%     CurrFront  = F{ifront};
%     nCurrFront = numel(F{ifront});
%     OF = GetObjectives(pop(CurrFront));
%     CD = zeros(size(OF));
%     for iobj = 1:nobj
%       [OF_sorted, k]      = sort(OF(iobj,:));
%       CD(iobj,k(1))       = inf;
%       CD(iobj,k(end))     = inf;
%       CD(iobj,k(2:end-1)) = (OF_sorted(3:end)-OF_sorted(1:end-2))/(OF_sorted(end)-OF_sorted(1));
%     end % iobj 
%     CD = sum(CD,1);
%     for ipop = 1:nCurrFront
%       pop(CurrFront(ipop)).CrowdingDistance = CD(ipop);
%     end % ipop 
%   end % ifront 

% % This is my trial version works with OF in columns
  for ifront = 1:nfronts
    CurrFront  = F{ifront};
    nCurrFront = numel(F{ifront});
    OF = GetObjectives(pop(CurrFront));
    CD = zeros(size(OF));
    for iobj = 1:nobj
      [OF_sorted, k]       = sort(OF(:,iobj));
      CD(k(1),       iobj) = inf;
      CD(k(end),     iobj) = inf;
      CD(k(2:end-1), iobj) = (OF_sorted(3:end)-OF_sorted(1:end-2))/(OF_sorted(end)-OF_sorted(1));
    end % iobj 
    CD = sum(CD,2); % acts on columns
    for ipop = 1:nCurrFront
      pop(CurrFront(ipop)).CrowdingDistance = CD(ipop);
    end % ipop 
  end % ifront 

end % function