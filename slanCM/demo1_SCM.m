%% demo1 : Apply slanCM colormap (with string name input) to the surf object
surf(peaks, 'EdgeColor','w', 'EdgeAlpha',.3)

% Use rainbow colormap (使用 slanCM 的彩虹配色)
colormap(slanCM('rainbow'))

% Decorate the axes
ax=gca;
ax.Projection='perspective';
ax.LineWidth=1.2;
ax.XMinorTick='on';
ax.YMinorTick='on';
ax.ZMinorTick='on';
ax.GridLineStyle=':';
view(-37,42) 