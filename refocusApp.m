function refocusApp(rgb_stack, depth_map)

index=1;
A=size(rgb_stack);
num = (index-1)*3+1:(index-1)*3+3;
imshow(rgb_stack(:,:,num));
[x,y] = ginput(1);
x = int32(x);y = int32(y);
while x>0 && y>0 && x<=A(2) && y <=A(1)
    index = depth_map(y,x);
    num = (index-1)*3+1:(index-1)*3+3;
    imshow(rgb_stack(:,:,num));
    [x,y] = ginput(1);
    x = int32(x);y = int32(y);
end

    
    
