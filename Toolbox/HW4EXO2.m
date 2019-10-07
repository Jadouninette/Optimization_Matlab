clc
clear all
close all

n = 1000;
xstart = -ones(n,1);%Create a 2-by-3-by-4 array of ones.
xstart(2:2:n,1) = 1; %Create a start point
options = optimoptions(@fminunc,'Algorithm','trust-region','SpecifyObjectiveGradient',true,'HessianFcn','objective');
[x,fval,exitflag,output] = fminunc(@brownfgh,xstart,options);
% Based on @brownfgh is a fucntion that compute the objective function 
%The code can be view with 'type brownfgh' this function compute the gradient and Hessian values as well as the objective function
disp('final point');disp(x);
disp('function value at minimum');disp(fval);
disp('If exit flag is 1, then result is a local minimum');disp(exitflag);
disp(output);