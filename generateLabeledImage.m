function labeled_img = generateLabeledImage(gray_img, threshold)

Threshold = threshold;
%fh1 = figure();
img = gray_img;
binary_img = im2bw(img, Threshold);
labeled_img=bwlabel(binary_img);

end







