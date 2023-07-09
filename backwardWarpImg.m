function [mask, result_img] = backwardWarpImg(src_img, resultToSrc_H,dest_canvas_width_height)

%rgb = [0.83 0.82 0.78];
result_img=zeros(dest_canvas_width_height(2),dest_canvas_width_height(1),3);

% for i = 1:3
%     result_img(:,:,i) = rgb(i);
% end
mask=zeros(dest_canvas_width_height(2),dest_canvas_width_height(1));

%for i=1:dest_canvas_width_height(2)
%    for j=1:dest_canvas_width_height(1)
%        mask(i,j,1)=0;
%        mask(i,j,2)=0;
%        mask(i,j,3)=0;
%    end
%end

A=size(src_img);
for i=1:dest_canvas_width_height(2)
    for j=1:dest_canvas_width_height(1)
       
        D=[j;i;1]; 
        
        S=resultToSrc_H*D;
       
        S=S/S(3);
        %disp(S(1));disp(A(2));
        if(S(1)>=1 && S(1)<A(2) && S(2)>=1 && S(2)<A(1))
              
            mask(i,j)=1; 
          %  mask(i,j,2)=1;
          %  mask(i,j,3)=1;
            result_img(i,j,1)=src_img( round(S(2)),round(S(1)),1 );  
            result_img(i,j,2)=src_img( round(S(2)),round(S(1)),2 );  
            result_img(i,j,3)=src_img( round(S(2)),round(S(1)),3 );  
        end
    end
end


        