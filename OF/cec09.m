%% Get function handle

function fobj = cec09(name)
switch name
  case 'R2_DTLZ2'
    fobj = @R2_DTLZ2;
  case 'R3_DTLZ3'
    fobj = @R3_DTLZ3;
  case 'WFG1'
    fobj = @WFG1;
  

  case 'SCH1'
    fobj = @SCH1;
  case 'SCH2'
    fobj = @SCH2;
  case 'FON'
    fobj = @FON;
  case 'KUR'
    fobj = @KUR;
  case 'POL'
    fobj = @POL;
  case 'VNT'
    fobj = @VNT;
  case 'BNH'
    fobj = @OSY;
  case 'SRN'
    fobj = @SRN;
  case 'TNK'
    fobj = @TNK;
  case 'HOLE'
    fobj = @HOLE;
  case 'OSY'
    fobj = @OSY;
end
end




%% FON
function y = FON(x)
exp1 = 0.0;
exp2 = 0.0;
temp = 1.0./sqrt(length(x));
for i=1:length(x)
  exp1 = exp1 + (x(i) - temp).^2;
  exp2 = exp2 + (x(i) + temp).^2;
end
f1 = 1.0 - exp(-exp1);
f2 = 1.0 - exp(-exp2);
y = [f1; f2];
end

%% OSY
function [y,c] = OSY(x)
f1 = -25.0.*(x(1)-2.0).^2 + (x(2)-2.0).^2  + (x(3)-1.0).^2  + (x(4)-4.0).^2 + (x(5)-1.0).^2;
f2 = x(1).^2 + x(2).^2 + x(3).^2 + x(4).^2 + x(5).^2 + x(6).^2;
constr1 = (x(1)+x(2))./2.0-1.0;
constr2 = 1.0 - (x(1)+x(2))./6.0;
constr3 = 1.0 + (x(1)-x(2))./2.0;
constr4 = 1.0 - (x(1)-3.0*x(2))/2.0;
constr5 = 1.0 - ( (x(3)-3.0).^2 + x(4) )./4.0;
constr6 = ( (x(5)-3.0).^2 + x(6))./4.0 - 1.0;
y = [f1;f2];
c = [constr1;constr2;constr3;constr4;constr5;constr6];
end

%% TNK
function [y,c] = TNK(x)
f1 = x(1);
f2 = x(2);
constr1 = x(1).^2 + x(2).^2 - 1.0 - 0.1.*cos(16.0.*atan(x(1)./x(2)));
constr2 = 1.0 - 2.0*(x(1)-0.5).^2 +(x(2)-0.5).^2;
y = [f1;f2];
c = [constr1; constr2];
end

