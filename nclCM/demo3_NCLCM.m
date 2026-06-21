%% demo3 : nclCM with the Mapping Toolbox : Visualizing EGM96 geoid data on an Eckert IV projection

% Need mapping toolbox (需要 mapping toolbox 工具箱)
[N,R] = egm96geoid;
axesm eckert4

Z = zeros(R.RasterSize);
geoshow(N, R, 'DisplayType','surface', 'CData',N + 50, 'ZData',Z)
framem; gridm

% try colormap Id : 215 190 150
colormap(nclCM(150, 20))
cb = colorbar('southoutside');
cb.Label.String = 'EGM96 Geoid Height in Meters';
geoshow('landareas.shp', 'FaceColor',[.5,.5,.5])

