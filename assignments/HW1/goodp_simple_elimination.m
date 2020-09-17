clc
clear

load('testproblem.mat')


Awork = forsub(A,b)

backsub(Awork)

matlab = A\b