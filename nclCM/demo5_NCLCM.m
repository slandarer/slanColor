%% demo5 : Apply the nclCM colormap to line objects
t = linspace(0,5*pi,200);

% try colormap Id : 116 190 402 162 
C = nclCM(116, 70);
ax = gca; hold(ax, 'on') 
for i = 1:70
    plot(t, sin(t + i.^2./700)./(10 + i).*20 + i.*.1, 'Color',C(i, :), 'LineWidth',2);
end

% Decorate the axes
ax.YLim = [0,7];
ax.XLim = [0,5*pi];
ax.YTick = 0:.5:5;
ax.XTick = 0:1:15;
ax.YGrid = 'on';
ax.GridLineStyle = '-.';
ax.LineWidth = 1.2;
ax.XMinorTick = 'on';
ax.YMinorTick = 'on';
ax.Box = 'on';
ax.FontName = 'Cambria';
ax.FontWeight = 'bold';
ax.FontSize=12;

