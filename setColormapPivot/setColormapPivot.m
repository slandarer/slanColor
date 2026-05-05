function setColormapPivot(varargin)
% Directly manipulate an existing colormap 
% by shifting its center to a specified value.
% =========================================================================
% Basic usage : supporting 4 calling patterns:
%   1. setColormapPivot()              -> use current axes(gca) , pivot move to 0
%   2. setColormapPivot(ax)            -> use specified axes    , pivot move to 0
%   3. setColormapPivot(value)         -> use current axes(gca) , pivot move specified value
%   4. setColormapPivot(ax, value)     -> use specified axes    , pivot move specified value
% =========================================================================
switch nargin
    case 0, ax = gca; value = 0;
    case 1
        if isa(varargin{1},'matlab.graphics.axis.Axes')
            ax = varargin{1}; value = 0; 
        else
            ax = gca; value = varargin{1};
        end
    case 2, ax = varargin{1}; value = varargin{2};
end

% - R2014b+  : 'CLim'
% - Older    : 'ColorLimits'
if isprop(ax, 'CLim')
    CLim = ax.CLim;
else
    CLim = ax.ColorLimits;
end
 
CLen = [value - CLim(1), CLim(2) - value]; 
CMap = colormap(ax); N = size(CMap, 1); 

% =========================================================================
% Algorithm based on colormap size:
% -------------------------------------------------------------------------
% Small colormaps (< 120 colors)  : Use integer-ratio-based sampling
% Large colormaps (>= 120 colors) : Use continuous interpolation
% -------------------------------------------------------------------------
% The threshold 120 is empirically chosen for optimal visual quality.
% =========================================================================
if N < 120
    % If the specified value falls within the color limits.
    if all(CLen > 0)
        D = min(300, round(5e3/N));
        [CV, CI0] = sort(CLen);
        [RN, RD] = rat(round(CV(1)/CV(2).*D)./D);
        if RD ~= 1
            R = [RN, RD]; R = R(CI0);
            CL1 = CMap(1:floor(N/2), :);
            CL2 = CMap((floor(N/2) + 1):end, :);
            if mod(N, 2) ~= 0
                CL3 = CL2(1,:); CL2(1,:) = [];
                CI1 = kron((1:size(CL1, 1))', ones(R(1)*2, 1));
                CI2 = kron((1:size(CL2, 1))', ones(R(2)*2, 1));
                CMap = [CL1(CI1, :); repmat(CL3, [R(1) + R(2), 1]); CL2(CI2,:)];
            else
                CI1 = kron((1:size(CL1, 1))', ones(R(1), 1));
                CI2 = kron((1:size(CL2, 1))', ones(R(2), 1));
                CMap = [CL1(CI1, :); CL2(CI2, :)];
            end
        end
    else
        CL1 = CMap(1:floor(N/2), :);
        CL2 = CMap((floor(N/2) + 1):end, :);
        CI1 = kron((1:size(CL1, 1))', ones(2, 1));
        CI2 = kron((1:size(CL2, 1))', ones(2, 1));
        CL1 = CL1(CI1, :); CL2 = CL2(CI2, :);
        if length(CL2) > length(CL1)
            CL1(end + 1, :) = CL2(1, :);
            CL2(1, :) = [];
        end
        if CLen(1) <= 0    % Pivot at or below minimum
            CMap = CL2;    % Use right half only
        else               % Pivot at or above maximum
            CMap = CL1;    % Use left half only
        end

    end
else
    VRat = (value - min(CLim))/abs(diff(CLim));
    OInd = linspace(0, 1, N).'; NInd = OInd.*0;
    LBool = OInd <= VRat;
    RBool = OInd >= VRat;
    NInd(LBool) = .5.*OInd(LBool)./VRat;
    NInd(RBool) = .5.*(OInd(RBool) - VRat)./(1 - VRat) + .5;
    CMap = interp1(OInd, CMap, NInd, 'linear');
    CMap = max(0, min(1, CMap));
end
colormap(ax, CMap);
end