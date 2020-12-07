% HW 6
% Problem 2
% Part a -> c
% this script demos Runge-Kutta method 
% most of this script is from Dr. Z's course repository 

% RK2 and systems of equations, oscillating charge example
% charged particle moving in the x-y direction in a magnetic field which
% has only a z-component...
%
% m dv/dt = q v x B 
% (ma = F)
%
% v = (vx,vy); B=(0,0,B);
%
% Resulting in the following system of equations:
%    m dvx/dt = q vy B
%    m dvy/dt = -q vx B

%clear workspace
clc
clear
close all

%parms 
q=1.6e-19;
m=1.67e-27;
B=50000e-9;
omega=q*B/m;    %frequency of oscillation (can be shown via solution by hand gives a SHO)
tmin=0;
tmax=2*2*pi/abs(omega);    % follow particle for two oscillation periods
t=linspace(tmin,tmax,20);
dt=t(2)-t(1);
lt=numel(t);

%RK2
vx=zeros(1,lt);
vy=zeros(1,lt);
vx(1)=1e3;     % vx initial conditions
vy(1)=1e3;     % vy initial conditions
% Loop for applying RK2 to a system of two equations
for n=2:lt
    %step x and y components together, this is the half update
    vxhalf=vx(n-1)+dt/2*(omega*vy(n-1));
    vyhalf=vy(n-1)-dt/2*(omega*vx(n-1));
    
    %now the full update
    vx(n)=vx(n-1)+dt*(omega*vyhalf);
    vy(n)=vy(n-1)-dt*(omega*vxhalf);    
end %for

% RK4
alpha=2;
vx4=zeros(1,lt);
vy4=zeros(1,lt);
vx4(1)=1e3;
vy4(1)=1e3;
for n=2:lt
    dvx1=dt*fRK(t(n-1),omega*vx4(n-1),alpha);
    dvy1=dt*fRK(t(n-1),omega*vy4(n-1),alpha);
    
    dvx2=dt*fRK(t(n-1)+dt/2,omega*vx4(n-1)+dvx1/2,alpha);
    dvy2=dt*fRK(t(n-1)+dt/2,omega*vx4(n-1)+dvy1/2,alpha);
    
    dvx3=dt*fRK(t(n-1)+dt/2,omega*vx4(n-1)+dvx2/2,alpha);
    dvy3=dt*fRK(t(n-1)+dt/2,omega*vx4(n-1)+dvy2/2,alpha);
    
    dvx4=dt*fRK(t(n-1)+dt,omega*vx4(n-1)+dvx3,alpha);
    dvy4=dt*fRK(t(n-1)+dt,omega*vx4(n-1)+dvy3,alpha);
    
    vx4(n)=vx4(n-1)+1/6*(dvx1+2*dvx2+2*dvx3+dvx4);
    vy4(n)=vx4(n-1)+1/6*(dvx1+2*dvx2+2*dvx3+dvx4);
end %for

%bad problems going on above 

%Integrate velocity to get position as a fn. of time, this assumes that the
%particle is initially at x,y = (0,0)
x=cumtrapz(t,vx);    %Matlab built-in for accumulating an integral value
y=cumtrapz(t,vy);
vz=1e3;
z=vz*t;

%RK4
x4=cumtrapz(t,vx4);    %Matlab built-in for accumulating an integral value
y4=cumtrapz(t,vy4);
vz4=1e3;
z4=vz4*t;

% Plot velocity solutions
figure(1);
ax=plotyy(t,vx,t,vy);
set(ax(1),'FontSize',10);
set(ax(2),'FontSize',10);
xlabel('time (s)');
ylabel(ax(1),'v_x');
ylabel(ax(2),'v_y');

% Comet plot demo
figure(2);
comet3(x,y,z)
set(gca,'FontSize',10);
xlabel('x');
ylabel('y');
zlabel('z');

% Plot velocity solutions
figure(3);
ax=plotyy(t,vx4,t,vy4);
set(ax(1),'FontSize',10);
set(ax(2),'FontSize',10);
xlabel('time (s)');
ylabel(ax(1),'v_x');
ylabel(ax(2),'v_y');

% Comet plot demo
figure(4);
comet3(x4,y4,z4)
set(gca,'FontSize',10);
xlabel('x');
ylabel('y');
zlabel('z');