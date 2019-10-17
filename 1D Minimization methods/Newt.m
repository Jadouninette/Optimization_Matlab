%%Cours d'optimisation%%
%%STUDENT ID P46077098%%
%% If you see any mistake or any upgrade, please report %%
%% Xiexie-Merci %% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Newton METHOD for direct root method%%
clc
clear all
close all
syms x

eps=0.001;
%epsilon=input('Enter epsilon : \n');

x0=0.6; %starting point
%x0 = input('Enter the starting point : \n');

f = @(x) objfunction(x);
f1=vpa(f); %Mandatory to evaltuate here because the diff can't be from a file function

df=diff(f1);%The 1rst derivative of the function
ddf=diff(df);%The 2nd derivative of the function


while  abs(subs(df,x,x0))>eps
    df1=subs(df,x,x0);
    df2=subs(ddf,x,x0);
    %subs(s,old,new) will returns a copy of s, 
    %replacing all occurrences of old with new, then evaluates s.
    x0=x0-df1/df2;
end

lambda = vpa(x0);
disp('x = ');
disp(lambda);
fmax=vpa(subs(f1,x,x0))
disp(fmax);
