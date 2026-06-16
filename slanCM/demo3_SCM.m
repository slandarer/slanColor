%% demo3 : Apply slanCM colormap to image

rgbImage = imread("peppers.png");
imagesc(rgb2gray(rgbImage))

colormap(slanCM('prism2')) 