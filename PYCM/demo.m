% 图片展示列表
PYCM().show()

% 文字展示列表
PYCM().colormaps()

% 颜色渲染实例
figure()
[X,Y,Z]=peaks(25);
surf(X,Y,Z)

colormap(PYCM().pink())
colorbar

% colormap(PYCM().viridis(5))
% colorbar 