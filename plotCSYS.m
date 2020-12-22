function plotCSYS(T, scale)

if nargin < 2
    scale = 1;
end


hold on
if (size(T,1) == 4)
    quiver3( T(1,4), T(2,4), T(3,4),  T(1,1), T(2,1), T(3,1), scale,'r')
    quiver3( T(1,4), T(2,4), T(3,4),  T(1,2), T(2,2), T(3,2), scale,'g')
    quiver3( T(1,4), T(2,4), T(3,4),  T(1,3), T(2,3), T(3,3), scale,'b')
elseif (size(T,1) == 3)
    quiver(T(1,3), T(2,3), T(1,1), T(2,1), scale,'r')
    quiver(T(1,3), T(2,3), T(1,2), T(2,2), scale,'b')
end
      
% hold off

end