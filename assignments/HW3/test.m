%test script
clc
clear


q = [1 -15 85 -225 274 -120]; %coefficients 
[~,n] = size(q); %dgree polynomial
n=n-1;

N = 1; %factor

b = zeros(1,n);
b(1) = q(1);
for k=2:n
    
b(k) = q(k)+N*b(k-1);

end

disp(b)
