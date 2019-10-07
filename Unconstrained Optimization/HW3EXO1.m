clc;
clear all;
close all;

epsilon=input('Enter the epsilon : \n');

syms x1 x2 l
x=[1;2];
f=2*x1^2+x2^2;
%f=input('Enter the objective fonction : ');
gf=[diff(f,x1);diff(f,x2)];%calcul du gradient

i=1;
while abs(subs(gf,{x1,x2},{x(1),x(2)}))>epsilon
    s=-subs(gf,{x1,x2},{x(1),x(2)}); %searching direction
    i=+1;
    Xup=x+l*s;
    fl=subs(f,{x1,x2},{Xup(1),Xup(2)});
    dfl=diff(fl,l);
    sol=solve(dfl);
    x=x+sol*s;
end

min=vpa(subs(f,{x1,x2},{x(1),x(2)}));
disp(min);
disp(x);
%https://fr.mathworks.com/help/matlab/ref/gradient.html

