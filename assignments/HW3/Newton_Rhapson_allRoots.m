%HW 3
%P2 
%part b
%Created By: Patrick Good with source code from Dr. Z
%This script finds roots for non-linear functions with imaginary roots
%implies polynomial defaltion 
%aprroximates the derivitive 

%clear the workspace
clear
clc

% Params for Newton iteration
maxit=100; %maximum number of iterations allowed
minx=0;
maxx=2;
tol=1e-9;  %how close to zero we need to get to cease iterations
verbose=true;

% polynomial function coef.
f=[1 -3 4 -2]; %set the function for which we are finding roots, change to illustrate different problems

x0=[0.5 1i 1i]; %the function has imaginary roots so adding imaginary guesses 

% Plot the function we are finding roots for
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

xNewton = zeros(1,length(f)-1);
for k=1:length(f)-1 %loop to apply polynomial deflation 
%Get root
[xNewton(k),itNew,flag]=newton_approx_allRoots(f,x0(k),100,tol,verbose);
disp('Number of iterations required to reach tolerance:  ');
disp(itNew);

%print results
disp('Root value through Newton method:  ');
disp(xNewton);

f = polydivide(f,xNewton(k)); %deflate based on prev root 

end %for 

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


