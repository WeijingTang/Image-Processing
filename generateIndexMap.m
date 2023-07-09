function index_map = generateIndexMap(gray_stack, w_size)

gray_stack=double(gray_stack);
n=size(gray_stack);
nrow=n(1);
ncol=n(2);
initial_map=zeros(nrow-2*w_size,ncol-2*w_size,25);

for num=1:25
    img=gray_stack(:,:,num);
    for i=w_size:nrow-w_size
        for j=w_size:ncol-w_size  %go through all the points in img
            windowMeasure=0;
            
            for k=i-w_size+2:i+w_size-1
                for l=j-w_size+2:j+w_size-1
                    
                    y=img(k-1,l)-2*img(k,l)+img(k+1,l);
                    x=img(k,l-1)-2*img(k,l)+img(k,l+1);
                    measure=abs(x)+abs(y); 
                    windowMeasure=windowMeasure+measure;
                end
            end
           
            initial_map(i,j,num)=windowMeasure;
            %smooth the data
        end
    end
end


%disp('p');
index_map=zeros(nrow-2*w_size,ncol-2*w_size);
%index_map=ones(nrow,ncol);

for i=1:nrow-2*w_size
    for j=1:ncol-2*w_size
        largest=0;
        for k=2:25   
            if(initial_map(i,j,k)>largest)
              index_map(i,j)=k; 
              largest = initial_map(i,j,k);
            end
        end
    end
end


index_map=padarray(index_map,[w_size,w_size]);
