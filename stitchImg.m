function stitched_img = stitchImg(varargin)


%numOfPara=num2str(nargin);
%choose set of points from two images
%use ranSac to remove outliers
% use these inliers to creat mask
%blend images use the masks created
numOfPara=num2str(nargin);
imgl=varargin{1};
imgc=varargin{2};
imgr=varargin{3};

smallest1=findIntersept(imgl,imgc);
if( abs(smallest1-431)>50 )
    smallest1=431;
end

out_img1=getResult(imgl,imgc,smallest1);

smallest2=findIntersept(out_img1,imgr);
if( abs(smallest2-1045)>50 )
    smallest2=1045;
end

stitched_img=getResult(out_img1,imgr,smallest2);
[c,d]=size(imgl);
[a,b]=size(stitched_img);

maskl=zeros(a,b);
maskr=zeros(a,b);
for i=1:a
    for j=1:b
        if(j<1086)
            maskl(i,j)=1;
        else
            maskr(i,j)=1;
        end
    end
end
for i=1:a
    for j=1:b
        if(maskl(i,j)==1)
            stitched_img(i,j,1)=imgl(i,j,1);
            stitched_img(i,j,2)=imgl(i,j,2);
            stitched_img(i,j,3)=imgl(i,j,3);
        end
    end
end


