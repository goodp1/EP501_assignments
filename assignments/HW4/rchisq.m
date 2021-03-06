function rsq = rchisq(y,f,sig,N)
% This function implements reduced Chi-squared 
% Created By: Patrick Good
% y - data y points
% f - fit line points
% sig - uncertainty 
% N - order of fit line polynomial 

s = 0;
for i = 1:length(y)
    
    s = s+(y(i)-f(i))^2/sig(i)^2; %sum least squares
    
end %for

v = length(y)-N; %degrees of freedom 

rsq = (1/v)*s;

end %function 