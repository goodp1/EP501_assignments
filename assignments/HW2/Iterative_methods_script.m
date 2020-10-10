%Project 2
%Problem 2 
%Parts a -> d
%This script demos iteration with successive over-relaxation  
%Created by: Patrick Good based on code provided from Dr. Z
clc
clear

%inputs
load('iterative_testproblem.mat')

%initial guess 
x0 = zeros(50);
x0 = x0(:,1); 

%-----------Standard Gauss-Seidel----------------
%relaxation factor
omega = 1.0;

%converge criteria
tol = 10E-6;

%send to SOR function
[x,nit]=SOR(x0,Ait,bit,omega,tol);

%matlab solution
m = Ait\bit;

%-----------High Relaxation Param ----------------
%relaxation factor
omega2 = 1.11;

%converge criteria
tol2 = 10E-6;

%send to SOR function
[x2,nit2]=SOR(x0,Ait,bit,omega2,tol2);

%matlab solution
m2 = Ait\bit;

%-----------Optimal Relaxation Param ----------------
%relaxation factor
omega3 = 1.03;

%converge criteria
tol3 = 10E-6;

%send to SOR function
[x3,nit3]=SOR(x0,Ait,bit,omega3,tol3);

%optimal vs standard
diff = nit-nit3;

%matlab solution
m3 = Ait\bit;

%display results
disp('-------- Standard Gauss-Seidel -------- ')
disp('Matlab x = ')
disp(m)
disp('x = ')
disp(x)
fprintf('Iterations = %d \n',nit)
fprintf('Omega = %.2f \n',omega)
fprintf('Tolerance = %.2d \n\n',tol)

disp('-------- High Relaxation Param -------- ')
disp('Matlab x = ')
disp(m2)
disp('x = ')
disp(x2)
fprintf('Iterations = %d \n',nit2)
fprintf('Omega = %.2f \n',omega2)
fprintf('Tolerance = %.2d \n\n',tol2)

disp('-------- Optimal Relaxation Param -------- ')
disp('Matlab x = ')
disp(m3)
disp('x = ')
disp(x3)
fprintf('Iterations = %d \n',nit3)
fprintf('Omega = %.2f \n',omega3)
fprintf('Tolerance = %.2d \n',tol3)
fprintf('Saved %d iterations\n',diff)



function [x,nit]=SOR(x0,A,b,omega,tol,verbose)

%Modified from Dr. Z's Jacobi function and Program 1.4 in 
% Hoffman textbook 
%This function is an iterative solver that preforms
% successive over relaxation
 
% Check the inputs
narginchk(3,6);
if nargin<5
    tol=1e-6;
end %if
if nargin<6
    verbose=false;
end %if

% Setup iterations
maxit=100;    %max number of iterations
n=size(A,1);  %system size
residual=10*ones(n,1);
difftot=1e3+tol;   %max sure we enter iterations
x=x0;

% Perform iterations
it=1;
while(difftot>tol && it<=maxit)
    difftotprev=difftot;
    resprev=residual;
    xprev=x;
    for i=1:n
        residual(i)=b(i);
        for j=1:n
            residual(i)=residual(i)-A(i,j)*xprev(j); 
        end %for
        x(i)=xprev(i)+omega*residual(i)/A(i,i); %omega
    end %for
    difftot=sum(abs(residual-resprev));
    
    if (verbose)
        fprintf('x= ');
        for i=1:n
            fprintf('%f   ',x(i));
        end %for
        fprintf('\n');
        fprintf('it=%d; difftot = %e\n',it,difftot);
    end %if
    
    if (difftot>difftotprev && it>2)
        error('Solution appears to be diverging, check diagonal dominance...')
    end %if
    it=it+1;
end %while

nit=it-1;
if (nit==maxit)
    warning('Solution may not have converged fully...')
end %if

end %function
