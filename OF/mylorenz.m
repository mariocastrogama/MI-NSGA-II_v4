function [t,x] = mylorenz(po, initV, T, eps);
% LORENZ Function generates the lorenz attractor of the prescribed values
% of parameters rho, sigma, beta
%
%   [X,Y,Z] = LORENZ(RHO,SIGMA,BETA,INITV,T,EPS)
%       X, Y, Z - output vectors of the strange attactor trajectories
%       RHO     - Rayleigh number
%       SIGMA   - Prandtl number
%       BETA    - parameter
%       INITV   - initial point
%       T       - time interval
%       EPS     - ode solver precision
%
% Example.
%        param = [28, 10, 8/3];
%        [t,x] = mylorenz(param);
%        plot3(x(:,1),x(:,2),x(:,3));

  if nargin<1
    error('MATLAB:lorenz:NotEnoughInputs','Not enough input arguments.');
  end

  if nargin<2
    eps = 0.000001;
    t = [0 25];
    initV = [0 1 1.05];
  end

  rho   = po(1);
  sigma = po(2);
  beta  = po(3);
  options = odeset('RelTol',eps,'AbsTol',[eps eps eps/10]);
  [t,x] = ode45(@(t,x) F(t, x, rho, sigma,  beta), t, initV, options);

%   plot3(x(:,1),x(:,2),x(:,3));
%   axis equal;
%   grid;
%   title('Lorenz attractor');
%   xlabel('x_1'); ylabel('x_2'); zlabel('x_3');

  return
end

function dx = F(t, x, rho, sigma, beta)
% Evaluates the right hand side of the Lorenz system
% x' = sigma*(y-x)
% y' = x*(rho - z) - y
% z' = x*y - beta*z
% typical values: rho = 28; sigma = 10; beta = 8/3;
  dx = zeros(3,1);
  dx(1) = sigma*(x(2) - x(1));
  dx(2) = x(1)*(rho - x(3)) - x(2);
  dx(3) = x(1)*x(2) - beta*x(3);
  return
end