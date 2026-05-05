function setCMapRatio(varargin)
% @author: slandarer
% This function adjusts the colormap ratio based on specified breakpoints.

if nargin == 2
    ax = gca;
    oriRatio = sort(varargin{1});
    breakPnt = sort(varargin{2});
elseif nargin == 3
    ax = varargin{1};
    oriRatio = sort(varargin{2});
    breakPnt = sort(varargin{3});
end

% Processing of original color limits
try
    CLimit = get(ax, 'CLim');
catch
end

try
    CLimit = get(ax, 'ColorLimits');
catch
end

breakPnt = [CLimit(1), breakPnt, CLimit(2)];
newRatio = diff(breakPnt);
oriCMap = colormap(ax);
CLen = size(oriCMap, 1);

newRatio = newRatio ./ diff([0, oriRatio, 1]);
newRatio = round(newRatio ./ max(newRatio) .* 400);
oriRatio = [oriRatio, 1];

% Construction of the initial segment of the colormap
tempCMap = oriCMap(1 : ceil(oriRatio(1) .* CLen), :);
CInd2 = kron((1 : size(tempCMap, 1) - 1)', ones(newRatio(1), 1));
newCMap = tempCMap(CInd2, :);

CInd3 = oriRatio(1) .* CLen - size(tempCMap, 1) + 1;
CInd3 = round(CInd3 .* newRatio(1));
newCMap = [newCMap; repmat(tempCMap(end, :), [CInd3, 1])];

% Iterative addition of new colormap segments
for i = 2 : length(oriRatio)
    CInd1 = round(newRatio(i) .* (ceil(oriRatio(i - 1) .* CLen) - oriRatio(i - 1) .* CLen));
    
    if abs(ceil(oriRatio(i) .* CLen) - oriRatio(i) .* CLen) > 0
        CInd2 = ceil(oriRatio(i - 1) .* CLen) + 1 : ceil(oriRatio(i) .* CLen) - 1;
    else
        CInd2 = ceil(oriRatio(i - 1) .* CLen) + 1 : ceil(oriRatio(i) .* CLen);
    end
    
    CInd2 = kron(CInd2', ones(newRatio(i), 1));
    CInd3 = round(newRatio(i) .* (oriRatio(i) .* CLen - floor(oriRatio(i) .* CLen)));
    
    if ceil(oriRatio(i) .* CLen) == ceil(oriRatio(i - 1) .* CLen)
        CInd1 = [];
        CInd3 = round(newRatio(i) .* (oriRatio(i) .* CLen - oriRatio(i - 1) .* CLen));
    end
    
    newCMap = [newCMap;
               repmat(oriCMap(ceil(oriRatio(i - 1) .* CLen), :), [CInd1, 1]);
               oriCMap(CInd2, :);
               repmat(oriCMap(ceil(oriRatio(i) .* CLen), :), [CInd3, 1])];
end

colormap(ax, newCMap);

end