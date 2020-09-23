function [Awork1] = forsub_MRHS(A,b1)

%This function preforms foroawd substitution 
%Created by Patrick Good based on Dr. Zettergren's simple elimination
%example cdoe

%Illustrate vanilla forward elimination
nref=length(b1);                %system size for reference problem

%note that the elimination procedure coded below modifies the matrix B
Awork1=cat(2,A,b1);          %This is our working version of the matrix used to perform elimination (i.e. it will be modified)
for ir1=2:nref                     %loop over rows from 2 to n performing elimination, this index marks what row we are starting the elimination from (i.e. using) for this particular column
    for ir2=ir1:nref               %this index marks the present position where elimination is being performed - i.e. where we are applying the elementary row operations
        fact=Awork1(ir2,ir1-1);    %multiplier of the variable we are attempting to eliminate, its ir-1 column of this row
        Awork1(ir2,:)=Awork1(ir2,:)-fact/Awork1(ir1-1,ir1-1).*Awork1(ir1-1,:); %subtract off previous row modified by a factor that eliminates the ir-1 column term in this row (so it has only super-diagonal elements), this is a little bit wasteful as it uses entire row...
        %disp('Awork = ')
        %disp(Awork)
    end 
end 


end
