%% demo7 : Apply the slanCM colormap (with number of colors as argin) to the bar chart
X = randi([2, 15], [1, 25]) + rand([1, 25]);
b = bar(X);

b.FaceColor = 'flat';
% try colormap Id : 42 56 63 100 133 187 188
b.CData = slanCM(188, length(b.XData));

% Decorate the axes
ax = gca; 
hold(ax, 'on')
grid(ax, 'on')
axis(ax, 'tight')
ax.DataAspectRatio = [1,1,1];
ax.LineWidth = 1.2;
ax.XMinorTick = 'on';
ax.YMinorTick = 'on';
ax.ZMinorTick = 'on';
ax.GridLineStyle = ':';


