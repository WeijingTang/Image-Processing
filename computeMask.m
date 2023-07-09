function mask = computeMask(img_cell)

[a,b]=size(img_cell{1});
mask=zeros(a,b);
%{
for i = 1:5
    mask = mask | (img_cell{i} > 0);
end
%}
    for i=1:a
        for j=1:b
            counter=0;
           for k=1:length(img_cell)
               A=img_cell{k};
           
               if(A(i,j)~=0)
                   
                   counter=counter+1;
               end
           end
           if(counter~=0)
               mask(i,j)=1;
           else
               mask(i,j)=0;
           end
        end
    end

for i = 1:5
    mask = mask | (img_cell{i} > 0);
end
    