% 图片展示列表
PYCM().show()

% 文字展示列表
PYCM().colormaps()

% 颜色渲染实例
figure()
[X,Y,Z]=peaks(45);
surf(X,Y,Z,'EdgeColor',[.7,.7,.7],'EdgeAlpha',.2)
axis tight
ax=gca;
ax.Projection='perspective';
ax.LineWidth=1;
ax.GridLineStyle='-.';
ax.GridAlpha=.08;
ax.XMinorTick='on';
ax.YMinorTick='on';
ax.ZMinorTick='on';
ax.FontName='Cambria';
ax.FontSize=12;

colormap(PYCM().rainbow())
colorbar

colormap(PYCM().magma(10))
colorbar 