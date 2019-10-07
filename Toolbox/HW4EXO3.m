clc
clear all
close all

%Find the minimum of unconstrained multivariable function
fonction = @brownfg;
%call the fonction with all natrix

load brownhstr          
% Get Hstr, structure of the Hessian
spy(Hstr) 
% View the sparsity structure of Hstr
n = 1000;
xstart = -ones(n,1); 
xstart(2:2:n,1) = 1;
options = optimoptions(@fminunc,'Algorithm','trust-region',...
    'SpecifyObjectiveGradient',true,'HessPattern',Hstr);
[x,fval,exitflag,output] = fminunc(fonction,xstart,options); 
%grad give the value of the gradient of the function
%Hessian give the value of the Hessian of the objective function
disp('final point');disp(x);
disp('function value at minimum');disp(fval);


%Section 8-75 to 77 from user's book
%https://ww2.mathworks.cn/help/optim/ug/minimization-with-gradient-and-hessian-sparsity-pattern.html










