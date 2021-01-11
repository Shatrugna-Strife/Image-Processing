function [X,Y] = distanceversusangle(input)
    [x,y,~] = size(input);
    [cr, cc] = getcentre(input);
    %cr
       % cc
    input = getboundary(input);
    list = [];
    tot = 0;
    for i = 1:x
        for j = 1:y
            if input(i,j) == 255
                tot = tot+1;
                tx = double(j)-double(cc);
                ty = double(cr)-double(i);
                %[i,j,tx,ty]
                list(tot, 1) = atan2(ty, tx);
                list(tot, 2) = sqrt(tx^2+ty^2);
            end
        end
    end
    [~, order] = sort(list(:,1));
    list = list(order,:);
    %list
    X = list(:,1);
    Y = list(:,2);