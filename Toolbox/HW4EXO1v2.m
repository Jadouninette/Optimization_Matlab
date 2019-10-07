clc
clear all
close all

x = [0,1];    % Starting guess
%x=input('Enter the starting point you want : \n');
options = optimset('LargeScale','off');
f = prob1obj(x) %on garde en memoire les futures val de f

%definition de la fonction !!!
f=exp(x(1))*(4*x(1)^2+2*x(2)^2+4*x(1)*x(2)+2*x(2)+1);
 % f = input('Enter the function : \n');
 
[x,fval,exitflag,output] = fminunc(@prob1obj,x,options)
disp('final point');disp(x);
disp('function value at minimum');disp(fval);

%https://fr.mathworks.com/help/optim/ug/fminunc.html


