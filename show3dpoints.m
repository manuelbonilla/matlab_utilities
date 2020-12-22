function show3dpoints()
%This file shows the 3d representation of .LAV, .AU1 and AU2

[file_name_1, file_path_1] = uigetfile({'*.LAV', 'Bottom+Fill';'*.AU1', 'Side';}, 'Load profile');
index_cum_point = 0;
while(file_name_1 ~= 0)
    
    data =  importdata([file_path_1 file_name_1]);
    %figure
    for i=1:size(data,1)
        if (data(i,2) == 0)
            break;
        end
        T = transl(data(i,2), data(i,3), data(i,4));
        T = T*eul2tr(data(i,5),data(i,6),data(i,7), 'deg');
        plotCSYS(T,10)
        index_cum_point = index_cum_point +1;
        text(T(1,4), T(2,4), T(3,4),num2str(index_cum_point))
        axis equal
        xlabel('x')
        ylabel('y')
        zlabel('z')
        hold on
    end
    plotCSYS(eye(4),30)
    text(0,0,0,'CSYS')
    legend({'X','Y','Z'},'Location','northwest') 
    [file_name_1, file_path_1] = uigetfile({'*.LAV', 'Bottom+Fill';'*.AU1', 'Side';}, 'Load profile');
end

end