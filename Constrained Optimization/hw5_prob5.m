
clc;
clear all;
close all

N = 3;                        
% iteration number
n = 2;                       
% n variables
x = sym('x', [1 n]);
% set variables for iterations

m = 1; % m  is the nbr of equality equations
lambda = sym('lambda', [1,m]);  % set variables

fonction = (x(1,1)-1)^2+ (x(1,2)-5)^2;  % objective function
%fonction=input('Enter the objective function : \n');

h1 = x(1,1)+x(1,2)-5;% equality constraint
%h1=input('Enter the equality constraints : \n')

H = [h1]; % equality constraints
Hlambda = 0;% second term of the Augmented Lagrange function

rk = 1;

for i = 1:m % sum the first term of the constraint equations from the formula
    Hlambda = Hlambda+H(1,i)*lambda(1,i);
end

Hcarre = [h1^2]; % third term of Augmented Lagrange function that need to be written in the matrix form to avoid error
ALf = fonction+ Hlambda+rk*sum(Hcarre(1,:));% Augmented Lagrange fonction

for i = 1:n                                    
AX(1,i) = diff(ALf,x(1,i)); %derivative of ALf
end

lambda(1,1) = 0; % initial landa star at 0

[solx1, solx2] = solve(AX(1,:),x(1,:));        
% need to solve the equation of Xi and lambda
X = [subs(solx1,lambda),subs(solx2,lambda)];     
% need to evaluate the solution equation with this lambda to have the initial X
for i = 1:N-1                                  
    for i = 1:m %update lambda
        lambda(1,i) = lambda(1,i)+2*rk*(subs(H(1,i),{x(1,1),x(1,2)},{X(1,1),X(1,2)}));
    end
    X = [subs(solx1,lambda),subs(solx2,lambda)]; 
    %update X
end

disp('Xi is equal to : ')
disp(X);     
disp('fmax = ');
disp(lambda(1,1));                              