function smallest=findIntersept(imgl,imgc)

[xs, xd] = genSIFTMatches(imgl, imgc);

ransac_n = 50000; % Max number of iteractions
ransac_eps = 10; %Acceptable alignment error 

[inliers_id, H_3x3] = runRANSAC(xs, xd, ransac_n, ransac_eps);
after_img = showCorrespondence(imgl, imgc, xs(inliers_id, :), xd(inliers_id, :));

smallest=2000;
for i=1:length(inliers_id)
    A=xs(inliers_id(i));
    if(A(1)<smallest)
        smallest=A(1);
    end
end
