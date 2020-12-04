% HW 5
% Problem 1
% Part a -> d
% This script demos computing the curl of a magnetic feild 

%clear the workspace
clc
clear
close all

%input parameters
I = 100;
mu0 = 4*pi()*10^-7;
a = 0.005;

%sizing
n = 25;
x = linspace(-3*a,3*a,n);
y = linspace(-3*a,3*a,n);
[X,Y] = meshgrid(x,y);

%magnetic feild questions 
for k = 1:n %loop for rows
    
    for i = 1:n %loop for collums 
        
        %conditions
        if sqrt(X(k,i)^2+Y(k,i)^2)<a
            
            Bx(k,i) = ((mu0*I)/(2*pi()*a^2))*sqrt(X(k,i)^2+Y(k,i)^2)*(-Y(k,i)/sqrt(X(k,i)^2+Y(k,i)^2));
            
            By(k,i) = ((mu0*I)/(2*pi()*a^2))*sqrt(X(k,i)^2+Y(k,i)^2)*(X(k,i)/sqrt(X(k,i)^2+Y(k,i)^2));
            
        else
            
            Bx(k,i) = ((mu0*I)/(2*pi()*sqrt(X(k,i)^2+Y(k,i)^2)))*(-Y(k,i)/sqrt(X(k,i)^2+Y(k,i)^2));
            
            By(k,i) = ((mu0*I)/(2*pi()*sqrt(X(k,i)^2+Y(k,i)^2)))*(X(k,i)/sqrt(X(k,i)^2+Y(k,i)^2));
            
        end %if
    end %for   
end %for

%quiver plot
figure(1)
quiver(X,Y,Bx,By);
xlabel('X')
ylabel('Y')
title('Magnetic Feild')

%image plots
figure(2)
pcolor(X,Y,By)
colorbar
xlabel('X')
ylabel('Y')
title('By')

figure(3)
pcolor(X,Y,Bx)
colorbar
xlabel('X')
ylabel('Y')
title('Bx')

%curl 
lx=n;
ly=n;
dx=x(2)-x(1);
dy=y(2)-y(1);
f=By;
g=Bx;

%x-derivative part 
curlx=zeros(size(f));
curlx(:,1)=(f(:,2)-f(:,1))/dx;
for ix=2:lx-1
    curlx(:,ix)=(f(:,ix+1)-f(:,ix-1))/2/dx;
end %for
curlx(:,lx)=(f(:,lx)-f(:,lx-1))/dx;

%y-derivative part 
curly=zeros(size(y));
curly(1,:)=(g(2,:)-g(1,:))/dy;
for iy=2:ly-1
    curly(iy,:)=(g(iy+1,:)-g(iy-1,:))/2/dy;
end %for
curly(ly,:)=(g(ly,:)-g(ly-1,:))/dy;


curl = curlx-curly; 

figure(4)
pcolor(X,Y,curl)
colorbar
xlabel('X')
ylabel('Y')
title('Curl')

%matlab curl plot
% figure(6)
% C=curl(Bx,By);
% pcolor(X,Y,C)
% colorbar








