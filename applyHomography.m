function dest_pts_nx2 = applyHomography(H_3x3, src_pts_nx2)
[a,b]=size(src_pts_nx2);
dest_pts_nx2=[a,b];
for i=1:length(src_pts_nx2)
    S=[src_pts_nx2(i,1);src_pts_nx2(i,2);1];
    D=H_3x3*S;
    dest_pts_nx2(i,1)=round(D(1)/D(3));
    dest_pts_nx2(i,2)=round(D(2)/D(3));
end
    

