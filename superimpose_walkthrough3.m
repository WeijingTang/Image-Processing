
iheartny_img = imread('I_Love_New_York.png');
%figure, imshow(iheartny_img);
gray_iheartny_img = rgb2gray(iheartny_img);
%figure, imshow(gray_iheartny_img);
threshold = 0.5;
binary_mask = im2bw(gray_iheartny_img, threshold);

nyc_img = imread('nyc.png');
height = size(nyc_img, 1);   
scale = 500/height;
small_nyc = imresize(nyc_img, scale);

iheight = size(iheartny_img, 1); 
iscale = 400/iheight;
resized_mask = imresize(binary_mask, iscale);

%imshow(resized_mask);

iresized_mask = ~resized_mask; 
%imshow(iresized_mask);

size(small_nyc)
size(iresized_mask)

height_diff = size(small_nyc, 1) - size(iresized_mask, 1);
width_diff = size(small_nyc, 2) - size(iresized_mask, 2);
mask_height = size(iresized_mask, 1); mask_width = size(iresized_mask, 2);

%imshow(iresized_mask);

iresized_mask = [zeros(mask_height, width_diff/2),...
    iresized_mask, zeros(mask_height, width_diff/2)];
%imshow(iresized_mask); 

mask_width = size(iresized_mask, 2);
iresized_mask = [zeros(height_diff/2, mask_width);...
    iresized_mask; zeros(height_diff/2, mask_width)];
%imshow(iresized_mask); 

iresized_mask = logical(iresized_mask);
%imshow(iresized_mask);
%ipadded_mask = padarray(iresized_mask, [height_diff/2 width_diff/2]);

red = [255, 0, 0];
love_small_nyc = small_nyc;

red_channel = love_small_nyc(:, :, 1);
red_channel(iresized_mask) = red(1);
love_small_nyc(:, :, 1) = red_channel;

green = [0, 255, 0];
green_channel = love_small_nyc(:, :, 2);
green_channel(iresized_mask) = green(1);
love_small_nyc(:, :, 2) = green_channel;

blue = [0, 0, 255];
blue_channel = love_small_nyc(:, :, 3);
blue_channel(iresized_mask) = blue(1);
love_small_nyc(:, :, 3) = blue_channel;


figure, imshow(love_small_nyc);