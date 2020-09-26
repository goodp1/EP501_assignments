function Awork = forsub(A,b)

%This function preforms foroawd substitution 
%Created by Patrick Good based on Dr. Zettergren's simple elimination
%example cdoe

%Illustrate vanilla forward elimination
nref=length(b);                %system size for reference problem


Awork=cat(2,A,b);          
for ir1=2:nref                                         
    for ir2=ir1:nref                                     
        fact=Awork(ir2,ir1-1);                                    
        Awork(ir2,:)=Awork(ir2,:)-fact/Awork(ir1-1,ir1-1).*Awork(ir1-1,:); 
       
       
    end %for
end %for

end %function 
