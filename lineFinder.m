function line_detected_img = lineFinder(orig_img, hough_img, hough_threshold)

[a,b]=size(orig_img);
[r,c]=size(hough_img);
deltaTheta=pi/c;
img=orig_img;
fh4 =figure,imshow(img);
theta=0;
hold on;
%go through all the points, find the value larger than threshold%
%then to the point larger than threshold, put in theta and rho%
%get the relationship between x and y, then plot the line%
for i=1:r
    for j=1:c
        if(hough_img(i,j)>=hough_threshold)
            theta=deltaTheta*j;pho=20-i;
            x=0:b;
            y=x*tan(theta)+pho/cos(theta);
            hline2 = line( x,x*tan(theta)+pho/cos(theta) )
        end
    end
end

line_detected_img = saveAnnotatedImg(fh4);
%draw line and take screen shot
  
            
        