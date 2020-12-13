%Final Exam
%Problem 3 
%Part b->d
%This script demos BDF Eurler methods
%Created by: Patrick Good
%Source code from Dr. Z

%clear workspace
clc
clear
close all

% Define a 1D space and time grid in x for test problem
lx=64;
a=0;     %here a,b are the endpoints of the x-domain
b=1;     %use a square region for a test problem
x=linspace(a,b,lx);
dx=x(2)-x(1);        %grid spacing

% Define parameters of the parabolic equation, time variable
lambda=2;
tau=1/(2*pi/(2*dx))^2/lambda;    %diffusion time scale for the equation, based on smallest resolvable spatial mode
%dt=tau/5;              %time step

dtmargin=1/lambda/2*dx^2;
dt=5*dtmargin;
tmin=0;
tmax=1024*tau;          %go out to three times the diffusion time scale for the smallest possible mode
t=tmin:dt:tmax;
lt=numel(t);

% Trapezoidal implementation, note matrix solutions are more efficiently handled thru tri-diagonal solver; Matlab built-in will detect automatically
f2=zeros(lx,lt);
A=sparse(lx,lx);   %allocate sparse array storage (this matrix is to be tridiag)
b=zeros(lx,1);


f2(:,1)=sin(2*pi*x)+sin(8*pi*x);
for n=2:lt
    A(1,1)=1;
    b(1)=0;
    for ix=2:lx-1
        %i-1 coeff
        A(ix,ix-1)=-lambda/2/dx^2; %C
        
        %i coeff
        A(ix,ix)=1/dt+lambda/dx^2; %B
        
        %i+1 coeff
        A(ix,ix+1)=-lambda/2/dx^2; %A
        
        b(ix)=(f2(ix,n-1))/dt+(f2(ix+1,n)-2*f2(ix,n)+f2(ix-1,n))/dx^2*lambda; %adjusted for Euler
    end %for
    A(lx,lx)=1;
    b(lx)=0;
    
    fnow=A\b;
    f2(:,n)=fnow;
end %for

% Compare two solutions on plot
figure(1);
imagesc(t,x,f2);
colorbar;
axis xy;
xlabel('time (s)');
ylabel('x (m)');
title('1st Order BDF');
set(gca,'FontSize',16);

% Trapezoidal implementation, note matrix solutions are more efficiently handled thru tri-diagonal solver; Matlab built-in will detect automatically
f3=zeros(lx,lt);
A=sparse(lx,lx);   %allocate sparse array storage (this matrix is to be tridiag)
b=zeros(lx,1);


f3(:,1)=sin(2*pi*x)+sin(8*pi*x);
for n=2:lt-1
    A(1,1)=1;
    b(1)=0;
    for ix=2:lx-1
        %i-1 coeff
        A(ix,ix-1)=-lambda/2/dx^2; %C
        
        %i coeff
        A(ix,ix)=1/2/dt+lambda/dx^2; %B
        
        %i+1 coeff
        A(ix,ix+1)=-lambda/2/dx^2; %A
        
        b(ix)=(3*f3(ix,n+1)-4*f3(ix,n)+f3(ix,n-1))/2/dt+(f3(ix+1,n)-2*f3(ix,n)+f3(ix-1,n))/dx^2*(lambda); %adjusted for Euler
    end %for
    A(lx,lx)=1;
    b(lx)=0;
    
    fnow=A\b;
    f3(:,n)=fnow;
end %for

% Compare two solutions on plot
figure(2);
imagesc(t,x,f3);
colorbar;
axis xy;
xlabel('time (s)');
ylabel('x (m)');
title('2nd Order BDF');
set(gca,'FontSize',16);


% Compute and plot the analytical solution (see https://github.com/gemini3d/GEMINI-docs/blob/master/test_descriptions/GEMINItests.pdf for a derivation)
[T,X]=meshgrid(t,x);
tempexact=exp(-4*pi^2*lambda*T).*sin(2*pi*X)+exp(-64*pi^2*lambda*T).*sin(8*pi*X);

figure(3);
imagesc(t,x,tempexact);
colorbar;
axis xy;
xlabel('time (s)');
ylabel('x (m)');
title('Exact');
set(gca,'FontSize',16);













