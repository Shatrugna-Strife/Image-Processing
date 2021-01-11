function [cr, cc] = getcentre(input)
    [x,y,~] = size(input);
    cr = 0;
    cc = 0;
    tot = 0;
    for i = 1:x
        for j = 1:y
            if input(i,j) == 255
                cr = cr + i;
                cc = cc + j;
                tot = tot +1;
            end
        end
    end
    cr = uint64(double(cr)/double(tot));
    cc = uint64(double(cc)/double(tot));