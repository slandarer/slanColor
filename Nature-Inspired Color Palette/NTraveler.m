function NCList=NTraveler(CList)
% 想法来自: Alan Zucconi
N=size(CList,1);
NCList=zeros(N,3);
ind=find(sum(CList,2)==min(sum(CList,2)),1);
NCList(1,:)=CList(ind,:);
CList(ind,:)=[];
for i=2:N
    lastColor=NCList(i-1,:);
    normList=vecnorm((lastColor-CList)');
    ind=find(normList==min(normList),1);
    NCList(i,:)=CList(ind,:);
    CList(ind,:)=[];
end
end