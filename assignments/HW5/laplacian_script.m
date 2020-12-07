% HW 5
% Problem 2
% Part a -> c
% This script demos computing the laplacian ophi a scalar phieild 

%clear the workspace
clc
clear
close all

%Input paramters
Q = 1; %[C]
a = 1; %[m]
e0 = 8.854E-12; %[phi/m]

%sizing
n = 50; %must be even number to plot Z=0 plane
x = linspace(-3*a,3*a,n);
y = linspace(-3*a,3*a,n);
z = linspace(-3*a,3*a,n);
[X,Y,Z] = meshgrid(x,y,z);

C1 = Q/(4*pi()*e0*a);
C2 = Q/(8*pi()*e0*a^3);

%scalar fuunction 
for i=1:n
    for j=1:n
        for k=1:n
            
            if sqrt(X(i,j,k)^2+Y(i,j,k)^2+Z(i,j,k)^2)<a
                
                phi(i,j,k) = C1 - C2*(X(i,j,k)^2+Y(i,j,k)^2+Z(i,j,k)^2-a^2);
                
            else
                
                phi(i,j,k) = Q/(4*pi()*e0*sqrt(X(i,j,k)^2+Y(i,j,k)^2+Z(i,j,k)^2));
                
            end
            
        end
    end
end

z0 = Z(:,:,n/2);

figure(1)
pcolor(x,y,phi(:,:,n/2))
colorbar
xlabel('X')
ylabel('Y')
title('Phi')

%gradient of scalar phiunction
dx=x(2)-x(1);
dy=y(2)-y(1);
dz=z(2)-z(1);

lx = n;
ly = n;
lz = n;

gradx=zeros(size(phi));
grady=zeros(size(phi));
gradz=zeros(size(phi));

%x component of gradient
gradx(1,:,:)=(phi(2,:,:)-phi(1,:,:))/dx;
for ix=2:lx-1
    gradx(ix,:,:)=(phi(ix+1,:,:)-phi(ix-1,:,:))/2/dx;    %\partial/\partial x
end %phior
gradx(lx,:,:)=(phi(lx,:,:)-phi(lx-1,:,:))/dx;

%y component of gradient
grady(:,1,:)=(phi(:,2,:)-phi(:,1,:))/dy;
for iy=2:ly-1
    grady(:,iy,:)=(phi(:,iy+1,:)-phi(:,iy-1,:))/2/dy;    %\partial/\partial y
end %phior
grady(:,ly,:)=(phi(:,ly,:)-phi(:,ly-1,:))/dy; 

%z component of gradient
gradz(:,:,1)=(phi(:,:,2)-phi(:,:,1))/dz;
for iz=2:lz-1
    gradz(:,:,iz)=(phi(:,:,iz+1)-phi(:,:,iz-1))/2/dz;    %\partial/\partial x
end %phior
gradz(:,:,lz)=(phi(:,:,lz)-phi(:,:,lz-1))/dz;

%lapacian 
f = gradx;
g = grady;
h = gradz;

%x component of gradient
divx(1,:,:)=(f(2,:,:)-f(1,:,:))/dx;
for ix=2:lx-1
    divx(ix,:,:)=(f(ix+1,:,:)-f(ix-1,:,:))/2/dx;    %\partial/\partial x
end %phior
divx(lx,:,:)=(f(lx,:,:)-f(lx-1,:,:))/dx;

%y component of divient
divy(:,1,:)=(g(:,2,:)-g(:,1,:))/dy;
for iy=2:ly-1
    divy(:,iy,:)=(g(:,iy+1,:)-g(:,iy-1,:))/2/dy;    %\partial/\partial y
end %phior
divy(:,ly,:)=(g(:,ly,:)-g(:,ly-1,:))/dy; 

%z component of divient
divz(:,:,1)=(h(:,:,2)-h(:,:,1))/dz;
for iz=2:lz-1
    divz(:,:,iz)=(h(:,:,iz+1)-h(:,:,iz-1))/2/dz;    %\partial/\partial x
end %phior
divz(:,:,lz)=(h(:,:,lz)-h(:,:,lz-1))/dz;


div = divx+divy+divz;  

figure(2)
pcolor(x,y,div(:,:,n/2))
colorbar
xlabel('X')
ylabel('Y')
title('Phi')

save problem_2_Data
                
