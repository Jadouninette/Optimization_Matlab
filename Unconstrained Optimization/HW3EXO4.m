clc
clear all
close all

syms x1 x2 x3 
x=[0;0;0]; %starting point
%x=input('Enter the starting point : \n');
eps=0.001; 
c1=1/15; 
c2=2; 
a=10000;
f=(x1+2*x2+3*x3-14)^2+(x1-x2+x3-1)^2+(3*x1-2*x2+x3-2)^2;

df1=diff(f,x1); %cf dm exo 4 p8 E1
df11=diff(df1,x1); %cf dm exo 4 p9 E6
df12=diff(df1,x2); %cf dm exo 4 p8 E2
df13=diff(df1,x3);%cf dm exo 4 p8 E3

df2=diff(f,x2);%cf dm exo 4 p8 E4
df22=diff(df2,x2);%cf dm exo 4 p9 E7
df23=diff(df2,x3);%cf dm exo 4 p9 E5

df3=diff(f,x3);%cf dm exo 4 p9 E8
df33=diff(df3,x3);%cf dm exo 4 p8 E9

gf=[df1;df2;df3]; 
gfx=subs(gf,{x1,x2,x3},{x(1),x(2),x(3)});

while abs(gfx)>eps
    J=[df11 df12 df13;df12 df22 df23;df13 df23 df33]; %J la matrice jacobienne
    
    fx1=subs(f,{x1,x2,x3},{x(1),x(2),x(3)});
    gfx=subs(gf,{x1,x2,x3},{x(1),x(2),x(3)});
    
    x=x-inv(J+a*eye(3))*gfx;
    fx2=subs(f,{x1,x2,x3},{x(1),x(2),x(3)});
    
    if fx2<fx1
        a=c1*a;
    else
        a=c2*a;
    end
end

min=single(subs(f,{x1,x2,x3},{x(1),x(2),x(3)}))


