function showCM(CList)
if nargin<1,CList=winter();end
fig=figure('Units','normalized','Position',[0,50/100,1,12/100]); 
ax=gca(fig);hold on
ax.XLim=[0,1];
ax.YLim=[0,1];
ax.Position=[0,0,1,1];
ax.XColor='none'; 
ax.YColor='none';
C=[];
C(:,:,1)=repmat([CList(:,1)',nan],[2,1]);
C(:,:,2)=repmat([CList(:,2)',nan],[2,1]);
C(:,:,3)=repmat([CList(:,3)',nan],[2,1]);
[XMesh,YMesh]=meshgrid(linspace(0,1,size(CList,1)+1),[0,1]);
surface(XMesh,YMesh,XMesh.*0,'CData',C,'EdgeColor','none');
end