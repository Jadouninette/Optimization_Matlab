clc 
close all
clear all 

% C=input('Enter the matrix C : \n');
C=[2 3 4 5;1 3 2 7;1 5 4 3;3 1 4 4];
% D=input('Enter the vector d : \n');
d=[1;2;3;4];

%preparation for the function
A=-diag([1 1 1 1]);
b=zeros([4 1]);

[x,resnorm,residual,exitflag,output] = lsqlin(C,d,A,b,[],[],[],[])
disp('final point');disp(x);
% lsqlin is to solve constrained linear least-squares problem, here with
% standards options 

%https://fr.mathworks.com/help/optim/ug/lsqlin.html
