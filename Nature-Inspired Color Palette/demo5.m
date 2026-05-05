oriPic=imread('gallery\12.jpg');        
colorNum=8;

% 获取配色
RGBList=double(reshape(oriPic,prod(size(oriPic,[1,2])),3));
[~,C]=rgb2ind(oriPic,colorNum);
C=NTraveler(C); 
% 插值
CM=interpColor(C,256);

fig=gcf;
fig.Position=[200,200,800,600];
% 原图像
ax1=axes('Parent',fig,'Position',[0,1/2,1/2,1/2]+[1/20,1/20,-1/15,-1/15]);
ax1.NextPlot='add';axis tight
ax1.FontName='Cambria';
ax1.XColor='none';
ax1.YColor='none';
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
image(flipud(oriPic))
% 气泡图
ax2=axes('Parent',fig,'Position',[1/2,1/2,1/2,1/2]+[1/20,1/20,-1/15,-1/15]);
ax2.NextPlot='add';grid on
ax2.GridLineStyle=':';
ax2.XMinorTick='on';
ax2.YMinorTick='on';
ax2.FontName='Cambria';
ax2.LineWidth=.7;
x=1:30;
[~,ind]=sort(rand(1,30));
x=x(ind);
y=rand(1,30);
sz=sort(rand(1,30));
bubblechart(x,y,sz,'CData',1:30);
colormap(ax2,CM)
% 折线图
ax3=axes('Parent',fig,'Position',[0,0,1/2,1/2]+[1/20,1/20,-1/15,-1/15]);
ax3.NextPlot='add';
t=linspace(0,5*pi,200);
C70=interpColor(C,70);
for i=1:70
    plot(t,sin(t+i.^2./700)./(10+i).*20+i.*.1,'Color',C70(i,:),'LineWidth',2);
end
% 坐标区域修饰
ax3.YLim=[0,7];
ax3.XLim=[0,5*pi];
ax3.YTick=0:.5:5;
ax3.XTick=0:1:15;
ax3.YGrid='on';
ax3.GridLineStyle='-.';
ax3.LineWidth=1;
ax3.XMinorTick='on';
ax3.YMinorTick='on';
ax3.Box='on';
ax3.FontName='Cambria';
ax3.FontSize=11;
% 曲面图
ax4=axes('Parent',fig,'Position',[1/2+1/50,0,1/2,1/2]);
ax4.NextPlot='add';grid on
ax4.Projection='perspective';
ax4.LineWidth=.8;
ax4.XMinorTick='on';
ax4.YMinorTick='on';
ax4.ZMinorTick='on';
ax4.GridLineStyle=':';
ax4.ZLim=[0,90];
ax4.FontName='Cambria';
view(-37,42) 
X=linspace(0,1,100)';
CL=(-cos(X*2*pi)+1).^.2;
r=(X-.5)'.^2+(X-.5).^2;
Z=abs(ifftn(exp(7i*rand(100))./r.^.9)).*(CL*CL')*30;
surf(X,X.',Z,'EdgeColor',[.9,.9,.9],'EdgeAlpha',.1)
colormap(ax4,CM);