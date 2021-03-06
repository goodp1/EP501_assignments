clc
clear


load('testproblem.mat')

%A = [80 -20 -20; -20 40 -20; -20 -20 130]
%b = [1 0 0; 0 1 0; 0 0 1]

% Use the Gaussian elimination function to solve the same system (include scaled pivoting)
[Amod,ord,detm]=Gauss_elim(A,b);

% Compare against built in MATLAB solution
xmat=A\b;
det_matlab = det(A);

disp('Elimination with scaled pivoting on matrix:  ');
disp(Amod(ord,:));
xgauss=backsub(Amod(ord,:));
disp('Gaussian elimination solution =  ');
disp(xgauss);
disp('Determinate = ')
disp(detm)
disp('Built-in MATLAB solution = ');
disp(xmat);
disp('Matlab Determinate = ')
disp(det_matlab)



