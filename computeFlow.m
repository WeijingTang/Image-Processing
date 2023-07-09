function result = computeFlow(img1, img2, win_radius, template_radius, grid_MN)

fh1 =figure,imshow(img1);
A=size(img1);
hold on;
u=zeros(A(1)-2*win_radius,A(2)-2*win_radius);
v=zeros(A(1)-2*win_radius,A(2)-2*win_radius);
for i=win_radius+1:A(1)-win_radius
    for j=win_radius+1:A(2)-win_radius
        temp=img1(i-template_radius:i+template_radius,j-template_radius:j+template_radius);   
        box=img2(i-win_radius:i+win_radius,j-win_radius:j+win_radius);  
        c = normxcorr2( temp,box);   
        [ypeak, xpeak] = find(c==max(c(:)));
        
        yoffSet = ypeak(1)-(template_radius);%xmin and ymin in window of second image of templete
        xoffSet = xpeak(1)-(template_radius);
        %disp(yoffSet);disp(xoffSet);
        u(i-win_radius,j-win_radius)=xoffSet-win_radius;v(i-win_radius,j-win_radius)=yoffSet-win_radius;
    end
end

x=1:A(2)-2*win_radius;
y=1:A(1)-2*win_radius;
%quiver(x+win_radius,y+win_radius,u,v);

newX=x+win_radius;
newY=y+win_radius;
[X,Y]=ndgrid(1:grid_MN(1)-1:A(2)-2*win_radius,1:grid_MN(2)-1:A(1)-2*win_radius);
%disp(X);disp(Y);
X=X(:,1);Y=Y(1,:);
%disp(X);disp(Y);
%disp(size(u));disp(size(v));
D=size(u);
uu=zeros(length(Y),length(X));vv=zeros(length(Y),length(X));
for i=1:length(Y)
    for j=1:length(X)
        %disp(Y(i));disp(X(j));disp(u(Y(i),X(j)));disp('----');
        if(Y(i)<D(1)& X(j)<D(2))
            
          uu(i,j)=u(Y(i),X(j));
          vv(i,j)=v(Y(i),X(j));
        end
    end
end

quiver(X+win_radius,Y+win_radius,uu,vv); 

result = saveAnnotatedImg(fh1);



        
        
        
   