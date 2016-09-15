function ZDTall(name)
  switch name
    case 'ZDT1'
      fobj = @ZDT1;
    case 'ZDT2'
      fobj = @ZDT2;
    case 'ZDT3'
      fobj = @ZDT3;
    case 'ZDT4'
      fobj = @ZDT4;
    case 'ZDT6'
      fobj = @ZDT6;
  end
end

%% ZDT1
function y = ZDT1(x)
  f1 = x(1);
  g = 0.0;
  for i=2:30
    g = g + x(i);
  end
  g = 9.0.*g./29.0;
  g = g + 1.0;
  h = 1.0 - sqrt(f1./g);
  f2 = g*h;
  y= [f1;f2];
end

%% ZDT2
function y = ZDT2(x)
  f1 = x(1);
  g = 0.0;
  for i=2:30
    g = g + x(i);
  end
  g = 9.0.*g./29.0;
  g = g + 1.0;
  h = 1.0 - (f1./g).^2;
  f2 = g*h;
  y = [f1;f2];
end

%% ZDT3
function y = ZDT3(x)
  f1 = x(1);
  g = 0.0;
  for i=2:30
    g = g + x(i);
  end
  g = 9.0.*g./29.0;
  g = g + 1.0;
  h = 1.0 - (f1./g) - (f1./g)*sin(10.0.*pi.*f1);
  f2 = g*h;
  y= [f1;f2];
end

%% ZDT4
function y = ZDT4(x)
  f1 = x(1);
  g = 91.0;
  for i=2:10
    g = g + x(i)*x(i) - 10.0.*cos(4.0.*pi.*x(i));
  end
  h = 1.0 - sqrt(f1./g);
  f2 = g*h;
  y= [f1;f2];
end

%% ZDT6
function y = ZDT6(x)
  f1 = 1.0 - exp(-4.0.*x(1))*(sin(6.0.*pi.*x(1)).^6);
  g = 0.0;
  for i=2:10
    g = g + x(i);
  end
  g = g./9.0;
  g = g.^0.25;
  g = 1.0 + 9.0*g;
  h = 1.0 - (f1./g).^2;
  f2 = g*h;
  y = [f1;f2];
end