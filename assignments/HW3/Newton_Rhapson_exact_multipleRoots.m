%HW 3
%P2 
%patr a 
%Created By: Patrick Good with source code from Dr. Z
%This script finds roots for non-linear functions 
%exact derivitive 

%clear the workspace
clear
clc

% Params for Newton iteration
maxit=100; %maximum number of iterations allowed
minx=0.5;
maxx=5.5;
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
x0 = [0.5 1.7 2.7 3.7 4.7]; %initial guesses for roots

%loop to find roots of bessel function
xNewton=zeros(1,5);
for n = 1:5
verbose=true;
[xNewton(n),itNew,flag]=newton_exact(f,fprime,x0(n),1000,tol,verbose);
disp('Number of iterations required to reach tolerance:  ');
disp(itNew);
end

%print results
disp('Root value through Newton method:  ');
disp(xNewton);

function [root,it,success]=newton_exact(f,fprime,x0,maxit,tol,verbose)

% root=newton_exact(f,fprime)
% Code from Dr. Z
% finds a set of roots corresponding to the function f (input as a handle)
% given a function which computes the derivative

% Error checking of input and setting of default values
narginchk(3,6);   %check for correct number of inputs to function
if (nargin<4)
    maxit=100;       %maximum number of iterations allowed
end %if
if (nargin<5)
    tol=1e-6;        %how close to zero we need to get to cease iterations
end %if
if (nargin<6)
    verbose=false;
end %if


% Make sure we don't start at an inflection point with zero derivative
if (abs(fprime(x0))<tol)
    warning(' Attempting to start Newton iterations near an inflection point, you may wish to restart with a different guess...');
    x0=x0+1;   %bump the guess a ways off of initial value to see if we can get anything sensible
end %if


%Newton iterations
it=1;
root=x0;
fval=f(root);
converged=false;
while(~converged && it<=maxit)
    derivative=fprime(root);
    if (abs(derivative)<100*tol)    %this (inflection point) will end up kicking the root really far away...
        converged=false;
        warning(' Derivative close to zero, terminating iterations with failed convergence... ');
        break;
    else
        root=root-fval./derivative;    % update root estimate
        fval=f(root);                  % see how far off we are from zero...
        if (verbose)
            fprintf(' iteration: %d; root:  %f + %f i; function value: %f, derivative:  %f \n',it,real(root),imag(root),fval,derivative);
        end %if
        it=it+1;
        converged=abs(fval)<tol;
    end %if
end %while
it=it-1;

if (~converged)
    warning('Used max number of iterations, or derivative near zero...')
    success=false;
else
    success=true;
end %if

end %function
