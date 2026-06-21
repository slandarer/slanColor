function getNCL
% getNCL - Download NCL colormap files from NCAR website (从 NCAR 网站下载 NCL 颜色表文件)
%   This function automatically fetches all available color table (.rgb) files
%   from the NCL Color Table Gallery and saves them into local folders.
%   (该函数自动从 NCL 颜色表图库获取所有可用的颜色表(.rgb)文件，并保存到本地文件夹)

% Define main folder name and source URL (定义主文件夹名称和源URL)
main_forder_name = 'NCL_RGB';
main_website_path = 'https://www.ncl.ucar.edu/Document/Graphics/color_table_gallery.shtml#SVG';
if ~exist(main_forder_name, 'dir')
   mkdir(main_forder_name);
end

main_content = webread(main_website_path);
class_sep = [regexpi(main_content, '<a name='), length(main_content)];
className{length(class_sep) - 1} = '';
colorName{length(class_sep) - 1} = {''};

% Loop over each color class (遍历每个颜色类别)
for i = 1:length(class_sep)-1
    class_content = main_content(class_sep(i):class_sep(i + 1));
    class_begin = 10;
    class_end = regexpi(class_content, '></a>');
    class_name = class_content(class_begin:class_end(1)-2);
    className{i} = class_name;
    
    % Create subfolder for this class (为该类创建子文件夹)
    class_forder_name = ['NCL_RGB\', class_name];
    if ~exist(class_forder_name, 'dir')
        mkdir(class_forder_name);
    end

    img_begin = regexpi(class_content, 'Images/');
    img_end = regexpi(class_content, '_labelbar');

    tColorNameCell = {};
    disp(' ')
    
    % Loop over each color table in this class (遍历该类中的每个颜色表)
    for j = 1:length(img_begin)
        color_name = class_content(img_begin(j)+7:img_end(j)-1);
        tColorNameCell{j} = color_name;
        color_website_path = ['https://www.ncl.ucar.edu/Document/Graphics/ColorTables/Files/', color_name, '.rgb'];
        
        % Display progress in the console (在控制台显示进度)
        disp(['Downloading: ','Class(', num2str(i), ')[', class_name, '] -> Color(', num2str(j), ')[', color_name, ']'])
        websave([class_forder_name, '\' , color_name, '.txt'], color_website_path);
    end
    colorName{i} = tColorNameCell;
end
% save nclCM_Name.mat className colorName
end


% =========================================================================
% Zhaoxu Liu / slandarer (2022). ncl colormaps 
% (https://www.mathworks.com/matlabcentral/fileexchange/120848-ncl-colormaps), 
% MATLAB Central File Exchange. Retrieved 2022/11/19.
% =========================================================================