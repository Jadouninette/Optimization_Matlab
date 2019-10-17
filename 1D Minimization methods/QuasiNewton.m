%%Cours d'optimisation%%
%%STUDENT ID P46077098%%
%% If you see any mistake or any upgrade, please report %%
%% Xiexie-Merci %% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Quasi Newton METHOD%%

clc;
clear all;
close all;

syms x;
%fonction = (0.5/(1+x^2)^0.5)-((1+x^2)^0.5)*(1-0.5/(1+x^2))+x; 
%fonction = input('Enter the objective function : \n');

fonction = @(x) objfunction(x);
f1=vpa(fonction);
df = diff(f1); 

%Calculate the 1rst derivative of the function
h = input('Enter the step length : \n');
x0 = input('Enter the starting point : \n');
epsilon=input('Enter the error range : ');

for i=1:100
     g = vpa(subs(df,x,x0)); %Calculating the value of 1rst derivative at x0
     g_d = (vpa(subs(df,x,x0+h))-vpa(subs(df,x,x0-h)))/(2*h); 
     
     %Evaluate the 2nd derivative using center difference method.
     x1 = x0 - g/g_d; 
     err=abs(vpa(subs(df,x,x1)));
     
if err<epsilon 
    %condition to stop (possible to improve with a loop while)
break
end
x0=x1;
end

j=i+1; %need start at one

fprintf('The solution is : %f \n',x1);
fprintf('Nbr of iterations : %d\n',j);
