%Project 1
%Problem 1 
%Parts a -> d
%This script preformes simple elimination for linear alegrbraic matrixcies 
%Created by: Patrick Good with example code from Dr. Z

%Clear the workspace
clc
clear

%Input Matrix
load('testproblem.mat')
%A = [80 -20 -20; -20 40 -20; -20 -20 130];
%b = [20; 20; 20];

%Forward elimination function
Awork = forwordelim(A,b);

%Back substitution function
Solution = backsub(Awork);

%Matlab built in function 
matlab = A\b;

%print results
disp('Initial Matrix A|B = ')
disp(cat(2,A,b)) %initial matrix
disp('My_Results = ')
disp(Solution) %foward and back sub results
disp('MatLab_Results = ')
disp(matlab) %matlab built in results

% ----------------------------------------------------------------------
%Lower Triangle Test Problem 

%Load lower triangle test problem 
load('lowertriang_testproblem.mat')

%Forward elimination 
LT_solution = forwordelim(L,bL);
LT_Final = LT_solution(:,9); %results

%Matlab built in function 
LT_matlab = L\bL;

%Print results
disp('-----------------Lower-Triangle System-----------------')
disp(' ')
disp('Initial Matrix L|bL = ')
disp(cat(2,L,bL)) %initial matrix
disp('LT_My_Results = ')
disp(LT_Final)
disp('MatLab_Results = ')
disp(LT_matlab) %matlab built in results

% functions
function Out = forwordelim(A,b)

% This function preforms forword elimination
% Created by Patrick Good based on Dr. Zettergren's simple elimination
%example cdoe
% Inputs: forwordelim('A matrix', 'b matrix')

%preform forword elimination

%set up system size based on length of b
nref=length(b);

%concat A and b into 1 matrix
Awork=cat(2,A,b);
for ir1=2:nref   %loop over rows starting at row 2
    for ir2=ir1:nref %loop to apply row operations
        %multiplier of the variable we are attempting to eliminate
        fact=Awork(ir2,ir1-1); %its ir-1 column of this row
        %subtract previous row from current row times the factor
        Awork(ir2,:)=Awork(ir2,:)-fact/Awork(ir1-1,ir1-1).*Awork(ir1-1,:);
    end %for
end %for

%output
Out = Awork;

end %function

function x=backsub(A)

% This function performs back substitution on an upper triangular matrix that has 
% Note that B is assumed to be upper triangular at this point.
% Sourced from Dr. Z 


n=size(A,1);                   %number of unknowns in the system
x=zeros(n,1);                  %space in which to store our solution vector
x(n)=A(n,n+1)/A(n,n); %finalized solution for last variable, resulting from upper triangular conversion

for ir1=n-1:-1:1
    x(ir1)=A(ir1,n+1);       %assume we're only dealing with a single right-hand side here.
    fact=A(ir1,ir1);         %diagonal element to be divided through doing subs for the ir2 row
    for ic=ir1+1:n
        x(ir1)=x(ir1)-A(ir1,ic)*x(ic);
    end %for
    x(ir1)=x(ir1)/fact;      %divide once at the end to minimize number of ops
end %for

end %function




