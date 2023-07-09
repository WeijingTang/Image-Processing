function [m,n]=reshapeImage(imgl,imgc,mask2,smallest)
[c,d]=size(mask2);
add=zeros(c,round(smallest),3);
m=imgl;n=imgc;
m=cat(2,m,add);
n=cat(2,add,n);