function CM=interpColor(CList,n)
Ci=1:size(CList,1);
Cq=linspace(1,size(CList,1),n);
CM=[interp1(Ci,CList(:,1),Cq,'pchip')',...
    interp1(Ci,CList(:,2),Cq,'pchip')',...
    interp1(Ci,CList(:,3),Cq,'pchip')'];
end