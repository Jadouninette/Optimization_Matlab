clc;
clear all;

n=input('Enter the no of iterations : \n');

a=input('\n Enter lower limit : \n'); 
b=input('\n\nEnter upper limit : \n');
%fonction = input(Enter the objective function : \n);
fonction = @(x)(-((0.5/(1+x^2)^0.5)-((1+x^2)^0.5)*(1-0.5/(1+x^2))+x));
%Fibo coeff
f1=1;
f2=1;
N=n+1;

%calcul des coefficients de fibo
for i=1:N
    if i==1 || i==2 %optionnel vu que deja mit en haut
    f(i)=1; %correspond a f1 et f2
   continue;
    end
    f(i)=f1+f2;
    %updated coefficients
    f1=f2; 
    f2=f(i);
end

%Calcul des valeurs initiales
L2star=(b-a)*f(N-2)/f(N);
j=2;

%Methode de fibonacci
while j<N
L1=(b-a);

if L2star>L1/2
    X1=b-L2star;
    X2=a+L2star;
else if L2star<=L1/2
        X1=a+L2star; %calcul du nouveau a
        X2=b-L2star;%calcul du nouveau b
    end
end

%to calculate the the conditions
k1=fonction(X1); 
k2=fonction(X2);

%condiction du cours 
if k2>k1 %f(b)>f(a)
    b=X2;
    L2star=f(N-j)*L1/f(N-(j-2));
else if k2<k1 %f(b)<f(a)
        a=X1;
        L2star=f(N-j)*L1/f(N-(j-2)); %(dans le cours c'est L2star)
        
    else if k2==k1
            a=X1;
            b=X2;
            L2star=f(N-j)*[b-a]/f(N-(j-2));
            j=j+1;
        end
    end
end
j=j+1;
end

feval=fonction(a);
fprintf('The final interval is [%f ; %f ] \n',a,b);
fprintf('fmax(lambda) is : %f',feval);

    