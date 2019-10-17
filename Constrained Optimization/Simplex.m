%%Cours d'optimisation%%
%%STUDENT ID P46077098%%
%% If you see any mistake or any upgrade, please report %%
%% Xiexie-Merci %% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Simplex METHOD for constrained optimization%%

clc;
clear all;
close all;


%%Possible to give the parameters in another file%%
f=[-1 8 -8 0 0 0 0 0 0];     
c=f(1:8);      
b=[-3 -2 2 1 0 0 0 0 -6;               
    1 -1 1 0 1 0 0 0 6;
    9 7 -7 0 0 1 0 0 108;
    3 7 -7 0 0 0 1 0 70;
    -2 5 -5 0 0 0 0 1 35];
%add the slack variable directly into the matrix b
%%possbile to use a matlab function for this

while min(c)<0    
    entree=find(c-min(c)==0); %find the vector that will go into the basis
    disp(entree);
    for i=1:5
        if b(i,entree)<=0
            C(i)=1000000; %needed condition otherwhise will not stop
        else
        C(i)=b(i,9)/b(i,entree);
        end
    if min(C)<0                          
        c(entree)=0; %because not possible                      
    continue                             
    end                                  
    end
    pivot=find(C-min(C)==0);
    f=f-(f(entree)/b(pivot,entree))*b(pivot,:); 
    c=f(1:8);  
    % calculate new f & c 
    for j=1:5                                        
        % have new B
        if j==pivot
            b(pivot,:)=b(j,:)/b(j,entree); 
        else 
        b(j,:)=b(j,:)-(b(j,entree)/b(pivot,entree))*b(pivot,:);
        end
    end
end


disp(b);
fmax=f(9)%Asked for the homework but can change 
