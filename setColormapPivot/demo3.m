% Some sample data with noise:
x = 10*rand(300, 1) - 5;
noise = 2*randn(size(x));
y = x.^2 + noise;

% A theoretical perfect x^2 line:
x_theoretical = linspace(min(x), max(x), 50);
y_theoretical = x_theoretical.^2;

% Plot the data:
figure; hold on
plot(x_theoretical, y_theoretical, 'k-')
scatter(x,y, 25, noise, 'filled')

CM = [.09 .10 .26; .04 .37 .74; .45 .66 .74; .94 .92 .92;
      .81 .54 .45; .65 .13 .14; .23 .03 .07];

CX1 = linspace(0, 1, size(CM,1));
CX2 = linspace(0, 1, 256)';
CM = interp1(CX1, CM, CX2, 'pchip');
colormap(CM); cbHdl = colorbar;
ylabel(cbHdl, 'error relative to theory')
box off; axis tight; grid on

% Move the pivot(center of colormap) to 0.
setColormapPivot(0)