% Move pivot for small colormap.
imagesc(peaks(1000) + 1)
CM = [.18 .07 .21; .28 .08 .39; .36 .20 .60; .37 .38 .70; .41 .53 .74;
     .53 .67 .77; .74 .79 .82; .88 .84 .88; .83 .75 .71; .79 .59 .48;
     .73 .41 .34; .64 .25 .31; .49 .13 .31; .31 .07 .26; .18 .07 .21];
colormap(CM); colorbar 

% Move the pivot(center of colormap) to 0.
setColormapPivot(0)

pause()
% Reset colormap, then move pivot to 6.
colormap(CM);
setColormapPivot(6)


pause()
% Reset colormap, then move pivot to 10.
colormap(CM);
setColormapPivot(10)