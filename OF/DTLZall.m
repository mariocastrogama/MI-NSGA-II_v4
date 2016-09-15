function DTLZall(name)
  switch name
    case 'DTLZ1'
      fobj = @DTLZ1;
    case 'DTLZ2'
      fobj = @DTLZ2;
    case 'DTLZ3'
      fobj = @DTLZ3;
    case 'DTLZ4'
      fobj = @DTLZ4;
    case 'DTLZ5'
      fobj = @DTLZ5;
    case 'DTLZ6'
      fobj = @DTLZ6;
    case 'DTLZ7'
      fobj = @DTLZ7;
    case 'DTLZ8'
      fobj = @DTLZ8;
    case 'DTLZ9'
      fobj = @DTLZ9;
  end
end

%% DTLZ1
function y = DTLZ1(x)
g=0.0;
for i=3:7
  g = g + (x(i)-0.5).^2 - cos(20.0.*pi.*(x(i)-0.5));
end
g = g + 5.0;
g = g*100.0;
f1 = 0.5.*x(1).*x(2).*(1.0+g);
f2 = 0.5.*x(1).*(1.0-x(2)).*(1.0+g);
f3 = 0.5.*(1.0-x(1)).*(1.0+g);
y = [f1;f2;f3];
end

%% DTLZ2
function y = DTLZ2(x)
g=0.0;
for i=3:12
  g = g + (x(i)-0.5).^2;
end
f1 = (1.0+g).*cos(x(1).*pi./2.0).*cos(x(2).*pi./2.0);
f2 = (1.0+g).*cos(x(1).*pi./2.0).*sin(x(2).*pi./2.0);
f3 = (1.0+g).*sin(x(1).*pi./2.0);
y = [f1;f2;f3];
end