%  Dominates.m : performs domination test 
function b = Dominates(p,q)
%   if isstruct(p)
%     p=p.ObjectiveFunctions;
%   end
%   if isstruct(q)
%     q=q.ObjectiveFunctions;
%   end
  b = (all(p<=q) && any(p<q));
end