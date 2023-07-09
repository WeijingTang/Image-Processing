function light_dirs_5x3 = computeLightDirections(center, radius, img_cell)
%I=zeros(5,1);
% AA=surfnorm(img_cell{1}); %result
[a,b]=size(img_cell{1});
for i=1:5
    S=img_cell{i};
    brightest=max(S(:));
    xTotal=0;yTotal=0;counter=0;
    for j=1:a
        for k=1:b
            if(S(j,k)==brightest)
                %(k-center.Centroid(1))
                xTotal=xTotal+k-center.Centroid(1);
                yTotal=yTotal+j-center.Centroid(2);
                counter=counter+1;
            end
        end
    end
    
    %syms x y;
    %g=gradient(z,[x,y]);
    x=xTotal/counter;
    y=yTotal/counter;
    z=sqrt(radius^2-(x)^2-(y)^2);   
    
    %c=subs(g(1));
    %d=subs(g(2));
    %c=vpa(c);
    %d=vpa(d);
    %n=[c*(-1),d*(-1),1];
    n=[x,y,z*(1)];
    n=( n )*double(brightest)/radius;%scale
    %figure
    %contour(x,y,z)
    %hold on
    %quiver(x,y,px,py)
    %hold off
    light_dirs_5x3(i,:)=n;
    
end





