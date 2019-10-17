%%Cours d'optimisation%%
%%STUDENT ID P46077098%%
%% If you see any mistake or any upgrade, please report %%
%% Xiexie-Merci %% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%GOLDEN SECTION METHOD%%

clc;
close all;
clear all;
sym x;

n=input('Enter the no of iterations : \n');
a=input('\n Enter lower limit : \n'); 
b=input('\n\nEnter upper limit : \n');

fonction = @(x) objfunction(x);

%Parameters for the method
gammaR=(1+sqrt(5))/2; %Golden section number
N=n+1;
L2=(b-a)*gammaR^-2; %L2star from the class
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
disp('The final interval is  : \n');disp(a);
disp(b);
disp('fmax(lambda) is : \n');
disp(feval);

    
