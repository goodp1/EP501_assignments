%Project 1
%Problem 2 
%Parts a -> d
%This script demos Gauss-Jordan Elimination 
%Created by: Patrick Good 

clear
clc
% Input matrixies 
%A = [80 -20 -20; -20 40 -20; -20 -20 130];
%b = [20;20;20];
%b = [1 0 0;0 1 0;0 0 1];
load('testproblem.mat')
b = eye(8);

% Measure the size of the b matrix 
[~ ,c] = size(b);

% Send A and b to Gauss-Jordan elimination function 
Awork = gaussjordan(A,b);

% Pull solution from cell data type
X = cell(1,c); %reallacating for effeciency
for n=1:c
    
    X{n} = Awork{n};
    
end

% Concat the solution back to 1 matrix 
% If you use an identity matrix for b this will give you the A inverse
SOL = X{1};
for n=2:c  
    
    SOL = cat(2,SOL,X{n});
     
end

%Matlab Inverse Solution
M_SOL = inv(A);

% Display the results 
disp('Solution = ')
disp(SOL)
disp('MatLab Inverse Solution =')
disp(M_SOL)

%function 
function Out = gaussjordan(A,b)

% This function preforms Gauss-Jordan elimination
% Created by Patrick Good based on Dr. Zettergren's simple elimination
%example cdoe
% Inputs: gaussjordan('A matrix', 'b matrix', 'size of b matrix')

% Measure the size of the b matrix 
[~ ,c] = size(b);

%split b into seperate collums for the elimination
B = cell(1,c); %reallacating for effeciency
for n=1:c
    B{n} = b(:,n);
end

%preform Gauss-Jordan elimination
Out = cell(1,c); %reallacating for effeciency
for n=1:c %loop for each b collum
    
    %set up system size based on length of b
    nref=length(B{n});
    
    %concat A and b into 1 matrix
    Awork=cat(2,A,B{n});
    
    for r=1:nref %loop over rows
        
        Awork(r,:)=Awork(r,:)./Awork(r,r); %reference row scaling        
        for k=1:nref %loop to preform elimination on rows
            
            if k==r %check if on reference row                
                Awork(k,:)=Awork(k,:); %do not eliminate reference row                 
            else                 
                Awork(k,:)=Awork(k,:)-(Awork(k,r).*Awork(r,:)); %elimination                
            end %if
            
        end %for                    
    end %for    
    %Output 
    Out{n} = Awork(:,nref+1);        
end %for
end %function



























