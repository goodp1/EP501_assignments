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
maxx=20;
tol=1e-9;  %how close to zero we need to get to cease iterations
% 
% Objective function defs.
f=@objfunbessel;      %set the function for which we are finding roots, change to illustrate different problems
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
x0 = [2 5 8 11 14 17]; %initial guesses for roots

%loop to find roots of bessel function
xNewton=zeros(1,6);
for n = 1:6
verbose=true;
[xNewton(n),itNew,flag]=newton_approx(f,x0(n),100,tol,verbose);
disp('Number of iterations required to reach tolerance:  ');
disp(itNew);
end

%print results
disp('Root value through Newton method:  ');
disp(xNewton);

function [root,it,success]=newton_approx(f,x0,maxit,tol,verbose)

% root=newton_approx(f,x0)
% Created by Patrick Good based on code from Dr. Z
% finds a set of roots corresponding to the function f (input as a handle)
% approximates the derrivitive 

% Error checking of input and setting of default values
narginchk(3,5);   %check for correct number of inputs to function
if (nargin<3)
    maxit=100;       %maximum number of iterations allowed
end %if
if (nargin<4)
    tol=1e-6;        %how close to zero we need to get to cease iterations
end %if
if (nargin<5)
    verbose=false;
end %if

% Newton iterations
it=1;
root=x0;
fval=f(root);
converged=false;
while(~converged && it<=maxit)
    derivative=(f(root+tol)-fval)/tol; %approximate derrivitive 
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