function [f,P] = nleastsqfit(x,y,N)
% This function fits a curve to a set of data with a Nth degree polynomial
% Created by: Patrick Good based on Hoffman textbook ch 4
% x - x set of data
% y - y set of data
% N - order of polynomial 
% ***need forowrdelim and backsub functions in path***

%order polynomial 
N = N;

%size matrixies
A = zeros(N+1,N+1);
B = zeros(N+1,1);

%-----fill matrixies-----
%A matrix
nstart = 0; %this is for the exponent in eq 4.158
n = nstart:2*N;

%Eq 4.158 Hoffman 
for k = 1:N+1 %loop for rows
    
    for j = 1:N+1 %loop for collums
        
        for i = 1:length(x) %loop for x's
            
            A(k,j) = A(k,j)+x(i)^n(j); %each index 
            
        end %for
        
    end %for
    
    nstart = nstart+1; %adjust exponent for each row 
    n = nstart:2*N;
    
end %for

%B matrix
for k = 1:N+1 %loop for first collum 
    
    for i = 1:length(x) %loop for all x's and y's
        
        B(k,1) = B(k,1)+(x(i)^(k-1)*y(i));
        
    end %for
    
end %for

% solve system of equations 
sol = forwordelim(A,B);
sol = backsub(sol);

%fit equation
P = flip(sol.'); %reorder for polyval function 
f = polyval(P,x); %polyval to evaluate polynomial found above 

end
