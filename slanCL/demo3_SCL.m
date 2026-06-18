%% demo3 : Apply slanCL palette to grouped bar chart

% Generate random data (随机生成数据)
X = 1.5 + rand(4, 4);

% Basic plotting (基础绘图)
ax = gca; hold(ax, 'on');
bHdl = bar(X, 'LineWidth', .8);

% Modify colors using slanCL (使用slanCL修改配色)
CList = slanCL(1514, 1:4); 
% Assign each group a distinct color (为每组分配不同颜色)
bHdl(1).FaceColor = CList(1, :);
bHdl(2).FaceColor = CList(2, :);
bHdl(3).FaceColor = CList(3, :);
bHdl(4).FaceColor = CList(4, :);

% Decorate axes (坐标区域修饰)
ax.FontName = 'Times New Roman';
ax.LineWidth = .8;
ax.FontSize = 12;
ax.YGrid = 'on';
ax.GridLineStyle = '-.';
ax.XTick = 1:4;         