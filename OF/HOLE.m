%% HOLE
function y = HOLE(x)
  xx = x(1);
  yy = x(2);
  q = 0.2;
  p = 2.0;
  d0 = 0.02;
  h = 2.0;
  delta = 0.29289;
  xp = xx + delta;
  yp = yy - delta;
  alpha = 0.785398;
  xpp = xp.*cos(alpha) + yp.*sin(alpha);
  ypp = -xp.*sin(alpha) + yp.*cos(alpha);
  xppp = xpp.*pi;
  yppp = ypp.*pi;
  u = sin(xppp./2.0);
  v = (sin(yppp./2.0)).^2;
  if u>=0.0
    up = u.^h;
  else
    up = (-u).^h;
  end
  vp = v.^(1/h);
  t = up;
  a = 2.0*vp*p;
  b = 0.0;
  if a<=p
    b = (p-a).*exp(q);
  end
  d = a.*q./2.0 + d0;
  c = q./(d.*d);
  f1 = (t+1.0).^2 + a + b.*exp(-c.*(t-d).*(t-d));
  f2 = (t-1.0).^2 + a + b.*exp(-c.*(t+d).*(t+d));
  y = [f1; f2]';
end

