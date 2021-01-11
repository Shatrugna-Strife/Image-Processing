function output = areamarking(input)
    list = [];
    s = [];
    ins = 1;
    [x,y,~] = size(input);
    temp = zeros(x,y,'uint8');
    output = input;
    for i = 1:x
        for j = 1:y
            if input(i,j) == 255 && temp(i,j) ~= 1
                count = 0;
                stack(1,1) = i;
                stack(1,2) = j;
                top = 2;
                while top>1
                    top = top-1;
                    tx = stack(top,1);
                    ty = stack(top,2);
                    temp(tx,ty) = 1;
                    count = count + 1;
                    if tx<x && input(tx+1,ty) == 255 && temp(tx+1,ty) ~= 1
                        stack(top,1) = tx+1;
                        stack(top,2) = ty;
                        top = top+1;
                        temp(tx+1,ty) = 1;
                    end
                    if tx>1 && input(tx-1,ty) == 255 && temp(tx-1,ty) ~= 1
                        stack(top,1) = tx-1;
                        stack(top,2) = ty;
                        top = top+1;
                        temp(tx-1,ty) = 1;
                    end
                    if ty<y && input(tx,ty+1) == 255 && temp(tx,ty+1) ~= 1
                        stack(top,1) = tx;
                        stack(top,2) = ty+1;
                        top = top+1;
                        temp(tx,ty+1) = 1;
                    end
                    if ty>1 && input(tx,ty-1) == 255 && temp(tx,ty-1) ~= 1
                        stack(top,1) = tx;
                        stack(top,2) = ty-1;
                        top = top+1;
                        temp(tx,ty-1) = 1;
                    end
                end
                list(ins, 1) = count;
                list(ins, 2) = j;
                list(ins, 3) = i;
                ins = ins+1;
                %position = [j i];
                %value = [count];
                %output = insertText(output,position,value,'AnchorPoint','LeftBottom');
                %figure;imshow(input);
            end
        end
    end
    [~, order] = sort(list(:,1));
    list = list(order,:);
    [q,~,~] = size(list);
    for i = 1:q
        input = insertText(input,list(i,2:3),list(i,1),'AnchorPoint','LeftBottom');
        output = insertText(output,list(i,2:3),[i],'AnchorPoint','LeftBottom');
    end
    figure;imshow(input);title('Coins Area Based on Number of White Pixels');