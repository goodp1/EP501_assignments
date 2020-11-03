% EP501 Midterm
% P2 
% part f 
% Created By: Patrick Good with source code from Dr. Z
% This script uses newtons exact method to solve the given problem
% requires:  fun?.m (set function pointer f to desired function at beginning of program)
clear
clc

% Params for Newton iteration
maxit=100;       %maximum number of iterations allowed
minx=-125;
maxx=125;
tol=1;        %how close to zero we need to get to cease iterations

% Objective function defs.
f=@fun1;      %set the function for which we are finding roots, change to illustrate different problems
fprime=@fun1_deriv;
x=linspace(minx,maxx,100000);   %grid for basic plotting purposes
ygrid=f(x);
verbose=true;

% Plot the function we are finding roots for
figure(1);
plot(x,ygrid);
title('Objective function')
xlabel('x')
ylabel('y')
axis tight;
grid on

% Newton-Rhapson root-finding method
verbose=true;
[xNewton,itNew,flag]=newton_exact(f,fprime,120,1000,tol,verbose);
disp('Root value through Newton method:  ');
disp(xNewton);
disp('Number of iterations required to reach tolerance:  ');
disp(itNew);

