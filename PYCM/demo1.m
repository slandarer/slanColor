% demo1

Data=rand(20,15);
Data(end+1,:)=nan;
Data(:,end+1)=nan;
[X,Y]=meshgrid(.5:15.5,.5:20.5);

% 基础绘图
hold on;axis tight;box off
surf(X,Y,Data,'EdgeColor',[1,1,1],'LineWidth',.8);
% 修改配色
colormap(PYCM().GnBu())
colorbar
% 坐标区域修饰
ax=gca;
ax.LineWidth=.8;
ax.FontName='Cambria';
ax.FontSize=12;
ax.DataAspectRatio=[1,1,1];
ax.XTick=1:15;
ax.YTick=1:20;
ax.TickDir='out';