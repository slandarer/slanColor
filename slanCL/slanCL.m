function colorList = slanCL(type, index)
% slanCL - Get popular professional color palette by name or ID
%   colorList = slanCL(type) returns the full original palette as an N×3 RGB
%   matrix, where N is the number of colors in the palette.
%
%   colorList = slanCL(type, index) returns a subset of the palette
%   specified by index. If an index exceeds the palette length, 
%   the palette is recycled cyclically, and each full cycle is progressively 
%   darkened (multiplied by 0.9^c, where c is the number of completed cycles).
%
% Input:
%   type  - palette identifier (string name or numeric ID)
%   index - scalar or vector of positive integers specifying the positions
%           of colors to extract (default: [], which returns the full palette)
%
% Output:
%   colorList - M×3 RGB matrix with values in [0, 1], where M =
%               length(index) if index is provided, otherwise N (the full
%               palette size). Each row corresponds to the selected color.
%
% Example:
%   X = 1.5 + rand(4, 4);
%   bHdl = bar(X, 'LineWidth', 0.8);
%
%   CList = slanCL('sealeo');           % Full 'sealeo' palette by name
%   CList = slanCL(1514);               % Full 'sealeo' palette by ID (no index)
%   CList = slanCL(1514, 1:4);          % First 4 colors from palette No. 1514
%   CList = slanCL(1514, [1,2,5,6]);    % Colors at positions 1,2,5,6
%   CList = slanCL(1514, 15*1 + (1:4)); % Colors at positions 16,17,18,19
%                                       % with darkening factor 0.9^1, 
%                                       % since original palette has 15 colors
%
%   % Apply colors to bars (assuming 4 groups)
%   bHdl(1).FaceColor = CList(1,:);
%   bHdl(2).FaceColor = CList(2,:);
%   bHdl(3).FaceColor = CList(3,:);
%   bHdl(4).FaceColor = CList(4,:);


% =========================================================================
% Acknowledgement & Source:
% All palettes come from the following 55 color packages:
%    'awtools'/'basetheme'/'beyonce'/'calecopal'/'colorBlindness'/'colorblindr'
%    'colRoz'/'dichromat'/'DresdenColor'/'dutchmasters'/'fishualize'/'futurevisions'
%    'ggpomological'/'ggprism'/'ggsci'/'ggthemes'/'ggthemr'/'ghibli'/'grDevices'
%    'IslamicArt'/'jcolors'/'khroma'/'LaCroixColoR'/'lisa'/'Manu'/'MapPalettes'
%    'miscpalettes'/'nationalparkcolors'/'nbapalettes'/'NineteenEightyR'/'nord'
%    'ochRe'/'palettesForR'/'palettetown'/'pals'/'PNWColors'/'Polychrome'
%    'rcartocolor'/'RColorBrewer'/'Redmonder'/'rockthemes'/'RSkittleBrewer'
%    'rtist'/'soilpalettes'/'suffrager'/'tayloRswift'/'tidyquant'/'trekcolors'
%    'tvthemes'/'unikn'/'vapeplot'/'vapoRwave'/'werpals'/'wesanderson'/'yarrr'
% -------------------------------------------------------------------------
% Please cite the original R packages when using their respective palettes.
% -------------------------------------------------------------------------
% awtools: https://github.com/awhstin/awtools
% basetheme: https://CRAN.R-project.org/package=basetheme
% beyonce: https://github.com/dill/beyonce
% calecopal: https://github.com/an-bui/calecopal
% colorBlindness: https://github.com/jianhong/colorBlindness
% colorblindr: https://github.com/clauswilke/colorblindr
% colRoz: https://github.com/jacintak/colRoz
% dichromat: https://CRAN.R-project.org/package=dichromat
% DresdenColor: https://github.com/katiejolly/DresdenColor
% dutchmasters: https://github.com/EdwinTh/dutchmasters
% fishualize: https://github.com/nschiett/fishualize
% futurevisions: https://github.com/JoeyStanley/futurevisions
% ggpomological: https://github.com/gadenbuie/ggpomological
% ggprism: https://CRAN.R-project.org/package=ggprism
% ggsci: https://CRAN.R-project.org/package=ggsci
% ggthemes: https://CRAN.R-project.org/package=ggthemes
% ggthemr: https://github.com/cttobin/ggthemr
% ghibli: https://github.com/ewenme/ghibli
% grDevices: R Core Team. R: A Language and Environment for Statistical Computing.
% IslamicArt: https://github.com/rmendels/IslamicArt
% jcolors: https://github.com/jaredhuling/jcolors
% khroma: https://doi.org/10.5281/zenodo.1472077
% LaCroixColoR: https://github.com/johannesbjork/LaCroixColoR
% lisa: https://github.com/tyluRp/lisa
% Manu: https://github.com/ropensci/Manu
% MapPalettes: https://github.com/osorensen/MapPalettes
% miscpalettes: https://github.com/EmilHvitfeldt/miscpalettes
% nationalparkcolors: https://github.com/katiejolly/nationalparkcolors
% nbapalettes: https://github.com/abresler/nbapalettes
% NineteenEightyR: https://github.com/EmilHvitfeldt/NineteenEightyR
% nord: https://github.com/jkaupp/nord
% ochRe: https://github.com/ropensci/ochRe
% palettesForR: https://github.com/AndreaCirilloAC/palettesForR
% palettetown: https://github.com/timcdlucas/palettetown
% pals: https://CRAN.R-project.org/package=pals
% PNWColors: https://github.com/jakelawlor/PNWColors
% Polychrome: https://CRAN.R-project.org/package=Polychrome
% rcartocolor: https://CRAN.R-project.org/package=rcartocolor
% RColorBrewer: https://CRAN.R-project.org/package=RColorBrewer
% Redmonder: https://CRAN.R-project.org/package=Redmonder
% rockthemes: https://github.com/katiejolly/rockthemes
% RSkittleBrewer: https://github.com/alyssafrazee/RSkittleBrewer
% rtist: https://github.com/ThomasSiegmund/rtist
% soilpalettes: https://github.com/rachelvc/soilpalettes
% suffrager: https://github.com/sctyner/suffrager
% tayloRswift: https://github.com/ndphillips/tayloRswift
% tidyquant: https://github.com/business-science/tidyquant
% trekcolors: https://github.com/leonawicz/trekcolors
% tvthemes: https://github.com/Ryo-N7/tvthemes
% unikn: https://github.com/sebkopf/unikn
% vapeplot: https://github.com/matthewleonard/vapeplot
% vapoRwave: https://github.com/moldach/vapoRwave
% werpals: https://github.com/skiptoniam/werpals
% wesanderson: https://CRAN.R-project.org/package=wesanderson
% yarrr: https://CRAN.R-project.org/package=yarrr


if nargin < 2
    index = [];
end
if nargin < 1
    type = 1;
end

slanCL_Data = load('slanCL_Data.mat');
if ~isnumeric(type)
    type = find(strcmpi(type, slanCL_Data.Palette));
end

colorList = slanCL_Data.Color{type(1)}./255;

N = size(colorList,1);
if isempty(index)
else
    colorList = colorList(mod(index - 1, N) + 1,:);
    colorList = colorList.*(.9.^(floor((index - 1)./N).'));
end
end


% =========================================================================
% Zhaoxu Liu / slandarer (2023). 2000 palettes 
% (https://www.mathworks.com/matlabcentral/fileexchange/126969-2000-palettes), 
% MATLAB Central File Exchange. Retrieved 2023/3/28.
% =========================================================================