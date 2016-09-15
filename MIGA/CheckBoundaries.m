function [ynew] = CheckBoundaries(yold)
%  Checkboundaries.m : implements a check for the boundary of decision varibles
  global VarMin
  global VarMax
  global nvar
  global BoundType
  
  ynew = yold;
  switch BoundType
    case 'Reflective'; % like a bouncing ball in a wall
      for ii = 1:nvar;
        if (yold(ii) < VarMin(ii));
          ynew(ii) = 2*VarMin(ii) - yold(ii);
        end
        if (yold(ii) > VarMax(ii));
          ynew(ii) = 2*VarMax(ii) - yold(ii);
        end
      end
    case 'Limit'; % Just put in the boundary if it surpases it
      ynew = min(max(yold,VarMin),VarMax);
    otherwise
      % still to think about something here
  end
end