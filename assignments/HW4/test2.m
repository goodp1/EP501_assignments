clc
clear
close all

load('test_interp.mat')

x = xg;

%measure x vector 
size = length(xg);
min = min(xg);
max = max(xg);

%input point
echeck = false;
while echeck == false %loop untill input is withn range
    
prompt = ['Input value between ' num2str(min) ' ' 'and ' num2str(max) ': ']; %input promt string
inp = input(prompt);
echeck = true;
if inp < min || inp > max %check if input is within range 
    
    disp('input not in range')
    echeck = false; %error determined continue in loop 
    
end %if

end %while  

%serch function
[indexl, indexh] = search1D(inp,x);

%output
out = ['Value between index ' num2str(indexl) ' ' 'and ' num2str(indexh)];
disp(' ')
disp(out)

    
    
    
    
