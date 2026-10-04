function demoColormapGallery
% demoColormapGallery - Interactive gallery for browsing slanCM colormaps (交互式浏览 slanCM 颜色映射库)

% Create figure window (创建图形窗口)
fig = figure('Position',[200,200,1000,700], 'Name','slanCM Colormap Gallery', ...
    'NumberTitle','off','MenuBar','none');

% Create axes and set properties (创建坐标轴并设置属性)
ax = axes('Parent',fig, 'Units','pixels', 'Position',[75,150,700,500], ...
    'Projection','perspective', 'LineWidth',1, 'TickLength',[.05,.01], ...
    'XMinorTick','on', 'YMinorTick','on', 'ZMinorTick','on', ...
    'XGrid','on', 'YGrid','on', 'ZGrid','on', ...
    'FontSize',14, 'FontName','Times New Roman', ...
    'GridLineStyle', ':', 'NextPlot','add', 'View',[-37, 42]);

% Set title and axis labels (设置标题和坐标轴标签)
title(ax, 'slanCM Colormap Gallery', 'FontSize',25, 'FontName','Times New Roman')
xlabel(ax, 'XXX-Label', 'FontSize',17, 'FontName','Times New Roman')
ylabel(ax, 'YYY-Label', 'FontSize',17, 'FontName','Times New Roman')
zlabel(ax, 'ZZZ-Label', 'FontSize',17, 'FontName','Times New Roman')

% Load colormap data (加载颜色映射数据)
slanCM_Data = load('slanCM_Data.mat');
CList_Data = [slanCM_Data.slandarerCM(:).Colors];  % All colormap matrices (所有颜色映射矩阵)
fnames = slanCM_Data.fullNames(:);                 % Colormap names (颜色映射名称)
% Generate indexed list items, e.g., '[1] Paired' (生成带序号的列表项，如 '[1] Paired')
idxnames = compose('[%d] %s', (1:numel(fnames))', string(fnames));

% Create listbox with callback (创建列表框，点击时触发回调)
uilistbox(fig, 'Position',[825,0,175,700], 'Items',idxnames,...
    'ValueChangedFcn',@applycmap);

% Add usage example labels (添加使用示例标签)
uilabel(fig, 'Position',[40, 10, 300, 80], 'FontName','Arial', ...
    'FontSize',15, 'FontColor',[0,0,0], ...
    'Text',{'colormap( slanCM( ''romao'' ))'; ...
            'colormap( slanCM( 134 ) )'; ...
            'colormap( slanCM( 134, 20 ) )'});
uilabel(fig, 'Position',[270, 10, 500, 80], 'FontName','Arial', ...
    'FontSize',15, 'FontColor',[0,128,19]./255, ...
    'Text',{'% Use ''romao'' colormap by name'; ...
            '% Use colormap No. 134 by ID'; ...
            '% Use colormap No. 134 with 20 colors'});
uilabel(fig, 'Position',[40, 90, 500, 20], 'FontName','Arial', ...
    'FontSize',17, 'FontColor',[0,0,0], 'Text','Try:');

% Plot test surface (绘制测试曲面)
Z = peaks; Z = Z./max(max(abs(Z)));          % Normalize peaks data (归一化 peaks 数据)
surf(ax, Z, 'EdgeColor','w', 'EdgeAlpha',.3) % Plot surface (绘制曲面)
colormap(ax, CList_Data{1})                  
cbar = colorbar(ax);                         
cbar.TickDirection = 'out';
cbar.LineWidth = 1;
cbar.TickLength = .005;

try
    clim(ax, [-1, 1])                        % Set color limits (设置颜色范围)
catch
    caxis(ax, [-1, 1])                       % Backward compatibility (兼容旧版本)
end
axis(ax, 'tight')                            % Tighten axes (紧凑坐标轴)

    % Listbox callback: update colormap based on selection (列表框回调：根据选择更新颜色映射)
    function applycmap(src, ~)
        type = extractAfter(src.Value, '] ');          % Extract name (提取名称)
        Cpos = strcmpi(type, slanCM_Data.fullNames);   % Find matching index (查找匹配索引)
        Cmap = CList_Data{Cpos};                       % Get colormap (获取对应颜色映射)
        colormap(src.Parent, Cmap)                     % Apply to figure (应用到图形)
    end
end