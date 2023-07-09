function out_img=getResult(imgl,imgc,smallest)

[mask1,mask2]=creatMask(imgl,imgc,smallest);

w1=bwdist(~mask1); 
imshow(w1,[]);
   
w2=bwdist(~mask2);
imshow(w2,[]);

[c,d]=size(mask2);
out_img=zeros(c,d,3);

[m,n]=reshapeOriImage(imgl,mask1,imgc,mask2,smallest);
out_img = blendImagePair(m, mask1, n, mask2, 'blend');


