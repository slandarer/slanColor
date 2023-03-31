
Data=randi([20,35],[4,3]);
err=rand([4,3]).*5;

hold on
barHdl=bar(Data,'BarWidth',1);
C=PYCM().Set2(8);

for i=1:3
    % 修改柱状图颜色透明度
    barHdl(i).FaceColor=C(i,:);
    barHdl(i).FaceAlpha=.7;
    % 绘制并修饰误差棒
    errorbar(barHdl(i).XEndPoints,Data(:,i),err(:,i),'LineStyle','none','Color','k','LineWidth',.8)
end
% 坐标区域修饰，修改X轴标签
ax=gca;
ax.YLim=[0,40];
ax.LineWidth=.8;
ax.TickLength=[.008,.001];
ax.Box='on';
ax.XTick=1:5;
ax.XTickLabel={'A','B','C','D','E'};
ax.FontName='Times New Roman';
ax.FontSize=12;
% 绘制图例
legend(barHdl,{'AAAAA','BBBBB','CCCCC'},'FontSize',12);