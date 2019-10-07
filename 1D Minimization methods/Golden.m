clc;
close all;
clear all;

n=input('Enter the no of iterations : \n');
a=input('\n Enter lower limit : \n'); 
b=input('\n\nEnter upper limit : \n');
%fonction = input(Enter the objective function : \n);

fonction = @(x)(-((0.5/(1+x^2)^0.5)-((1+x^2)^0.5)*(1-0.5/(1+x^2))+x));


gammaR=(1+sqrt(5))/2; %Golden section number
N=n+1;
L2=(b-a)*gammaR^-2; %L2star dans le cours
j=2;

%Methode de Golden Section
while j<N
L1=(b-a);
if L2>L1/2
    X1=b-L2;
    X2=a+L2;
else if L2<=L1/2
        X1=a+L2;
        X2=b-L2;
    end
end

%to calculate the the conditions
k1=fonction(X1);
k2=fonction(X2);
if k2>k1
    b=X2;
    L2=(gammaR^-2)*L1;
else if k2<k1
        a=X1;
        L2=(gammaR^-2)*L1;
    else if k2==k1
            a=X1;
            b=X2;
            L2=(gammaR^-2)*(b-a);
            j=j+1;
        end
    end
end
j=j+1;
end

feval=fonction(a);
disp('The final interval is  : ');disp(a);
disp(b);
disp('fmax(lambda) is : ');
disp(feval);

    