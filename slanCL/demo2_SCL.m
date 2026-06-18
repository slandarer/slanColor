%% demo2 : Apply slanCL palette to bar chart

% Generate random data (随机生成数据)
X = .3 + rand(1, 23);

% Basic plotting (基础绘图)
ax = gca; hold(ax, 'on'); axis(ax, 'tight');
bHdl = bar(X);           % Create bar chart (创建条形图)
bHdl.FaceColor = 'flat'; % Enable per-bar color assignment (启用每个条形单独着色)
bHdl.LineWidth = .8;

% Modify colors using slanCL (使用slanCL修改配色)
CList = slanCL(786, 1:23);
for i = 1:size(CList, 1)
    bHdl.CData(i, :) = CList(i, :);
end

% Decorate axes (坐标区域修饰)
ax.DataAspectRatio = [12, 1, 1];
ax.FontName = 'Times New Roman';
ax.LineWidth = .9;
ax.FontSize = 13;
ax.YGrid = 'on';
ax.GridLineStyle = '-.';
ax.XTick = 1:23;

