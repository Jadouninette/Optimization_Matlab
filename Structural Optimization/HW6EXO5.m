clc 
clear all
close all

%Change the problem syntax into a quadprog syntax
%f(x)=1/2[(x^T)Hx]+(f^T)x

%For a more general example
% H=input('Enter the matrix H (H is symmetric) : \n');
% f=input('Enter the vector f : \n');
% A=input('Enter the constraints matrix A : \n');
% b=input('Enter the Inequalities vecotr b : \n');

%Only for this case !
H=[4 -6;-6 18]; % Normally need to check that H is positive definite by checking its eigenvalues.
f=[-18;-6];
A=[1 1;4 -3; -1 0;0 -1];
b=[10;20;0;0]; %Need to check because not sure of the coefficients


[x,fval,exitflag,output,lambda] = quadprog(H,f,A,b);
%Minimum found that satisfies the constraints.

disp('final point');disp(x);
disp('function value at minimum');disp(fval);
disp('If exit flag is one, then result is a local minimum');disp(exitflag);

%https://fr.mathworks.com/help/optim/ug/quadprog.html