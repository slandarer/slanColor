%% demo4 : nclCM with the Mapping Toolbox : Visualizing DEM data from a GeoTIFF

% Need mapping toolbox (需要 mapping toolbox 工具箱)
[Z, R] = readgeoraster('n39_w106_3arc_v2.dt1', 'OutputType','double');

key.GTModelTypeGeoKey    = 2;
key.GTRasterTypeGeoKey   = 2;
key.GeographicTypeGeoKey = 4326;

filename = 'southboulder.tif';
geotiffwrite(filename, Z, R, 'GeoKeyDirectoryTag',key)

usamap([39, 40], [-106, -105])
g=geoshow(filename, 'DisplayType','mesh');

% try colormap Id : 190 300 363
colormap(nclCM(300,80))
colorbar

