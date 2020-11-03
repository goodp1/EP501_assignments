% EP501 Midterm
% P3
% part a
% This script demos solving a quadratic equation analytically
% see quadsolve() function for solver
% Created by: Patrick Good

%clear the workspace
clc
clear

%coefficents of quadratic eqaution 
T = [2 -6 4];

%solver
roots = quadsolve(T);

%display outputs
disp('Roots = ')
disp(roots)