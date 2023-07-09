function [mask1,mask2]=creatMask(imgl,imgc,smallest)

W1=size(imgl);
W2=size(imgc);
width=W1(2)+W2(2)-(W1(2)-smallest);
height=W1(1);

mask1=zeros(round(height),round(width));

for i=1:height
    for j=1:width
        if(j<smallest)
            mask1(i,j)=1;
        end
    end
end

mask2=zeros(round(height),round(width));

for i=1:height
    for j=1:width
        if(j>W2(2)-smallest)
            mask2(i,j)=1;
        end
    end
end

