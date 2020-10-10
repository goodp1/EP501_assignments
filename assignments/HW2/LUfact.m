function [U,L] = LUfact(A)

% This function preforms forword elimination
% Created by Patrick Good based on Dr. Zettergren's simple elimination
%example cdoe
% Inputs: forwordelim('A matrix', 'b matrix')

%preform forword elimination

%set up system size based on length of b
nref=length(A);
L = zeros(nref);

%concat A and b into 1 matrix
Awork=A;%cat(2,A,b);
for ir1=2:nref   %loop over rows starting at row 2
    for ir2=ir1:nref %loop to apply row operations
        %multiplier of the variable we are attempting to eliminate
        fact=Awork(ir2,ir1-1); %its ir-1 column of this row
        %subtract previous row from current row times the factor
        Awork(ir2,:)=Awork(ir2,:)-fact/Awork(ir1-1,ir1-1).*Awork(ir1-1,:);
        
        %build L matrix     
        L(ir2,ir1-1) = fact/Awork(ir1-1,ir1-1);
        
    end %for
end %for

%adjust L matrix
for n=1:nref
    L(n,n)=1;
end

%output
U = Awork;
L=L;

end %function