img = imread('Vincent_van_Gogh.png')
class(img)
max(img(:))
img = im2double(img);

class(img)
max(img(:))

%figure, imshow(img);

red_channel = img(:, :, 1); 
%figure, imshow(red_channel);
red_image = zeros(size(img)); red_image(:, :, 1) = red_channel; 
%figure, imshow(red_image);

green_channel = img(:, :, 2); 
%figure, imshow(green_channel);
green_image = zeros(size(img)); green_image(:, :, 2) = green_channel; 
%figure, imshow(green_image);

blue_channel = img(:, :, 3); 
%figure, imshow(blue_channel);
blue_image = zeros(size(img)); blue_image(:, :, 3) = blue_channel; 
%figure, imshow(blue_image);

collage_1x2 = [img, red_image, green_image, blue_image]; 
%imshow(collage_1x2);

collage_2x2 = [img, red_image;green_image, blue_image]; 
figure,imshow(collage_2x2);