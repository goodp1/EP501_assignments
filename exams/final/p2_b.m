%Final Exam
%Problem 2 
%Part b
%This script demos 3rd derivitive FDF
%Created by: Patrick Good

%clear workspace
clc
clear
close all
%function
x = linspace(0,2*pi(),100);
y = cos(x);
y2 = sin(x);

%FDF
dx=x(2)-x(1);
for i = 2:length(x)-2
    
    xp3(i) = x(i);
    yp3(i) = (y(i+2)-4*y(i+1)-2*y(i-1)+5*y(i))/dx^3;
    
end

plot(x,y,x,y2,'--',xp3,yp3,'--')
xlabel('X')
ylabel('Y')
legend('F(x)','Analitical F''''''(x)','F''''''(x)'); 