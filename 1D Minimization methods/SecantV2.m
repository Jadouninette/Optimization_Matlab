%%Cours d'optimisation%%
%%STUDENT ID P46077098%%
%% If you see any mistake or any upgrade, please report %%
%% Xiexie-Merci %% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%SECANT METHOD METHOD%%
clc
clear all
close all 

epsilon=0.001; 
%epsilon=input('Enter the error range : \n');
t0=0.1; 
%t0=input('Enter t0 : \n');
syms x
f = @(x) objfunction(x);
f1=vpa(f);
%fonction=0.5/sqrt(1+x^2)-sqrt(1+x^2)*(1-0.5/(1+x^2))+x;
%fonction = input('Enter the objective function : \n');

df=diff(f1,x);
%Calcul of derivative

x=0;
%Initialisation of the variable

a=x; 
b=x+t0; 

dfa=subs(df,a); 
%evaluate the derivative on point a
dfb=subs(df,b);
%evaluate the derivative on point b

while dfa>0 & dfb>0 %if both are positive increase
    a=b; 
    t0=2*t0; 
    b=x+t0; 
    dfa=subs(df,a); 
    dfb=subs(df,b);
end

x=a-dfa*(b-a)/(dfb-dfa); %uptdate of the variable cf cours

while abs(subs(df,x))>epsilon %while the absolute value of the derivative evaluate in x is more than the stop condition 
    % keep optimize
    if subs(df,x)<0
       b=x; 
       dfb=subs(df,x); 
    else
       a=x; 
       dfa=subs(df,x); 
    end
    x=a-dfa*(b-a)/(dfb-dfa);
end
fmax=vpa(subs(f1,x));
disp ('xmax = ');
xmax=vpa(x);
disp(xmax);
disp('fmax = ');
disp(fmax);
