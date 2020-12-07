% HW 5
% Problem 4
% Part a -> d
% This script demos computing the curl of a magnetic feild

clc
clear
close all

load problem_1_Data.mat

pcolor(X,Y,sqrt(Bx.^2+By.^2))
colorbar
xlabel('X')
ylabel('Y')
title('B')

%circle
nc = 100;
phi = linspace(0,2*pi(),nc);

r0 = 2*a;

xc = r0*cos(phi);
yc = r0*sin(phi);

hold on
plot(xc,yc,'--r','LineWidth',2)

for i = 1:nc

Bxc(i) = ((mu0*I)/(2*pi()*sqrt(xc(i)^2+yc(i)^2)))*(-yc(i)/sqrt(xc(i)^2+yc(i)^2));

Byc(i) = ((mu0*I)/(2*pi()*sqrt(xc(i)^2+yc(i)^2)))*(xc(i)/sqrt(xc(i)^2+yc(i)^2));

end

Bc = sqrt(Bxc.^2+Byc.^2);

drc = (phi(2)-phi(1))*r0; %arc length 
integral = 0;
for k = 1:nc-1
    
    line = 0.5*((Bc(k))+(Bc(k+1)))*drc;
    
    integral = integral+line;
    
end

I = integral*(1/mu0);
% figure(2)
% plot(phi,Bc)

disp('I = ')
disp(I)
    
    
