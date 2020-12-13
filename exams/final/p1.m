%Final Exam
%Problem 1 
%Part b->e
%This script demos RK4 Stability
%Created by: Patrick Good with source code from Dr.Z
%web sources: http://web.mit.edu/course/16/16.90/OldFiles/BackUp/www/pdfs/Chapter10.pdf
% https://en.wikiversity.org/wiki/Numerical_Analysis/stability_of_RK_methods

%clear workspace
clc
clear
close all 

%plot polynomial
adt=linspace(-3,1,100);
ladt=numel(adt);
G=zeros(ladt,1);
for igain=1:ladt
    G(igain)=(1+adt(igain)+(1/2)*adt(igain)^2+(1/6)*adt(igain)^3+(1/24)*adt(igain)^4);
end %for
figure(1);
plot(adt,G)
xlabel('\alpha \Delta t');
ylabel('gain factor');

%plot stability criteria
n = 100;
x = linspace(-3,3,n);
y = linspace(-3,3,n);

%mesh
[X,Y] = meshgrid(x,y);
z = X+1j*Y;
g = 1+z+0.5*z.^2+(1/6)*z.^3+(1/24)*z.^4;

%absoulte vaule G
gabs = abs(g);

%plot
figure(2)
contour(x,y,gabs,[-1 1],'k-');
xlabel('Real G');
ylabel('Imag G');
title('Stability limits')
grid on

%----RK4 method----

% Gridding in time
N=12;
tmin=0;
tmax=10;
t=linspace(tmin,tmax,N);
dt=t(2)-t(1);


% Test problem, true solution
y0=1;
alpha=2;
ybar=y0*exp(-alpha*t);

% Second order method; RK2
yRK2=zeros(1,N);
yRK2(1)=y0;
for n=2:N
    yhalf=yRK2(n-1)+dt/2*(-alpha*yRK2(n-1));
    yRK2(n)=yRK2(n-1)+dt*(-alpha*yhalf);
end %for


% RK4 example; comparison against first and second order methods
yRK4=zeros(1,N);
yRK4(1)=y0;
for n=2:N
    dy1=dt*fRK(t(n-1),yRK4(n-1),alpha);
    dy2=dt*fRK(t(n-1)+dt/2,yRK4(n-1)+dy1/2,alpha);
    dy3=dt*fRK(t(n-1)+dt/2,yRK4(n-1)+dy2/2,alpha);
    dy4=dt*fRK(t(n-1)+dt,yRK4(n-1)+dy3,alpha);
    
    yRK4(n)=yRK4(n-1)+1/6*(dy1+2*dy2+2*dy3+dy4);
end %for

% Plots of RK solutions against true solution
figure(3);
clf;
plot(t,ybar,'o-');
xlabel('t');
ylabel('y(t)');
set(gca,'FontSize',20);
figure(3);
hold on;
plot(t,yRK2,'--')
figure(3);
plot(t,yRK4,'^-')
legend('exact','RK2','RK4')
title(['Time Step = ' num2str(dt)])

%time step
ts = dt;
disp('Time step = ')
disp(dt)

function fval=fRK(t,y,alpha)
   fval=-alpha*y;
end %function


