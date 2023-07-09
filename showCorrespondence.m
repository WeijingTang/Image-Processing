function result_img = ...
    showCorrespondence(orig_img, warped_img, src_pts_nx2, dest_pts_nx2)

A=size(orig_img);B=size(warped_img);
%subplot(1, 2, 1); imshow(orig_img); 
%subplot(1, 2, 2); imshow(warped_img);
newImg=cat(2,orig_img, warped_img);
fh = figure,imshow(newImg);
%set(fh, 'Autoscale', 'off');
hold on;
D=size(newImg);
[a,b]=size(src_pts_nx2);
%disp(m);disp(n);disp('|||')
for i=1:a
    x=[(src_pts_nx2(i,1))/(A(2)+B(2)),(dest_pts_nx2(i,1))/(A(2)+B(2))+0.5];
    %disp(dest_pts_nx2(i,1));
    y=[1-(src_pts_nx2(i,2))/A(1),1-(dest_pts_nx2(i,2))/A(1)];
    %disp(dest_pts_nx2(i,2));
    %plot(x,y);
    %x=[src_pts_nx2(i,1),dest_pts_nx2(i,1)+800];
    %y=[800-src_pts_nx2(i,2),800-dest_pts_nx2(i,2)];
    
    %xx=dest_pts_nx2(i,1)+800;yy=dest_pts_nx2(i,2);
    %plot(xx,yy,'*');
  %  line(x, y,...
   %    'LineWidth',4, 'Color', [0, 1, 0]);
   annotation('line',x,y);
end
result_img = saveAnnotatedImg(fh);