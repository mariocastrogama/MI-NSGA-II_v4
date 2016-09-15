function [f,g] = RayTaiSeow(x)
% RayTaiSeow.m
% Ray, Tai and Seow (2001) Water Resource Planning problem
% In a drainage system 3 main decision variables have been identified for
% decision making. This leads to 5 objective functions (non-linear), 
% coupled with 7 constraints due to resource limitations and water quality
% requirements.
%
% Objective Functions:  5, non-linear.
% Constraints        :  7, non-linear.
% Decision Variables :  3. 
%     0.01 <= x(1) <= 0.45
%     0.01 <= x(2) <= 0.10
%     0.01 <= x(3) <= 0.10
%
% References:
% The story goes like this, found this problem on [1] where is referenced to [2].
% However in [2] it is explained little and refers to [3] and [4], but in
% neither of them is extensively explained the choice of surfaces, although 
% the problem is presented in all as it is here. 
% Seems that the problem was studied in a PhD thesis at Purdue 
% by Dendrou, S. in 1978, but only found the report presented in [5].
% In [5], the whole model is discussed but not the simplifications concerning 
% creating the objective functions and more important the constraints as surfaces.
% As a matter of fact this problem can be seen as a meta-model for
% water resources planning.
%
% [1] Deb, K. (2001) Multi-Objective Optimization using Evolutionary Algorithms.
%     Editorial Wiley & Sons. pp 518. ISBN: 978-0-471-87339-6
% [2] Ray, T., Tai, K., and Seow, K-C. (2001) Multiobjective Design Optimization by and Evolutionary Algorithm
%     Engineering Optimization, 33(4), 399-424. DOI:10.1080/03052150108940926
% [3] Cheng, F.Y. and Li, X.S. (1999) Generalized method for multiobjective engineering optimization.
%     Engineering Optimization, 31(5), 641-661.
% [4] Musselman, K. and Talavage, J. (1980). A trade-off cut approach to multiple objective 
%     optimization. Operations Research, 28(6), 1424-1435.
% [5] Dendrou, S., Delleur, J.W., and Talavage, J.J. (1978) "Urban Growth In Water Resources Planning, 
%     Multilevel Approach To Urban Water Resources Systems Analysis -- Application To Medium Size Communities" . 
%     IWRRC Technical Reports. Paper 100. http://docs.lib.purdue.edu/watertech/100
% 
% Developed by : M.Sc. Mario Castro Gama
% e-mail       : m.castrogama@unesco-ihe.org
% Last update  : 2015-05-14
%
%
  global nfuneval
  global nviolate
  f = zeros(1,5);
  g = zeros(1,7);
  g(1) =  0.00139 /(x(1)*x(2)) +     4.940*x(3) -    0.0800 -     1.0; % <=     1?
  g(2) =  0.000306/(x(1)*x(2)) +     1.082*x(3) -    0.0986 -     1.0; % <=     1?
  g(3) = 12.307   /(x(1)*x(2)) + 49408.240*x(3) + 4051.0200 - 50000.0; % <= 50000?
  g(4) =  2.098   /(x(1)*x(2)) +  8046.333*x(3) -  696.7100 - 16000.0; % <= 16000?
  g(5) =  2.138   /(x(1)*x(2)) +  7883.390*x(3) -  705.0400 - 10000.0; % <= 10000?
  g(6) =  0.417   /(x(1)*x(2)) +  1721.260*x(3) -  136.5400 -  2000.0; % <=  2000?
  g(7) =  0.164   /(x(1)*x(2)) +   631.130*x(3) -   54.4800 -   550.0; % <=   550?
  if any(g > 0);
    f = f + [1.05 1.0 1.1 2.7 3.5]; % Assign a value 
    nviolate = nviolate + 1;
  else
    f(1) = 106780.37*(x(2)+x(3))+61704.67;               f(1) = f(1) / 8e4;
    f(2) = 3000.0*x(1);                                  f(2) = f(2) / 1500.0;
    f(3) = (305700.0)*2289.0*x(2)/(0.05*2289.0)^0.65;    f(3) = f(3) / 3e6;
    f(4) = (250.0)*2289*exp(-39.75*x(2)+9.90*x(3)+2.74); f(4) = f(4) / 6e6;
    f(5) = 25.0*(1.39/(x(1)*x(2)) + 4940*x(3) - 80.0);   f(5) = f(5) / 8e3;
  end
  nfuneval = nfuneval + 1;
end