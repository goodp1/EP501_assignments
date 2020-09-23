clc
clear

% Illustrate vanilla forward elimination
%nref=6;                %system size for larger reference problem
%A=randn(nref,nref);    %augmented matrix containing RHS of system of equations, in practice you'd want to check conditioning...
%b=randn(nref,1);    %RHS

%load('testproblem.mat')

A = [80 -20 -20; -20 40 -20; -20 -20 130]
b = [1 0 0; 0 1 0; 0 0 1]

% Use the Gaussian elimination function to solve the same system (include scaled pivoting)
[Amod,ord,detm]=Gauss_elim(A,b,true);

disp('Elimination with scaled pivoting on matrix:  ');
disp(Amod(ord,:));
xgauss=backsub(Amod(ord,:));
disp('Back substitution solution using Gaussian elimination result:  ');
disp(xgauss);

disp('Determinate = ')
disp(detm)




% Compare against built in MATLAB solution
xmat=A\b;
disp('Built-in MATLAB solution');
disp(xmat);

det_matlab = det(A)

