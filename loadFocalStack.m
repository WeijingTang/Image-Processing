function [rgb_stack, gray_stack] = loadFocalStack(focal_stack_dir)
     names = dir([focal_stack_dir '/*.jpg']);
	 imgOri = imread([focal_stack_dir '/' names(1).name]);
	 rgb_stack = imgOri;
	 gray_stack = rgb2gray(imgOri);
	 for i = 2:length(names)
	 	 img = imread([focal_stack_dir '/' names(i).name]);
		 rgb_stack = cat(3,rgb_stack,img);
		 gray_stack = cat(3,gray_stack,rgb2gray(img));
	 end
 end