function P = polydivide(Q,N)

%P=polydivide(Q,N)
%Created by Patrick Good
%This function preforms polynomial deflation/division 
%Q - input function coef as matrix
%N - input factor value i.e N from "(x-N)"

[~,n] = size(Q); %degree polynomial
n=n-1;

%loop to calculate new coef
b = zeros(1,n);
b(1) = Q(1);
for k=2:n
    
b(k) = Q(k)+N*b(k-1); %eq 4.26 from Hoffman Textbook

end

P = b; %output
end %for
