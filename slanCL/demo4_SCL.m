%% demo4 : Apply slanCL palette to line plot


x = 0:0.05:10;
K = linspace(0, 6, 50);

ax = gca; hold(ax, 'on');

for k = 1:length(K)
    y = besselj(K(k), x);
    plot(x, y, 'LineWidth', 2, 'Color', slanCL(531, k));
end

% Decorate axes (坐标区域修饰)
ax.FontName = 'Times New Roman';
ax.LineWidth = .8;
ax.XMinorTick = 'on';
ax.YMinorTick = 'on';
ax.FontSize = 12;
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.GridLineStyle = '-.';