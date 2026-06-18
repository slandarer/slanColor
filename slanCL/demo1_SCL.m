%% demo1 : Apply slanCL palette to pie chart

% Generate random data (随机生成数据)
X = .3 + rand(1, 10);
explode = 0.*X;
explode(7) = 1.5;

% Basic pie plot (基础饼图绘制)
pieHdl = pie(X, explode);

% Modify colors and text properties (修改配色与文本属性)
for i = 1:2:length(pieHdl)
    % Extract one color at a time from slanCL palette (每次从slanCL调色板取一个颜色)
    pieHdl(i).FaceColor = slanCL(1924, (i + 1)/2);
    pieHdl(i+1).FontName = 'Cambria';
    pieHdl(i+1).FontSize = 12;
end

% Add legend (添加图例)
lgdHdl = legend();
lgdHdl.Location = 'best';
lgdHdl.NumColumns = 2;
lgdHdl.FontName = 'Cambria';
lgdHdl.FontSize = 11;