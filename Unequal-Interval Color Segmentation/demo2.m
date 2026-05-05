contourf(rand(10,10))
colormap([pink(11);flipud(bone(11))])
cb=colorbar;

setCMapRatio([8/22,10/22,20/22],[.2,.5,.8])

% 添加非等距离标签
cb.YTick=getCBTick(gca);
% 调节colorbar刻度长度(这句代码可删掉)
cb.TickLength=.04;
