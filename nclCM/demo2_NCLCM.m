%% demo2 : nclCM with the Mapping Toolbox : Visualizing EGM96 geoid data

% Need mapping toolbox (需要 mapping toolbox 工具箱)
load geoid60c.mat

% Create a world map coordinate region within a specified longitude and latitude range
% (创建某经纬度范围世界地图坐标区域)
latlim = [-50, 50];
lonlim = [160, -30];
ax = worldmap(latlim, lonlim);

geoshow(ax, geoid60c, geoid60cR, 'DisplayType','surface')
% try colormap Id : 205 190 215
colormap(nclCM(215, 20))
colorbar