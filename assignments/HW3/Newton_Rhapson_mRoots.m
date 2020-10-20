%HW 3
%P1 
%patrs a -> c
%Created By: Patrick Good with source code from Dr. Z
%This script finds roots for non-linear functions 
%aprroximates the derivitive 

%clear the workspace
clear
clc

% Params for Newton iteration
maxit=100; %maximum number of iterations allowed
minx=0;
maxx=6;
tol=1e-9;  %how close to zero we need to get to cease iterations
% 
% Objective function defs.
f=@objfun4;      %set the function for which we are finding roots, change to illustrate different problems
fprime=@objfun4_deriv;
x=linspace(minx,maxx,100);   %grid for basic plotting purposes
ygrid=f(x);
verbose=true;


% Plot the function we are finding roots for
figure(1);
plot(x,ygrid);
grid on
title('Objective function')
xlabel('x')
ylabel('y')
axis tight;

% Newton-Rhapson root-finding method
%x0 = [2 5 8 11 14 17]; %initial guesses for roots
%for n = 1:6
verbose=true;
[xNewton,itNew,flag]=newton_exact_mRoots(f,fprime,.6,1  ,100,tol,verbose);
disp('Number of iterations required to reach tolerance:  ');
disp(itNew);
%end

%print results
disp('Root value through Newton method:  ');
disp(xNewton);
