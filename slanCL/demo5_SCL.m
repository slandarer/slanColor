%% demo5 : Use slanCL palette as colormap (将slanCL调色板用作颜色映射)

% Generate random data (生成随机数据)
X = rand(10); 

ax = gca;hold(ax, 'on');
contourf(X);

% Apply slanCL palette as colormap (将slanCL调色板用作颜色映射)
colormap(slanCL(1644));
colorbar;

% Decorate axes (坐标区域修饰)
ax.FontName = 'Times New Roman';
ax.LineWidth = .8;
ax.XMinorTick = 'on';
ax.YMinorTick = 'on';
ax.FontSize = 12;
ax.TickDir = 'out';