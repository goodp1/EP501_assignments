clc
clear
close all

load('test_lsq.mat')
x = x;
y = ynoisy;

% x = [300 400 500 600 700 800 900 1000];
% y = [1.0045 1.0134 1.0296 1.0507 1.0743 1.0984 1.1212 1.1410];


size = length(x);

%eq 4.151
a1 = size;
b1 = 0; %set up
c1 = 0;
for i=1:size
    
    b1 = b1+x(i);
    c1 = c1+y(i);
    
end

%eq 4.152
a2 = 0;
b2 = 0;
c2 = 0;
for i=1:size
    
    a2 = a2+x(i);
    b2 = b2+x(i)^2;
    c2 = c2+(x(i)*y(i));
    
end

%set up matrix for eval
A = zeros(2);
B = zeros(2,1);

A(1,1) = a1;
A(1,2) = b1;
A(2,1) = a2;
A(2,2) = b2;

B(1) = c1;
B(2) = c2;

%solve matrix
sol = A\B

%fit equation
p = [sol(2) sol(1)];

fy = polyval(p,x);

plot(x,y,'.',x,fy)





