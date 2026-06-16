%% demo2 : Apply slanCM colormap (with numeric ID input) to the heatmap (imagesc) object
XData = rand(15, 15);
XData = XData + XData.';
H = fspecial('average',3);
XData = imfilter(XData, H, 'replicate');

imagesc(XData)
% Use colormap No. 100 from slanCM (使用 slanCM 的 100 号配色)
colormap(slanCM(100))
hold on

ax = gca;
ax.DataAspectRatio = [1,1,1];
% ax.LineWidth=1.2;
% ax.XMinorTick='on';
% ax.YMinorTick='on';
% ax.ZMinorTick='on';
% ax.GridLineStyle=':';