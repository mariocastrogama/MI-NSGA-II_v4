function f = kursaweFcn(x)
% Kursawe Pareto front test problem

%  Copyright (c) 2010, The MathWorks, Inc.
%  All rights reserved.

% parameters
a = 0.8;
b = 3;
n = length(x);

% function 1
i = 1:n-1;
f(1) = sum(-10*exp(-0.2*sqrt(x(i).^2+x(i+1).^2)));

% function 2
i = 1:n;
f(2) = sum(abs(x(i)).^a+5*sin(x(i).^b));