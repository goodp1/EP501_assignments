% EP501
% HW4 
% problem 2
% part b
% This script demos 2D serch function 
% Created by: Patrick Good

%clear workspace
clc
clear
close all

%load test problem
load('test_interp.mat')
x = xg;
y = yg;

%measure x vector 
sizex = length(xg);
minx = min(xg);
maxx = max(xg);

%measure y vector 
sizey = length(xg);
miny = min(xg);
maxy = max(xg);


%input points
echeck = false;
while echeck == false %loop untill input is withn range
    
prompt = ['Input x value between ' num2str(minx) ' ' 'and ' num2str(maxx) ': ']; %input promt string
inpx = input(prompt);
echeck = true;
if inpx < minx || inpx > maxx %check if input is within range 
    
    disp('input not in range')
    echeck = false; %error determined continue in loop 
    
end %if

end %while  

echeck = false;
while echeck == false %loop untill input is withn range
    
prompt = ['Input y value between ' num2str(miny) ' ' 'and ' num2str(maxy) ': ']; %input promt string
inpy = input(prompt);
echeck = true;
if inpy < miny || inpy > maxy %check if input is within range 
    
    disp('input not in range')
    echeck = false; %error determined continue in loop 
    
end %if

end %while 

%serch function
[indexlx, indexhx, indexly, indexhy] = search2D(inpx,inpy,x,y);

%output
outx = ['X Value between index ' num2str(indexlx) ' ' 'and ' num2str(indexhx)];
disp(' ')
disp(outx)
outy = ['Y Value between index ' num2str(indexly) ' ' 'and ' num2str(indexhy)];
disp(' ')
disp(outy)

    
    
    
    
