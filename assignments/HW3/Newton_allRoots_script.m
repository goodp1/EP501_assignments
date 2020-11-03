% EP501 Midterm
% P3 
% parts c -> e
% Created By: Patrick Good with source code from Dr. Z
% This script finds roots for the given polynomial in the problem and 
%covers parts c through e
 
%clear the workspace
clear
clc

%Params for Newton iteration
maxit=100; %maximum number of iterations allowed
minx=0;
maxx=5.5;
tol=1e-9;  %how close to zero we need to get to cease iterations
verbose=true;

%polynomial function coef.
f=[1 -15 85 -225 274 -120]; %set the function for which we are finding roots, change to illustrate different problems

%initial guess
x0=0.5; 

%Plot the function we are finding roots for
x=minx:0.01:maxx;
ygrid=zeros(1,length(x));
for k=1:length(x)
    ygrid(k)=polyval(f,x(k));
end %for
figure(1);
plot(x,ygrid);
grid on
title('function')
xlabel('x')
ylabel('y')
axis tight;

xNewton = zeros(1,length(f)-3);
for k=1:length(f)-3 %loop to apply polynomial deflation 
%Get root
[xNewton(k),itNew,flag]=newton_approx_allRoots(f,x0,100,tol,verbose);
disp('Number of iterations required to reach tolerance:  ');
disp(itNew);

%print results
disp('Root value through Newton method:  ');
disp(xNewton);

f = polydivide(f,xNewton(k)); %deflate based on prev root 

end %for 

%solve final 2 roots with quadratic solver
froots = quadsolve(f);

%final outputs;
disp('Last 2 roots solved by quadratic equation:')
disp(froots)

function [root,it,success]=newton_approx_allRoots(f,x0,maxit,tol,verbose)

% root=newton_approx_allRoots(f,x0)
% Created by Patrick Good based on code from Dr. Z
% finds a set of roots corresponding to the function f (input as matrix for polyval)
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
fval=polyval(f,root); %use polyval because function is no longer objective function 
converged=false;
while(~converged && it<=maxit)
    derivative=(polyval(f,root+tol)-fval)/tol; %approximate derrivitive 
    if (abs(derivative)<100*tol)    %this (inflection point) will end up kicking the root really far away...
        converged=false;
        warning(' Derivative close to zero, terminating iterations with failed convergence... ');
        break;
    else
        root=root-fval./derivative;    % update root estimate
        fval=polyval(f,root);                  % see how far off we are from zero...
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

function P = polydivide(Q,N)
% P = polydivide(Q,N)
% Created by Patrick Good with reference to Hoffman textbook Eq 4.26
% This function preforms polynomial deflation/division  
% Q - input function coef as matrix ex: [1 2 3 4]
% N - input factor value i.e N from "(x-N)"

%find polynomial degree
[~,n] = size(Q); 
n=n-1;

%loop to calculate new coef
b = zeros(1,n);
b(1) = Q(1);
for k=2:n   
    
b(k) = Q(k)+N*b(k-1); %eq 4.26 from Hoffman Textbook

end %for

P = b; %output
end %for

function roots = quadsolve(T)
% roots = quadsolve(T)
% This function solves a quadratic equation and outputs the roots
% T - [a b c] input coefficients matrix
% ex: x^2+2x+3 T = [1 2 3]
% Created by: Patrick Good

%pull coefficents from input matrix
a = T(1);
b = T(2);
c = T(3);

%solve quadratic equation 
roots(1) = (-b+sqrt(b^2-4*a*c))/(2*a);
roots(2) = (-b-sqrt(b^2-4*a*c))/(2*a);

end %function   
