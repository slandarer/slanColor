function CM=PYCM
% @author: slandarer
% @公众号: slandarer随笔
% @知  乎: slandarer
% =====================================================
% 基本使用：
% PYCM().pink(n)
% PYCM().pink()       % 未指定数目时默认返回100个RGB值
% PYCM().pink(50)     % 获取名为pink的色带的50个数值
% PYCM().viridis(50)  % 获取名为viridis的色带的50个数值
% 配合colormap函数使用：
% colormap(PYCM().pink())
% -----------------------------------------------------
% 获取全部colormaps名称：
% PYCM().colormaps()
% -----------------------------------------------------
% 色卡展示：
% PYCM().show()  % 创建6个窗口展示全部色卡
% PYCM().show(1) % 展示第一个色卡

pyData=load('PYCMset.mat');

% 获取n个插值颜色基础函数--------------------------------------------------
    function map=interpColor(map,n)
        if isempty(n)
            n=100;
        else
            if isempty(n{1})||round(n{1}(1))==0||~isnumeric(n{1})
                n=100;
            else
                n=abs(round(n{1}(1)));
            end
        end
        map=map./255;
        Xi=1:size(map,1);Xq=linspace(1,size(map,1),n);
        map=[interp1(Xi,map(:,1),Xq,'linear')',...
            interp1(Xi,map(:,2),Xq,'linear')',...
            interp1(Xi,map(:,3),Xq,'linear')'];
    end
for i=1:length(pyData.CLASS.Total)
    CM.(pyData.CLASS.Total{i})=@(varargin)interpColor(pyData.CM.(pyData.CLASS.Total{i}),varargin);
end

% 展示全部颜色种类函数-----------------------------------------------------
    function showName(pyData)
        fprintf('%s\n',char(ones(1,60).*61))
        for m=1:length(pyData.CLASS.ListFullName)
            fprintf('【%s】:\n\n',pyData.CLASS.ListFullName{m})
            k6=ceil(length(pyData.CLASS.(pyData.CLASS.List{m}))/6);
            for n=1:k6
                fprintf('%s  ',pyData.CLASS.(pyData.CLASS.List{m}){(n-1)*6+1:min(n*6,end)})
                fprintf('\n')
            end
            fprintf('%s\n',char(ones(1,60).*45))
        end
    end
CM.colormaps=@()showName(pyData);

% 色卡生成函数-------------------------------------------------------------
    function showCM(pyData,n)
        if isempty(n)||round(n{1}(1))>6||round(n{1}(1))<1||~isnumeric(n{1})
            n=1:6;
        else
            n=round(n{1}(1));
        end
        for k=n
            showCMinFunc(pyData,k);
        end
        function showCMinFunc(pyData,n)
            fig=figure();
            ax=axes('Parent',fig);hold on;
            ax.XLim=[0,800];ax.XTick=[];ax.XColor='none';
            ax.YLim=[0,600];ax.YTick=[];ax.YColor='none';
            ax.FontName='cambria';
            ax.FontSize=15;
            ax.Title.String=pyData.CLASS.ListFullName{n};
            tNameList=pyData.CLASS.(pyData.CLASS.List{n});
            [XMesh,YMesh]=meshgrid(linspace(161,793,256),linspace(0,1,50));
            ZMesh=zeros(size(XMesh));
            for kk=1:length(tNameList)
                tCMesh=reshape(pyData.CM.(tNameList{kk})./255,[1,256,3]);
                tCMesh=repmat(tCMesh,[50,1]);
                surf(XMesh,(600-10-32*kk).*ones(50,256)+YMesh.*28,ZMesh,'CData',tCMesh,'EdgeColor','interp');
                tName=tNameList{kk};
                if any(tName=='_')
                    downLinePos=find(tName=='_');
                    tName=[tName(1:downLinePos-1),'\',tName(downLinePos:end)];
                end
                text(158,(600-10-32*kk+16),tName,'FontName','cambria','HorizontalAlignment','right','FontSize',14)
            end
        end
    end
CM.show=@(varargin)showCM(pyData,varargin);
end