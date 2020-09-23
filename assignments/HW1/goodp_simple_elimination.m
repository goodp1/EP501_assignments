%This script preformes simple elimination for linear alegrbraic matrixcies 
%Created by: Patrick Good with example code from Dr. Z

%Clear the workspace
clc
clear

%Load test problem 1
%load('testproblem.mat')

A = [80 -20 -20; -20 40 -20; -20 -20 130];
b = [0; 1; 0];

%Forward substitution function
Awork = forsub(A,b);

%Back substitution function
Final = backsub(Awork);

%Matlab built in function 
matlab = A\b;

%print results
disp('Initial Matrix A|B = ')
disp(cat(2,A,b)) %initial matrix

disp('My_Results = ')
disp(Final) %foward and back sub results

disp('MatLab_Results = ')
disp(matlab) %matlab built in results

%----------------------------------------------------------------------
%Lower Triangle Test Problem 

%Load lower triangle test problem 
load('lowertriang_testproblem.mat')

%Forward substitution 
LT_solution = forsub(L,bL);
LT_Final = LT_solution(:,9); %results

%Matlab built in function 
LT_matlab = L\bL;

%Print results
disp('-----------------Lower-Triangle System-----------------')
disp(' ')

disp('Initial Matrix L|bL = ')
disp(cat(2,L,bL)) %initial matrix

disp('LT_My_Results = ')
disp(LT_Final)

disp('MatLab_Results = ')
disp(LT_matlab) %matlab built in results

