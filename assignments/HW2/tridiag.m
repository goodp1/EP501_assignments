function x = tridiag(A,B)
% This function solves a set of liniar equations using Thomas algorithm
%
% x = tridiag(A,B)
% A - A matrix
% B - B matrix
%
% Created by: Patrick Good with reference to Hoffman textbook program 1.3

%size the system 
n = length(B);

%loop to create A' nx3 matrix to save space
Ap = zeros(n,3);
Ap(1,2)=A(1,1); %create first row
Ap(1,3)=A(1,2);
for i=2:n-1     
    Ap(i,1)=A(i,i-1); %collum 1
    Ap(i,2)=A(i,i);   %collum 2
    Ap(i,3)=A(i,i+1); %collum 3 
end %for
Ap(n,1)=A(n,n-1); %create last row
Ap(n,2)=A(n,n);

%loop to preform forward elimination
for i=2:n    
    em=Ap(i,1)/Ap(i-1,2); %A' matrix manipulation factor
    Ap(i,1)=em;
    Ap(i,2)=Ap(i,2)-em*Ap(i-1,3);
    
    B(i)=B(i)-Ap(i,1)*B(i-1); %B matrix manipulation    
end %for

%loop to preform back substitution 
x=zeros(n,1);
x(n)=B(n)/Ap(n,2); %solve last row
for i=n-1:-1:1     
    x(i)=(B(i)-Ap(i,3)*x(i+1))/Ap(i,2); %backwords loop for remaining rows    
end %for
end %function

    
    