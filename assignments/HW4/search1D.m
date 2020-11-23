function [indexl, indexh] = search1D(inp,x)
% This function searches an array to find the indexes a input value is
% inbeween
% created by: Patrick Good
% inp - input value
% x - array

%search high 
for i = 1:length(x) %loop through array 
    
    s = x(i);
    
    if s > inp %check array value to input value 
        
        indexh = i;
        break %exit loop if input is greater than array this found upper bound
        
    end %if
    
end %for

%search low
for i = length(x):-1:1 %backwords loop through array
    
    s = x(i);
    
    if s < inp %check array value to input value 
        
        indexl = i;
        break %exit loop if input is less than array this found lower bound
        
    end %if
    
end %for

end

