% demo3

% 随机生成数据
X=1.5+rand(4,4);
% 基础绘图
ax=gca;hold on;
bHdl=bar(X,'LineWidth',.8);
% 修改配色
CList=slanCL(1514,1:4);
bHdl(1).FaceColor=CList(1,:);
bHdl(2).FaceColor=CList(2,:);
bHdl(3).FaceColor=CList(3,:);
bHdl(4).FaceColor=CList(4,:);
% 坐标区域修饰
ax.FontName='Times New Roman';
ax.LineWidth=.8;
ax.FontSize=12;
ax.YGrid='on';
ax.GridLineStyle='-.';
ax.XTick=1:23;
