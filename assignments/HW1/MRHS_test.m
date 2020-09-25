%Project 1
%Problem 2 
%Part a
%This script demos Forward Elimination with multible right-hand sides 
%Created by: Patrick Good 
clear
clc
% Input matrixies 
A = [80 -20 -20; -20 40 -20; -20 -20 130];
b = [20 20; 20 10; 20 20]; %from ex 1.8 in Hoffman text
%load('testproblem.mat')

% Measure the size of the b matrix 
[~ ,c] = size(b);

% Send A and b to multible right-hand side forword elimination function 
Awork = forelim_MRHS(A,b);

% Send forword elimination results to backsub function to uptain the
%solution
X = cell(1,c); %reallacating for effeciency
for n=1:c
    
    X{n} = backsub(Awork{n});
    
end

% Concat the solution back to 1 matrix 
% If you use an identity matrix for b this will give you the A inverse
SOL = X{1};
for n=2:c  
    
    SOL = cat(2,SOL,X{n});
     
end

%Matlab Solution
M_SOL = A\b;

% Display the results 
disp('Solution = ')
disp(SOL)
disp('Matlab Solution =')
disp(M_SOL)

























