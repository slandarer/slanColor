oriPic=imread('gallery\6.jpg');    
colorNum=8;                
RGBList=double(reshape(oriPic,prod(size(oriPic,[1,2])),3));
[~,C]=rgb2ind(oriPic,colorNum);
C=NTraveler(C); 
disp(C)

[M,N,~]=size(oriPic);
if N>M
    for i=1:colorNum
        oriPic(M+1:M+round(M/6),1+(round((N-1)*(i-1)/colorNum):round((N-1)*i/colorNum)),1)=C(i,1).*255;
        oriPic(M+1:M+round(M/6),1+(round((N-1)*(i-1)/colorNum):round((N-1)*i/colorNum)),2)=C(i,2).*255;
        oriPic(M+1:M+round(M/6),1+(round((N-1)*(i-1)/colorNum):round((N-1)*i/colorNum)),3)=C(i,3).*255;
    end
else
    for i=1:colorNum
        oriPic(1+(round((M-1)*(i-1)/colorNum):round((M-1)*i/colorNum)),N+1:N+round(N/6),1)=C(i,1).*255;
        oriPic(1+(round((M-1)*(i-1)/colorNum):round((M-1)*i/colorNum)),N+1:N+round(N/6),2)=C(i,2).*255;
        oriPic(1+(round((M-1)*(i-1)/colorNum):round((M-1)*i/colorNum)),N+1:N+round(N/6),3)=C(i,3).*255;
    end
end
imshow(oriPic)