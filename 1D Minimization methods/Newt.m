
clc
clear all
close all
syms x

eps=0.001;
%epsilon=input('Enter epsilon : \n');

x0=0.6; %starting point
%x0 = input('Enter the starting point : \n');


f=(0.5/((1+x^2)^0.5))-((1+x^2)^0.5)*(1-0.5/(1+x^2))+x;
%f=input('Enter the function : \n');

df=diff(f);%The 1rst derivative of the function
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
fmax=vpa(subs(f,x,x0))