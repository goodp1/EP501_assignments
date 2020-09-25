function Out = gaussjordan(A,b)

% This function preforms Gauss-Jordan elimination
% Created by Patrick Good based on Dr. Zettergren's simple elimination
%example cdoe
% Inputs: gaussjordan('A matrix', 'b matrix', 'size of b matrix')

% Measure the size of the b matrix 
[~ ,c] = size(b);

%split b into seperate collums for the elimination
B = cell(1,c); %reallacating for effeciency
for n=1:c
    B{n} = b(:,n);
end

%preform Gauss-Jordan elimination
Out = cell(1,c); %reallacating for effeciency
for n=1:c %loop for each b collum
    
    %set up system size based on length of b
    nref=length(B{n});
    
    %concat A and b into 1 matrix
    Awork=cat(2,A,B{n});
    
    for r=1:nref %loop over rows
        
        Awork(r,:)=Awork(r,:)./Awork(r,r); %reference row scaling        
        for k=1:nref %loop to preform elimination on rows
            
            if k==r %check if on reference row                
                Awork(k,:)=Awork(k,:); %do not eliminate reference row                 
            else                 
                Awork(k,:)=Awork(k,:)-(Awork(k,r).*Awork(r,:)); %elimination                
            end %if
            
        end %for                    
    end %for    
    %Output 
    Out{n} = Awork(:,nref+1);        
end %for
end %function
