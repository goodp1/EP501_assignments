% HW 5
% Problem 3
% This script demos Integration in multiple diminsions 

clc
clear
close all

load problem_2_Data.mat

%integrand 
intg = (e0.*div).*phi;

integral = 0;
%integral loop  
for i = 1:n-1
    for j = 1:n-1
        for k = 1:n-1
            
            int = (1/8)*(intg(i,j,k)+intg(i+1,j,k)+intg(i,j+1,k)...
                +intg(i,j,k+1)+intg(i+1,j+1,k)+intg(i,j+1,k+1)...
                +intg(i+1,j,k+1)+intg(i+1,j+1,k+1));
            
            integral = integral+int*dx*dy*dz;
            
        end
    end
end

    
%solution 
sol = -0.5*integral;

disp('Integral Solution = ')
disp(sol)


