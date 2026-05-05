
oriPic=imread('gallery\4.jpg');
colorNum=9;

% kmeans聚类
RGBList=double(reshape(oriPic,prod(size(oriPic,[1,2])),3));
[index,C]=kmeans(RGBList,colorNum,'Distance','sqeuclidean','MaxIter',1000,'Display','iter');

showCluster(RGBList,index,C)
showCM(C./255)

figure()
% rgb2ind聚类
RGBList=double(reshape(oriPic,prod(size(oriPic,[1,2])),3));
[index,C]=rgb2ind(oriPic,colorNum);
index=index(:)+1;C=C.*255;

showCluster(RGBList,index,C)
showCM(C./255)