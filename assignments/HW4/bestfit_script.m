% EP501
% HW4 
% problem 1
% part a -> d
% This script demos least squares fit 
% Created by: Patrick Good

%clear workspace
clc
clear
close all

%test problem
load('test_lsq.mat')
x = x;
y = ynoisy;

%ex: 4.14
% x = [1000 1500 2000 2500 3000]; 
% y = [1.141 1.2095 1.2520 1.2782 1.2955];

%ex: 4.15
% x = [300 400 500 600 700 800 900 1000]; 
% y = [1.0045 1.0134 1.0296 1.0507 1.0743 1.0984 1.1212 1.1410];

%order of polynomial 1 = linear 

N = 1;

%least sq fit function 
[f,P] = nleastsqfit(x,y,N);

%MatLab solution
mP = polyfit(x,y,N);
mf = polyval(mP,x);

%error vectors
error = f-y;
merror = mf-y;

%residuals
res = sum(error);
mres = sum(merror);

%Chi-squared statistic 

rsq = rchisq(y,f,sigmay,N);

%display results
disp('P = a0 + a1*X +...+ an*X^n')
disp(P)
disp('Residual = ')
disp(res)
disp('Reduced Chi-squared = ')
disp(rsq)

disp('MatLab P = a0 + a1*X +...+ an*X^n')
disp(mP)
disp('Matlab_Residual = ')
disp(mres)

disp('Matlab Fit Line Not included in plot because it is too simular')

%figures

figure(1) %data and my fit line
plot(x,y,'.',x,f)
legend('data','My Fit Line')
xlabel('X')
ylabel('Y')

figure(2)
plot(x,error)
title('My Fit Line error')
xlabel('X')
ylabel('error')

figure(3)
plot(x,merror,'r')
title('Matlab Fit Line error')
xlabel('X')
ylabel('error')









