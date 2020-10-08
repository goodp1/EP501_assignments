function Out = forelim_MRHS(A,b)

% This function preforms foroawd substitution
% Created by Patrick Good based on Dr. Zettergren's simple elimination
%example cdoe
% Inputs: forsub_MRHS('A matrix', 'b matrix', 'size of b matrix')

% Measure the size of the b matrix 
[~ ,c] = size(b);

%split b into seperate collums for the forword elimination 
B = cell(1,c); %reallacating for effeciency
for n=1:c
    B{n} = b(:,n);
end

%preform forword elimination 
Out = cell(1,c); %reallacating for effeciency
for n=1:c %loop for each b collum 
    
    %set up system size based on length of b 
    nref=length(B{n}); 
    
    %concat A and b into 1 matrix
    Awork=cat(2,A,B{n});         
    for ir1=2:nref   %loop over rows starting at row 2 
        for ir2=ir1:nref %loop to apply row operations
            %multiplier of the variable we are attempting to eliminate          
            fact=Awork(ir2,ir1-1); %its ir-1 column of this row
            %subtract previous row from current row times the factor  
            Awork(ir2,:)=Awork(ir2,:)-fact/Awork(ir1-1,ir1-1).*Awork(ir1-1,:);   
        end %for
    end %for
    
    Out{n} = Awork;
    
end %for

end %function
