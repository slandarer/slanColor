% demo2
% 需要mapping toolbox
% Need mapping toolbox
% 大地水准面高度数导入
load geoid60c.mat

% 创建某经纬度范围世界地图坐标区域
% Create a world map coordinate region within a specified longitude and latitude range
latlim=[-50 50];
lonlim=[160 -30];
ax=worldmap(latlim,lonlim);


geoshow(ax,geoid60c,geoid60cR,'DisplayType','surface')
% 205 190 215
colormap(nclCM(215,20))
% colormap(nclCM(335,100))
colorbar