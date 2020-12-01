clc
clear

n = 50;
x = linspace(-2,2,n);
y = linspace(-2,2,n);

[X,Y] = meshgrid(x,y);

for k = 1:n
    
    for i = 1:n
        
        Bx(k,i) = -1*Y(k,i);
        By(k,i) = X(k,i);
        
    end
    
end

quiver(X,Y,Bx,By);