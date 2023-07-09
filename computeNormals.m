function [normals, albedo_img] = ...
    computeNormals(light_dirs, img_cell, mask)

I=zeros(5,1);
Is=zeros(3,1);
[a,b]=size(img_cell{1});
X=zeros(a,b);
Y=zeros(a,b);
Z=zeros(a,b);
normals=zeros(a,b,3);
    for i=1:a
        for j=1:b
            if(mask(i,j)~=0)
                for k=1:5 
                     A=img_cell{k};
                     I(k)=A(i,j);
                end
                [~,index]=sort(I,'descend');
                ind = find(I);
                tempI = I(index(1:3));
                tempI = I(ind);
                tempDir = light_dirs(index(1:3), :);
                tempDir = light_dirs(ind,:);
                %N(i,j,:)=inv(transpose(light_dirs)*light_dirs)*transpose(light_dirs)*I;
                tempNorm = double(tempDir) \ double(tempI);
                N(i,j,:) = tempNorm;
                X(i,j) = tempNorm(1);
                Y(i,j) = tempNorm(2);
                Z(i,j) = tempNorm(3);
                %normals(i,j,:)=[N(i,j,2),N(i,j,3),N(i,j,1)];%/albedo_img(i,j,:);
            else
                X(i,j) = 0;
                Y(i,j) = 0;
                Z(i,j) = 1;
            end
        end
    end
    
albedo_img=sqrt(X.^2+Y.^2+Z.^2);
albedo_img=albedo_img;

normals = cat(3,X,Y,Z);
surf_img = reconstructSurf(normals, mask);

% Use the surf tool to visualize the 3D reconstruction
figure, surf(im2double(imresize(surf_img, 0.3)));
 
% N=pinv(light_dirs)*I;
% albedo_img=norm(N);
% albedo_img=albedo_img/max(albedo_img(:));
% %normals=N/albedo_img;

