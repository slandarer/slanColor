function showNTraveler
CList=rand([8,2]).*10;
ax=gca;hold on;box on;grid on
ax.XLim=[-.5,10.5];
ax.YLim=[-.5,10.5];
ax.LineWidth=.8;
ax.XMinorTick='on';
ax.YMinorTick='on';
ax.GridLineStyle=':';

scatter(CList(:,1),CList(:,2),160,'filled','s','CData',[0,0,.8])
N=size(CList,1);
NCList=zeros(N,2);
ind=find(sum(CList,2)==min(sum(CList,2)),1);
NCList(1,:)=CList(ind,:);
CList(ind,:)=[];
exportgraphics(gca,'text.gif','Append',true)
for i=2:N
    lastColor=NCList(i-1,:);
    for j=1:size(CList,1)
        P=plot([CList(j,1),lastColor(1)],[CList(j,2),lastColor(2)],'s-',...
            'MarkerEdgeColor',[.8,.2,.2],'Color',[.8,.2,.2],'MarkerSize',12,'LineWidth',2,'Tag','redLine');
        uistack(P,'bottom');
        pause(.2)
        drawnow
        exportgraphics(gca,'text.gif','Append',true)
    end
    delete(findobj('Tag','redLine'))
    normList=vecnorm((lastColor-CList)');
    ind=find(normList==min(normList),1);
    NCList(i,:)=CList(ind,:);
    P=plot([CList(ind,1),lastColor(1)],[CList(ind,2),lastColor(2)],'s-',...
            'MarkerEdgeColor',[.2,.8,.2],'Color',[.2,.8,.2],'MarkerSize',12,'LineWidth',2);
    uistack(P,'bottom');
    CList(ind,:)=[];
    pause(.2)
    drawnow
    exportgraphics(gca,'text.gif','Append',true)
end

end