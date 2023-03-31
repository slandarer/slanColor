% demo2

x=1:30;
[~,ind]=sort(rand(1,30));
x=x(ind);
y=rand(1,30);
sz=sort(rand(1,30));

bubblechart(x,y,sz,'CData',PYCM().BrBG(30));

% 坐标区域修饰
ax=gca;hold on;grid on
ax.LineWidth=.8;
ax.GridLineStyle='-.';
ax.GridAlpha=.08;
ax.XMinorTick='on';
ax.YMinorTick='on';
ax.ZMinorTick='on';
ax.FontName='Cambria';
ax.FontSize=12;