% EP501 Midterm
% P1
% part a
% This script demos Thomas algorithm
% see function tridiag() for solver 
% Created by: Patrick Good 

%clear the workspace
clc
clear

%Load inputs
load('iterative_testproblem.mat')

%send inputs to Thomas algorithm solver
X = tridiag(Ait,bit);

%natlab built in solution
X_matlab = Ait\bit;

%display results side by side
diff = zeros(50,2);
diff(:,1)=X;
diff(:,2)=X_matlab;
disp('    TA sol    Matlab Sol')
disp(diff)

