% demo1

% 随机生成数据
X=.3+rand(1,10);
explode=0.*X;
explode(7)=1.5;
% 基础绘图
pieHdl=pie(X,explode);
% 修改配色
for i=1:2:length(pieHdl)
    % 一次只取一个颜色
    pieHdl(i).FaceColor=slanCL(1924,(i+1)/2);
    pieHdl(i+1).FontName='Cambria';
    pieHdl(i+1).FontSize=12;
end
% 添加图例
lgdHdl=legend();
lgdHdl.Location='best';
lgdHdl.NumColumns=2;
lgdHdl.FontName='Cambria';
lgdHdl.FontSize=11;