clc 
close all
clear all 

x0 = [0.3 0.4];            
% Starting point 
[x,resnorm] = lsqnonlin(@objfunction4,x0)
disp('final point');disp(x);


%@objfunction4 is where the fonction is written (another file that need to be in the same working folder)
%but problem when put the sqaure
% https://fr.mathworks.com/help/optim/ug/lsqnonlin.html