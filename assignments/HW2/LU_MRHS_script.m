%Project 2
%Problem 1 
%Part c
%This script demos Dolitle LU Faactorization with multible right hand sides
%Created by: Patrick Good

%Clear the workspace
clc
clear

%Input Matrix
load('testproblem.mat')
b=cat(2,b,b2,b3);
%A = [80 -20 -20; -20 40 -20; -20 -20 130];
%b = [1 0 0;0 1 0;0 0 1];

%LU elimination function
[U,L] = LUfact(A);

% Measure the size of the b matrix 
[~ ,c] = size(b);

%loop preforming for and back substitutionss to solve for b_prime and x
x = cell(1,c); %reallacating for effeciency
b_prime = cell(1,c); %reallacating for effeciency
for n=1:c
%forword substitution solve for b
nref=length(b(:,n))+1;
b_big = forsub_LT(L,b(:,n));
b_prime{n} = b_big(:,nref); 

%back substitution solve for x 
Ub1 = cat(2,U,b_prime{n});
x{n} = backsub(Ub1);

end %for

%pull out and cat solution
% If you use an identity matrix for b this will give you the A inverse
SOL = x{1};
for n=2:c  
    
    SOL = cat(2,SOL,x{n});
     
end

%matlab result for checking 
m=A\b;

%print results
disp('L = ')
disp(L)
disp('U = ')
disp(U)
disp('X = ')
disp(SOL)
disp('Matlab Result = ')
disp(m)

% functions
function [U,L] = LUfact(A)

% This function preforms forword elimination
% Created by Patrick Good based on Dr. Zettergren's simple elimination
%example cdoe
% Inputs: forwordelim('A matrix', 'b matrix')

%preform forword elimination

%set up system size based on length of b
nref=length(A);
L = zeros(nref);

%concat A and b into 1 matrix
Awork=A;%cat(2,A,b);
for ir1=2:nref   %loop over rows starting at row 2
    for ir2=ir1:nref %loop to apply row operations
        %multiplier of the variable we are attempting to eliminate
        fact=Awork(ir2,ir1-1); %its ir-1 column of this row
        %subtract previous row from current row times the factor
        Awork(ir2,:)=Awork(ir2,:)-fact/Awork(ir1-1,ir1-1).*Awork(ir1-1,:);
        
        %build L matrix     
        L(ir2,ir1-1) = fact/Awork(ir1-1,ir1-1);
        
    end %for
end %for

%adjust L matrix
for n=1:nref
    L(n,n)=1;
end

%output
U = Awork;
L=L;

end %function

function Awork = forsub_LT(A,b)

%This function preforms foroawd substitution 
%Created by Patrick Good based on Dr. Zettergren's simple elimination
%example 

%Illustrate vanilla forward elimination
nref=length(b);                %system size for reference problem

%note that the elimination procedure coded below modifies the matrix B
Awork=cat(2,A,b);          %This is our working version of the matrix used to perform elimination (i.e. it will be modified)
for ir1=flip(2:nref)                                           %loop over rows from 2 to n performing elimination, this index marks what row we are starting the elimination from (i.e. using) for this particular column
    for ir2=flip(ir1:nref)                                     %this index marks the present position where elimination is being performed - i.e. where we are applying the elementary row operations
        fact=Awork(ir2,ir1-1);                                    %multiplier of the variable we are attempting to eliminate, its ir-1 column of this row
        Awork(ir2,:)=Awork(ir2,:)-fact/Awork(ir1-1,ir1-1).*Awork(ir1-1,:);    %subtract off previous row modified by a factor that eliminates the ir-1 column term in this row (so it has only super-diagonal elements), this is a little bit wasteful as it uses entire row...
    end 
end 

%disp('elim([Aref,bref]) = ');
%disp(Awork);


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
