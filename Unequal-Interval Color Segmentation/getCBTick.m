function cbTick=getCBTick(ax)
% @author:slandarer
if nargin<1,ax=gca;end
CMap=colormap(ax);
[~,Cind,~]=unique(CMap,'rows');
Cind=sort(Cind);
Cind=Cind(2:end)-1;
CLimit=get(ax,'CLim');
N=size(CMap,1);
Cind=Cind./N;
cbTick=[CLimit(1);CLimit(1)+(CLimit(2)-CLimit(1)).*Cind;CLimit(2)];
end