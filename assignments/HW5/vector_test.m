clc
clear

I = 100;
mu0 = 4*pi()*10^-7;
a = 0.005;

n = 25;
x = linspace(-3*a,3*a,n);
y = linspace(-3*a,3*a,n);

[X,Y] = meshgrid(x,y);

for k = 1:n
    
    for i = 1:n
        
        
        if sqrt(X(k,i)^2+Y(k,i)^2)<a
            
            Bx(k,i) = ((mu0*I)/(2*pi()*a^2))*sqrt(X(k,i)^2+Y(k,i)^2)*(-Y(k,i)/sqrt(X(k,i)^2+Y(k,i)^2));
            
            By(k,i) = ((mu0*I)/(2*pi()*a^2))*sqrt(X(k,i)^2+Y(k,i)^2)*(X(k,i)/sqrt(X(k,i)^2+Y(k,i)^2));
            
        else
            
            Bx(k,i) = ((mu0*I)/(2*pi()*sqrt(X(k,i)^2+Y(k,i)^2)))*(-Y(k,i)/sqrt(X(k,i)^2+Y(k,i)^2));
            
            By(k,i) = ((mu0*I)/(2*pi()*sqrt(X(k,i)^2+Y(k,i)^2)))*(X(k,i)/sqrt(X(k,i)^2+Y(k,i)^2));
            
        end
    end
    
end
figure(1)
quiver(X,Y,Bx,By);

figure(2)
pcolor(X,Y,By)

figure(3)
pcolor(X,Y,Bx)

figure(4)
B = Bx + By;
surf(X,Y,B)

 figure(6)
 C=curl(Bx,By);
 pcolor(X,Y,C)

