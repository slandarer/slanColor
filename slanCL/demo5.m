% demo5

X=rand(10);
ax=gca;hold on
CF=contourf(X);
% 修改配色
colormap(slanCL(1644))
colorbar 
% 坐标区域修饰
ax.FontName='Times New Roman';
ax.LineWidth=.8;
ax.XMinorTick='on';
ax.YMinorTick='on';
ax.FontSize=12;
ax.TickDir='out';