function fromSmallToBig(scaleX,scaleY,scaleZ)

if(nargin<3)
    scaleX = 1.1;
    scaleY = 1.1;
    scaleZ = 1.1;
end

[file_name_1, file_path_1] = uigetfile({'*.LAV', 'Bottom+Fill';'*.AU1', 'Side';}, 'Load profile');
data =  importdata([file_path_1 file_name_1]);
data3 = data;
new_filename = file_name_1;
new_filename(end-4) = '5';

% Here we take the init point transfomration
% All points will be based on first point before scaling
T_initPoint = transl(data(1,2), data(1,3), data(1,4));
T_initPoint = T_initPoint*eul2tr(data(1,5),data(1,6),data(1,7), 'deg');

for i=1:size(data,1)
    if (data(i,2) == 0)
        break;
    end
    T = transl(data(i,2), data(i,3), data(i,4));
    T = T*eul2tr(data(i,5),data(i,6),data(i,7), 'deg');
    %Express points in wrt P1
    T = T_initPoint\T;
    T2 = T;
    T2(1,4) = T2(1,4)*scaleX;
    T2(2,4) = T2(2,4)*scaleY;
    T2(3,4) = T2(3,4)*scaleZ;
    
    Tn = T_initPoint* T2; 
    
    eul = tr2eul(Tn);
    data3(i,2:4) =Tn(1:3,4);
    data3(i,5:7) =eul(1:3).*180./pi;
    
end

    dlmwrite([file_path_1, new_filename],data3,'delimiter',',','newline','pc', 'precision',7 );

end