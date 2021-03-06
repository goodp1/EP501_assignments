function P = polydivide(Q,N)
% P = polydivide(Q,N)
% Created by Patrick Good with reference to Hoffman textbook Eq 4.26
% This function preforms polynomial deflation/division  
% Q - input function coef as matrix ex: [1 2 3 4]
% N - input factor value i.e N from "(x-N)"

%find polynomial degree
[~,n] = size(Q); 
n=n-1;

%loop to calculate new coef
b = zeros(1,n);
b(1) = Q(1);
for k=2:n   
    
b(k) = Q(k)+N*b(k-1); %eq 4.26 from Hoffman Textbook

end %for

P = b; %output
end %for
