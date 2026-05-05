oriPic=imread('gallery\12.jpg');    
colorNum=8;

RGBList=double(reshape(oriPic,prod(size(oriPic,[1,2])),3));
[~,C]=rgb2ind(oriPic,colorNum);
% 降维法
C0=C-mean(C); 
covMat=cov(C0);
[V,~]=eigs(covMat,1); 
[~,ind]=sort(C0*V);
C=C(ind,:);
showCM(C)

% 旅行商法
C=NTraveler(C); 
showCM(C)