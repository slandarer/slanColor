function colorList = nclCM(type, num)
% nclCM - Get NCAR Command Language (NCL) colormap by name or ID
%   colorList = nclCM(type) returns the full original colormap
%
%   colorList = nclCM(type, num) returns a colormap with a specified number of colors
%
% Input:
%   type - colormap identifier (string name or numeric ID)
%   num  - number of colors (default: original number of colors in the file) 
%
% Output:
%   colorList - num×3 RGB matrix with values in [0, 1],
%               interpolated from the selected NCL colormap.
%
% Example:
%   contourf(peaks, 30)
%   colorbar
%
%   colormap(nclCM('cmocean_deep'))   % Use full original colormap
%   colormap(nclCM(60))               % Use colormap No. 60 by ID
%   colormap(nclCM(60, 20))           % Use colormap No. 60 with 20 colors


% =========================================================================
% This function provides standard colormaps from the NCL graphics library,
% suitable for scientific data visualization. The colormaps cover 
% professional gradients for meteorology, oceanography, and other fields.
%
% # Acknowledgement & Source:
%      All colormap data in this file are sourced from 
%      NCAR Command Language (NCL)
%      Website: https://www.ncl.ucar.edu/Document/Graphics/color_tables.shtml
%
% # License:
%      NCL is distributed under a BSD-style open source license.
%      This function, as a repackaging of colormap data, follows the same 
%      license terms. See NCL official documentation for details.
%
% # References:
%      NCAR Command Language. (2024). Color Tables.
%      URL: https://www.ncl.ucar.edu/Document/Graphics/color_tables.shtml


if nargin < 2
    num = -1;
end
if nargin < 1
    type = 73;
end
nclCM_Data = load('nclCM_Data.mat');
CList_Data = nclCM_Data.Colors;
% disp(nclCM_Data.author);

if isnumeric(type)
    Cmap = CList_Data{type};
else
    Cpos = strcmpi(type, nclCM_Data.Names);
    Cmap = CList_Data{find(Cpos, 1)};
end
if num > 0
Ci = 1:size(Cmap, 1); Cq = linspace(1, size(Cmap, 1), num);
colorList=[interp1(Ci, Cmap(:,1), Cq, 'linear')',...
           interp1(Ci, Cmap(:,2), Cq, 'linear')',...
           interp1(Ci, Cmap(:,3), Cq, 'linear')'];
else
colorList = Cmap;
end
end


% =========================================================================
% Zhaoxu Liu / slandarer (2022). ncl colormaps 
% (https://www.mathworks.com/matlabcentral/fileexchange/120848-ncl-colormaps), 
% MATLAB Central File Exchange. Retrieved 2022/11/19.
% =========================================================================