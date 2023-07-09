function [center, radius] = findSphere(img)
level=0;
BW =im2bw(img, level) 
imshow(BW);
center = regionprops(BW,'centroid');
diameters = regionprops(BW,'EquivDiameter');
diameters=diameters.EquivDiameter;
radius = diameters/2;