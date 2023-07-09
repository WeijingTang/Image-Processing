function hough_img = generateHoughAccumulator(img, theta_num_bins, rho_num_bins)

%img=mat2gray(img);
%img = im2bw(img, 0.5);
[row,col]=size(img);
AccMatrix=[rho_num_bins,theta_num_bins];
AccMatrix=zeros(AccMatrix);
deltaTheta=pi/theta_num_bins;
%go through the edge image, to every point(pixel) in the matrix%
%apply the position in the matrix of this point to the
%x*sin(theta)-y*cos(theta)+rho, then get the relationship 
%between theta and rho%
counter=0;
for i=1:row
        for j=1:col
                if( img(i,j)~=0 ) 
                    for k=1:theta_num_bins
                         rho= i*cos(k*deltaTheta)-j*sin(k*deltaTheta);
                         rho=round(rho);
                         normalRho=20-rho;
                         %add all the matrice together%
                         if(normalRho<rho_num_bins & normalRho>0)
                         AccMatrix(normalRho,k )=AccMatrix(normalRho,k )+1;
                         end
                    end              
                end
        end
end
%find the largest value for nomalization%
largest=0;
[a,b]=size(AccMatrix)
for i=1:a
        for j=1:b
            if(AccMatrix(i,j)>largest)
            largest=AccMatrix(i,j);
            end
        end
end
%nomalize the matrix to 0~255%
hough_img=round( 255*( AccMatrix/largest ) )

