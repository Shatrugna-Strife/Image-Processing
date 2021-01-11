function output = fillspots(input)
    [x,y,~] = size(input);
    %fill = zeros(x,y,'uint8');
    %figure;imshow(input);
    tmp = zeros(x,y,'uint8');
    back = zeros(x,y,'uint8');
    %output = input;
    for i = 1:x
        for j = 1:y
            if input(i,j) == 0 && tmp(i,j) ~= 1
                temp = zeros(x,y,'uint8');
                bound = 0;
                stack(1,1) = i;
                stack(1,2) = j;
                top = 2;
                while top>1
                    top = top-1;
                    tx = stack(top,1);
                    ty = stack(top,2);
                    temp(tx,ty) = 1;
                    if tx<x 
                        if input(tx+1,ty) == 0 && temp(tx+1,ty) ~= 1
                            stack(top,1) = tx+1;
                            stack(top,2) = ty;
                            top = top+1;
                            temp(tx+1,ty) = 1;
                        end
                    else
                        bound = 1;
                        %break;
                    end
                    if tx>1 
                        if input(tx-1,ty) == 0 && temp(tx-1,ty) ~= 1
                            stack(top,1) = tx-1;
                            stack(top,2) = ty;
                            top = top+1;
                            temp(tx-1,ty) = 1;
                        end
                    else
                        bound = 1;
                        %break;
                    end
                    if ty<y 
                        if input(tx,ty+1) == 0 && temp(tx,ty+1) ~= 1
                            stack(top,1) = tx;
                            stack(top,2) = ty+1;
                            top = top+1;
                            temp(tx,ty+1) = 1;
                        end
                    else
                        bound = 1;
                        %break;
                    end
                    if ty>1 
                        if input(tx,ty-1) == 0 && temp(tx,ty-1) ~= 1
                            stack(top,1) = tx;
                            stack(top,2) = ty-1;
                            top = top+1;
                            temp(tx,ty-1) = 1;
                        end
                    else
                        bound = 1;
                        %break;
                    end
                end
                if bound == 1
                    %tmp = zeros(x,y,'uint8');
                    back = bitor(back, temp);
                end
                tmp = bitor(tmp, temp);
                %position = [j i];
                %value = [count];
                %output = insertText(output,position,value,'AnchorPoint','LeftBottom');
                %figure;imshow(input);
            end
        end
    end
    %back = 255*back;
    back = uint8(-255*double(back) + 255);
    output = bitor(input, back);