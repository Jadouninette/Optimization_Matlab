clc 
clear all
close all

%Can be also write in vector in order to save memory but ...j'ai la flemme!

x = optimvar('x1','LowerBound',0);
y = optimvar('x2','LowerBound',0);
z = optimvar('x3','LowerBound',0);
t = optimvar('x4','LowerBound',0);
k = optimvar('x5','LowerBound',0);

f =((2*x)+(3*y)+(2*z)-t+k);
% f = input('Enter the function : \n');

prob = optimproblem('Objective',f,'ObjectiveSense','min');
prob.Constraints.c1 = 3*x-3*y+4*z+2*t-k == 0;
prob.Constraints.c2 = x+y+z+3*t+k ==2;

problem = prob2struct(prob);

%Solve the resulting problem structure.

[sol,fval,exitflag,output] = linprog(problem)

%https://fr.mathworks.com/help/optim/ug/linprog.html#buusznx-4