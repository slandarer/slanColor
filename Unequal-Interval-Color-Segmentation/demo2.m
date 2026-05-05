contourf(rand(10,10))
colormap([pink(11);flipud(bone(11))])
cb=colorbar;

setCMapRatio([8/22,10/22,20/22],[.2,.5,.8])

% Add non-equidistant / unequal-interval tick labels
cb.YTick = getCBTick(gca);
% Adjust colorbar tick length (this line can be deleted)
cb.TickLength = 0.061;