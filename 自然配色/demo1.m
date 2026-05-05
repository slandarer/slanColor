% [R,G,B]=meshgrid(0:15:255,0:15:255,0:15:255);
% CList=[R(:),G(:),B(:)]./255;
% 
% hsvList=rgb2hsv(CList);
% [~,ind]=sortrows(hsvList,[3,2,1]);  
% NCList=CList(ind,:);
% 
% showCM(NCList)



% [R,G,B]=meshgrid(0:15:255,0:15:255,0:15:255);
% CList=[R(:),G(:),B(:)]./255;
% 
% Gy=rgb2gray(reshape(CList,[],1,3));
% [~,ind]=sortrows([CList,Gy],[4,2,3,1]);  
% NCList=CList(ind,:);
% 
% showCM(NCList)

[R,G,B]=meshgrid(0:15:255,0:15:255,0:15:255);
CList=[R(:),G(:),B(:)]./255;

NCList=NTraveler(CList);

showCM(NCList)