function showCluster(ColorList,index,C)
colorNum=size(C,1);C=round(C);
RGBList=double(ColorList);
ax=gca;hold on;grid on;view(3)
STR{colorNum}='';
for i=1:colorNum
    scatter3(RGBList(index==i,1),RGBList(index==i,2),RGBList(index==i,3),...
        'filled','CData',C(i,:)./255);
    STR{i}=[num2str(C(i,1)),' ',num2str(C(i,2)),' ',num2str(C(i,3))];
end 
legend(STR,'Color',[0.9412 0.9412 0.9412],'FontName','Cambria','LineWidth',0.8,'FontSize',11,'Location','best')
ax.GridLineStyle='--';
ax.LineWidth=1.2;
ax.XLabel.String='R channel';
ax.XLabel.FontSize=13;
ax.XLabel.FontName='Cambria';
ax.YLabel.String='G channel';
ax.YLabel.FontSize=13;
ax.YLabel.FontName='Cambria';
ax.ZLabel.String='B channel';
ax.ZLabel.FontSize=13;
ax.ZLabel.FontName='Cambria';
end