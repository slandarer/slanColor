imagesc(peaks(1000)+1)

% 随便构造一个colormap
% 多行颜色插值
CM=[0.1874    0.0771    0.2162
    0.2881    0.0832    0.3962
    0.3604    0.2090    0.6047
    0.3734    0.3827    0.7065
    0.4129    0.5397    0.7472
    0.5390    0.6785    0.7712
    0.7421    0.7976    0.8227
    0.8856    0.8499    0.8857
    0.8391    0.7587    0.7108
    0.7905    0.5986    0.4866
    0.7382    0.4192    0.3485
    0.6433    0.2587    0.3124
    0.4974    0.1354    0.3141
    0.3126    0.0789    0.2669
    0.1849    0.0794    0.2131];
% CMX=linspace(0,1,size(CM,1));
% CMXX=linspace(0,1,256)';
% CM=[interp1(CMX,CM(:,1),CMXX,'pchip'), ...
%     interp1(CMX,CM(:,2),CMXX,'pchip'), ...
%     interp1(CMX,CM(:,3),CMXX,'pchip')];

colormap(CM)
colorbar 
% 调整颜色图中点位置
setPivot(0)

defualtAxes