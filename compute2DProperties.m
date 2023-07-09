function [db, out_img] = compute2DProperties(gray_img, labeled_img)


AllLabel=[];
index=0;
[r,c]=size(labeled_img)
for i=1:r
    for j=1:c
       if  (labeled_img(i,j)~=0) & (~ismember(labeled_img(i,j),AllLabel))
           index=index+1;
           AllLabel(index)=labeled_img(i,j)
       end
    end
end

area=[];
xbar=[];
ybar=[];
A=[];
B=[];
C=[];
mininumM=[];
Orientation=[];
roundness=[];


for k=1:length(AllLabel)
    count=0;
    sumx=0;
    sumy=0;
    for i=1:r
        for j=1:c
           if ( labeled_img(i,j)==AllLabel(k) )
              count=count+1;
              sumx=sumx+j;sumy=sumy+i;
           end
        end
    end
   area(k)=count;
   xbar(k)=sumx/count;
   ybar(k)=sumy/count;
end

for k=1:length(AllLabel)
    getA=0;getB=0;getC=0
    for i=1:r
        for j=1:c
           if ( labeled_img(i,j)==AllLabel(k) )
            getA=getA+(j-xbar(k))*(j-xbar(k));getB=getB+(i-ybar(k))*(j-xbar(k));getC=getC+(i-ybar(k))*(i-ybar(k));
           end
         end
     end
  getB=2*getB;A(k)=getA;B(k)=getB;C(k)=getC;
  %mininumM(k)= (getA+getC)/2 - sqrt( (getA-getC)*(getA-getC)+getB*getB )/2
  Orientation(k)=atan2(getB, (getA-getC) )/2
  
  %if(Orientation(k)<0)
 %     Orientation(k)=pi/2+Orientation(k);
      %Orientation(k)=abs(Orientation(k));
%  end
 % if(Orientation(k)<0)
 %     Orientation(k)=abs(Orientation(k))
 % end  
  mininumM(k)= getA*sin(Orientation(k))*sin(Orientation(k))-getB*sin(Orientation(k))*cos(Orientation(k))+getC*cos(Orientation(k))*cos(Orientation(k));
  roundness(k)=( getA*sin(Orientation(k))*sin(Orientation(k))-getB*sin(Orientation(k))*cos(Orientation(k))+getC*cos(Orientation(k))*cos(Orientation(k)) ) / ( getA*sin(Orientation(k)+pi/2)*sin(Orientation(k)+pi/2)-getB*sin(Orientation(k)+pi/2)*cos(Orientation(k)+pi/2)+getC*cos(Orientation(k)+pi/2)*cos(Orientation(k)+pi/2) )

end


db =[AllLabel;xbar;ybar;mininumM;Orientation;roundness]

imgOut = gray_img;
fh3 = figure, imshow(imgOut);
hold on;

for i=1:length(AllLabel) 
    plot(xbar(i),ybar(i),'r.','MarkerSize',20)
    a=[xbar(i),(xbar(i)+10)];
    b=[ybar(i),ybar(i)+10*tan(Orientation(i))];
    plot(a,b)
  
end

out_img = saveAnnotatedImg(fh3);

%saveas(imgOut,out_img);


