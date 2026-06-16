%% demo10 : Apply slanCM colormap to the image object (spine demo)
load spine
image(X, 'CDataMapping','scaled')

colormap(flipud(slanCM(20)))
