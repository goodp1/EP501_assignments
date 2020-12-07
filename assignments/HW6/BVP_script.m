% HW 6
% Problem 1
% Part a -> e
% This script demos solving a boundery value problem by FDE

%clear workspace
clc
clear
close all 

%parameters
a = 0.01; %m
l = a/5; %m
xp = -(9*a)/10; %m
xpp = (9*a)/10; %m
e0 = 8.854e-12; %F/m
n = 100;

%dielectric funstion
x = linspace(-a,a,n);

e = e0*(10*tanh((x-xp)/l)-10*tanh((x-xpp)/l));

%plot dielctric function 
plot(x,e,'LineWidth',1.5)
xlabel('X')
ylabel('Epsilon')
title('Dielectric function a = 0.01')

%de/dx
dx = x(2)-x(1);
dedx = zeros(1,n);
dedx(1) = e(2)-e(1)/dx;
for i = 2:n-1
    
    dedx(i) = (e(i+1)-e(i-1))/2/dx;
    
end
dedx(n) = e(n)-e(n-1)/dx;

%A matrix 
A = zeros(n);
A(1,:) = [-1/dx 1/dx zeros(1,n-2)];
for j = 2:n-1
    
    A(j,j+1) = (e(j)/dx^2)+(dedx(j)/(2*dedx(j)));
    A(j,j) = -2*e(i)/dx^2;
    A(j,j-1) = (e(j)/dx^2)-(dedx(j)/(2*dedx(j)));
    
end
A(n,:) = [zeros(1,n-1) 1];

%B matrix 
B = [1000; zeros(n-2,1); 100];

%solve
sol = A\B;

%plot
figure(2)
plot(sol,'r','LineWidth',1.5)
xlabel('X')
ylabel('Epsilon')
title('Solution')
    
    
    
    
    





