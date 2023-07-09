function output_img = recognizeObjects(orig_img, labeled_img, obj_db)

%orig_img=gray(orig_img);
[db, out_img] = compute2DProperties(orig_img, labeled_img);

labelO=[];indexN=0;
for i=1:length(db(6,:))
    for j=1:length(obj_db(6,:))
        if( abs(obj_db(6,j)-db(6,i))<=0.01)
           % disp('1')
             indexN=indexN+1;
             labelO(indexN)=i;
           %disp(abs(obj_db(6,j)-db(6,i)))
        end
    end
end

Orientation=db(5,:);
xbar=db(2,:);
ybar=db(3,:);
imgOut = orig_img;
fh4 =figure,imshow(imgOut);
hold on;

for v=1:length(labelO)
    plot(xbar(labelO(v)),ybar(labelO(v)),'r.','MarkerSize',20)
    a=[xbar(labelO(v)),(xbar(labelO(v))+10)];
    b=[ybar(labelO(v)),ybar(labelO(v))+10*tan(Orientation(labelO(v)))];
    plot(a,b)
%plot(350,264,'r.','MarkerSize',20)
end 

output_img = saveAnnotatedImg(fh4);
  