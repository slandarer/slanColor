%% demo11 : Apply slanCM colormap to the contourf (Filled 2-D contour plot) object
contourf(peaks, 30)
colorbar

colormap(slanCM('romao'))  % Use romao colormap 

colormap(slanCM(134))      % Use romao(No. 134) colormap 

colormap(slanCM(134, 20))  % Use romao colormap with 20 colors