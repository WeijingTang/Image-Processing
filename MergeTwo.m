function out_img=MergeTwo(imgl,imgc)

smallest=findIntersept(imgl,imgc);
if( abs(smallest-390)>50 )
    smallest=390;
end
out_img=getResult(imgl,imgc,smallest)

