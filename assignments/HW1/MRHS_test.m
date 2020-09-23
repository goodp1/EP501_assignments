clc
clear
%matrixies 
A = [80 -20 -20; -20 40 -20; -20 -20 130]
b = [1 0 0; 0 1 0; 0 0 1]

%size b
[r,c] = size(b);

%split b
B = cell(1,c); %reallacating for effeciency 
for n=1:c
    
    B{n} = b(:,n);
    
end

%forsub 
Awork = cell(1,c);
for n=1:c
    
    Awork{n} = forsub(A,B{n});
    
end

%backsub
X = cell(1,c);
for n=1:c
    
    X{n} = backsub(Awork{n});
    
end

%cat solution If you use an identity matric for B this will give you the
%A^-1
SOL = X{1};
for n=2:c  
    
    SOL = cat(2,SOL,X{n});
     
end

disp('SOL = ')
disp(SOL)























