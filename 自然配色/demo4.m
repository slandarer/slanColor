oriPic=imread('gallery\5.jpg');        
colorNum=8;

% 获取配色
RGBList=double(reshape(oriPic,prod(size(oriPic,[1,2])),3));
[~,C]=rgb2ind(oriPic,colorNum);
C=NTraveler(C); 
showCM(C)
% 插值
CM=interpColor(C,256);
showCM(CM)