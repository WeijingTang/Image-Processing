function out_img = blendImagePair(wrapped_imgs, masks, wrapped_imgd, maskd, mode)


if(strcmp(mode,'blend')==1)
    
   w1=bwdist(~masks); 
   imshow(w1);
   
   w2=bwdist(~maskd);
   imshow(w2);
   [c,d]=size(maskd);
   out_img=zeros(c,d,3);
   %out_img=( w1.*wrapped_imgs+w2.*wrapped_imgd )/(w1+w2);
   %out_img=( times(w1,im2double(wrapped_imgs))+times(w2,im2double(wrapped_imgd)) )./(w1+w2); 
   for i=1:c
       for j=1:d
           if((w1(i,j)+w2(i,j)==0))
              out_img(i,j,1)=0;
              out_img(i,j,2)=0;
              out_img(i,j,3)=0;
           else
              out_img(i,j,1)=( w1(i,j)*im2double(wrapped_imgs(i,j,1))+w2(i,j)*im2double(wrapped_imgd(i,j,1)) )/(w1(i,j)+w2(i,j));
              out_img(i,j,2)=( w1(i,j)*im2double(wrapped_imgs(i,j,2))+w2(i,j)*im2double(wrapped_imgd(i,j,2)) )/(w1(i,j)+w2(i,j));
              out_img(i,j,3)=( w1(i,j)*im2double(wrapped_imgs(i,j,3))+w2(i,j)*im2double(wrapped_imgd(i,j,3)) )/(w1(i,j)+w2(i,j));
           end
       end
   end
end
 
if(strcmp(mode,'overlay')==1)
    
 
   
    [c,d]=size(maskd);
    for i=1:c
        for j=1:d
            if(maskd(i,j)~=0)
                masks(i,j)=wrapped_imgd(i,j);
            else
                masks(i,j)=wrapped_imgs(i,j);
            end
        end
    end

 out_img=masks;

end
   

 