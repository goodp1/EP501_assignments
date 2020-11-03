clc
clear  

load('iterative_testproblem.mat')

A=Ait;
B=bit;

n = length(B);

%create nX3 matrix
Ap = zeros(n,3);
Ap(1,2)=A(1,1);
Ap(1,3)=A(1,2);
for i=2:n-1
    
    Ap(i,1)=A(i,i-1);
    Ap(i,2)=A(i,i);
    Ap(i,3)=A(i,i+1);
   
end

Ap(n,1)=A(n,n-1);
Ap(n,2)=A(n,n);

%forward elimination
for i=2:n
    
    em=Ap(i,1)/Ap(i-1,2);
    Ap(i,1)=em;
    Ap(i,2)=Ap(i,2)-em*Ap(i-1,3);
    
    B(i)=B(i)-Ap(i,1)*B(i-1);
    
end

%backsub
Ait\bit

x=zeros(n,1);
x(n)=B(n)/Ap(n,2);
for i=n-1:-1:1
    
    x(i)=(B(i)-Ap(i,3)*x(i+1))/Ap(i,2);
    
end

disp(x)    
    
    