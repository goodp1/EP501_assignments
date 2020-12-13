%Final Exam
%Problem 2 
%Part f
%This script demos 4th derivitive from talor serries matrix
%Created by: Patrick Good

%clear workspace
clc
clear
close all

%function
x = linspace(0,2*pi(),1000);
y = cos(x);

%4th derivitive from talor serries matrix
dx=x(2)-x(1);
for i = 3:length(x)-3
    
    xp4(i) = x(i);
    yp4(i) = (y(i-2)-4*y(i-1)-4*y(i+1)+y(i+2)-6*y(i))/dx^4;
    
end

%plot
plot(x,y,xp4,yp4,'--')
xlabel('X')
ylabel('Y')
legend('F(x)','F(4)(x)'); 