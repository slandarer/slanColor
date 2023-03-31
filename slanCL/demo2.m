% demo2

% 随机生成数据
X=.3+rand(1,23);
% 基础绘图
ax=gca;hold on;axis tight
bHdl=bar(X);
bHdl.FaceColor='flat';
bHdl.LineWidth=.8;
% 修改配色
CList=slanCL(786,1:23);
for i=1:size(CList,1)
    bHdl.CData(i,:)=CList(i,:);
end
% 坐标区域修饰
ax.DataAspectRatio=[12,1,1];
ax.FontName='Times New Roman';
ax.LineWidth=.9;
ax.FontSize=13;
ax.YGrid='on';
ax.GridLineStyle='-.';
ax.XTick=1:23;

