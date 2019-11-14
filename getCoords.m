function [x1,y1] = getCoords(mi,step)
    maximo = max(max(mi));
    [i,j] = find(mi == maximo);
    x1 = (j-1)*step + 1;
    y1 = (i-1)*step + 1;
end