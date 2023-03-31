% demo4

x=0:0.05:10;
K=linspace(0,6,50);
% 基础绘图
ax=gca;hold on;
for k=1:length(K)
    y=besselj(K(k),x);
    plot(x,y,'LineWidth',2,'Color',slanCL(531,k))
end
% 坐标区域修饰
ax.FontName='Times New Roman';
ax.LineWidth=.8;
ax.XMinorTick='on';
ax.YMinorTick='on';
ax.FontSize=12;
ax.XGrid='on';
ax.YGrid='on';
ax.GridLineStyle='-.';