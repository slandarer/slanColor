% Move pivot for large colormap.
imagesc(peaks(1000) + 1)
colormap([pink;flipud(bone)]); colorbar 

% Move the pivot(center of colormap) to 6.
setColormapPivot(6)
