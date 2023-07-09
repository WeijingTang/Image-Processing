function H_3x3 = computeHomography(src_pts_nx2, dest_pts_nx2)

%map a 2-D point to a 3-D point

%src_pts_nx2  = [xs1 ys1; xs2 ys2; xs3 ys3; xs4 ys4];
%dest_pts_nx2 = [xd1 yd1; xd2 yd2; xd3 yd3; xd4 yd4];
%h=zeros(3,3); %initialize homography

[a,b]=size(dest_pts_nx2);
A=zeros(a*2,3*3);
for i=1:a*2
        if( mod(i,2)==1 )
            A(i,1)=src_pts_nx2((i+1)/2,1);
            A(i,2)=src_pts_nx2((i+1)/2,2);
            A(i,3)=1;
            A(i,4)=0;A(i,5)=0;A(i,6)=0;
            A(i,7)=-1*dest_pts_nx2((i+1)/2,1)*src_pts_nx2((i+1)/2,1);
            A(i,8)=-1*dest_pts_nx2((i+1)/2,1)*src_pts_nx2((i+1)/2,2);
            A(i,9)=-1*dest_pts_nx2((i+1)/2,1);
        end
        if( mod(i,2)==0 )
            A(i,1)=0;A(i,2)=0;A(i,3)=0;
            A(i,4)=src_pts_nx2(i/2,1);
            A(i,5)=src_pts_nx2(i/2,2);
            A(i,6)=1;
            A(i,7)=-1*dest_pts_nx2(i/2,2)*src_pts_nx2(i/2,1);
            A(i,8)=-1*dest_pts_nx2(i/2,2)*src_pts_nx2(i/2,2);
            A(i,9)=-1*dest_pts_nx2(i/2,2);
        end
        
end

% get eigenvalue
B=eig(transpose(A)*A);
[V,D]=eig(transpose(A)*A);

% smallest, negative? or abstract? what if many smallest?
smallest=0;
colLabel=0;
for i=1:length(B)
    if(B(i)<smallest)
        smallest=B(i);
        colLabel=i;
    end
end

C=V(1:end,1);

for k=1:(length(C)/3)
    H_3x3(k,1)=C(3*(k-1)+1);
    H_3x3(k,2)=C(3*(k-1)+2);
    H_3x3(k,3)=C(3*(k-1)+3);
end


