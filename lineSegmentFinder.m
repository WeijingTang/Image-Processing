function cropped_line_img = lineSegmentFinder(orig_img, hough_img, hough_threshold)

%line_detected_img = lineFinder(orig_img, hough_img, hough_threshold)
edge_img = edge(orig_img);
[a,b]=size(orig_img);
[r,c]=size(hough_img);
deltaTheta=pi/c;
img=orig_img;
fh4 =figure,imshow(img);
theta=0;
hold on;
%go through all the values in x axis%
%check the point on the line y=f(x)%
%find if these is some points larger than zero in the points and neighbors%
%If there is no points larger than zero among the neighbors, then this point
% is the end point, stop plotting, otherwise plot the point%
for i=1:r
    for j=1:c
        if(hough_img(i,j)>=hough_threshold)
            theta=deltaTheta*j;pho=20-i;
            for x=1:b
              if(round(x*tan(theta)+pho/cos(theta))>1 & round(x*tan(theta)+pho/cos(theta))<a-1)
               if(edge_img(round(x*tan(theta)+pho/cos(theta))+1,x)~=0 | edge_img(round(x*tan(theta)+pho/cos(theta))-1,x)~=0 | edge_img(round(x*tan(theta)+pho/cos(theta)),x)~=0)
                  %disp(x);disp(round(x*tan(theta)+pho/cos(theta)));
                  plot(x,round(x*tan(theta)+pho/cos(theta)),'.');
               end
              end
            end
        end
    end
end

%capture the annotated image%           
cropped_line_img = saveAnnotatedImg(fh4);
%draw line and take screen shot
  