function trackingTester(data_params, tracking_params)

if(~isequal(exist([data_params.out_dir],'dir'),7))
    mkdir([data_params.out_dir])
end

w=6;
number=tracking_params.bin_n;
box=tracking_params.rect;
bw=box(3);
bh=box(4);
bin_edges=0:number-1;
img=imread([data_params.data_dir,'/',data_params.genFname(data_params.frame_ids(1))]);
boximg=drawBox(img,box,[0 0 255],1);
imwrite(boximg,[data_params.out_dir,'/',data_params.genFname(data_params.frame_ids(1))])
[index,MAP]=rgb2ind(img,number);
index=index(box(2):box(2)+box(4)-1,box(1):box(1)+box(3)-1);
q=histc(index(:),bin_edges);

for i=2:size(data_params.frame_ids(:))
    img=imread([data_params.data_dir,'/',data_params.genFname(data_params.frame_ids(i))]);
    index=rgb2ind(img,MAP);
    Col=im2col(index(box(2)-w:box(2)+bh+w,box(1)-w:box(1)+bw+w),[bh bw],'sliding');
    histCols=histc(Col,bin_edges);
    value=arrayfun(@(ir) metric(histCols(:,ir),q),1:size(histCols,2));
    [~,idx]=max(value);
    [dy dx]=ind2sub([2*w+1,2*w+1],idx);
    dx=dx-w-1;
    dy=dy-w-1;
    box=[box(1)+dx,box(2)+dy,bw,bh];
    boximg=drawBox(img,box,[0 0 255],1);
    imwrite(boximg,[data_params.out_dir,'/',data_params.genFname(data_params.frame_ids(i))]);
end

end

function result=metric(p,q)
    result=sum(sqrt(p.*q));
end

