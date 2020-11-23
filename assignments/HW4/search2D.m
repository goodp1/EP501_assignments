function [indexlx, indexhx, indexly, indexhy] = search2D(inpx,inpy,x,y)
% This function searches 2 arrays to find the indexes a input value is
% inbeween
% created by: Patrick Good
% inpx - x input value
% inpy - y input value
% x - x array
% y - y array

%search high x 
for i = 1:length(x) %loop through array 
    
    s = x(i);
    
    if s > inpx %check array value to input value 
        
        indexhx = i;
        break %exit loop if input is greater than array this found upper bound
        
    end %if
    
end %for

%search low x
for i = length(x):-1:1 %backwords loop through array
    
    s = x(i);
    
    if s < inpx %check array value to input value 
        
        indexlx = i;
        break %exit loop if input is less than array this found lower bound
        
    end %if
    
end %for

%search high y 
for i = 1:length(y) %loop through array 
    
    s = y(i);
    
    if s > inpy %check array value to input value 
        
        indexhy = i;
        break %exit loop if input is greater than array this found upper bound
        
    end %if
    
end %for

%search low y
for i = length(y):-1:1 %backwords loop through array
    
    s = y(i);
    
    if s < inpy %check array value to input value 
        
        indexly = i;
        break %exit loop if input is less than array this found lower bound
        
    end %if
    
end %for
end

