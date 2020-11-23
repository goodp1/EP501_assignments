% EP501
% HW4 
% problem 2
% part c -> d
% This script demos bilinear interpolation  
% Created by: Patrick Good with bilinear sample code from Dr. Z

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
inpx = 2;
inpy = 3;

%serch function
[indexlx, indexhx, indexly, indexhy] = search2D(inpx,inpy,x,y);

%output
outx = ['X Value between index ' num2str(indexlx) ' ' 'and ' num2str(indexhx)];
disp(' ')
disp(outx)
outy = ['Y Value between index ' num2str(indexly) ' ' 'and ' num2str(indexhy)];
disp(' ')
disp(outy)

%% Illustration of bilinear interpolation, single interval of interest
%use 4x4 matrix to keep it simple trying a 96x96 was a disaster 
x=[xg(indexlx),xg(indexhx)]; %results from previuous index functions 
y=[yg(indexly),yg(indexhy)];
f=[f2D(indexly,indexlx) f2D(indexly,indexhx); f2D(indexhy,indexlx), f2D(indexhy,indexhx)];
[X,Y]=meshgrid(x,y);
x1=inpx;
y1=inpy;

% Manually written
fvec=f(:);
xvec=X(:);
yvec=Y(:);
M=[ones(length(xvec),1),xvec(:),yvec(:),xvec(:).*yvec(:)];
[Mmod,order]=Gauss_elim(M,fvec);
avec=backsub(Mmod(order,:));
finterpmanual=avec(1)+avec(2)*x1+avec(3)*y1+avec(4)*x1*y1;

% Matlab version
finterp=interp2(X,Y,f,x1,y1);

%Visual interpolation point:  x1,y1
figure(1);
imagesc(xg,yg,f2D);
axis xy;
xlabel('x');
ylabel('y');
c=colorbar;
ylabel(c,'f(x,y)')
hold on;
%plot(xvec,yvec,'w^','MarkerSize',15,'MarkerFaceColor','white');
plot(x1,y1,'wo','MarkerSize',20,'MarkerFaceColor','white');
hold off;

%output display
disp(' ')
disp('My results =')
disp(finterpmanual)
disp('Matlab Results =')
disp(finterp)
