function roots = quadsolve(T)
% roots = quadsolve(T)
% This function solves a quadratic equation and outputs the roots
% T - [a b c] input coefficients matrix
% ex: x^2+2x+3 T = [1 2 3]
% Created by: Patrick Good

%pull coefficents from input matrix
a = T(1);
b = T(2);
c = T(3);

%solve quadratic equation 
roots(1) = (-b+sqrt(b^2-4*a*c))/(2*a);
roots(2) = (-b-sqrt(b^2-4*a*c))/(2*a);

end %function 