function out = bound(in)
[x,y,~] = size(in);
r = y/10;
c = x/10;

endout = zeros(x,y,'uint8');

for i = 1:c
    for j = 1:r
        sx = (i-1)*10+1;
        sy = (j-1)*10+1;
        
        sdx = sx;
        sdy = sy +9;
        
        ex = sx+9;
        ey = sy+9;
        
        eux = sx+9;
        euy = sy;
        
%         tx = 0;
%         ty = 0;
        
%         tsum = 0;
        new = zeros(x,y,'uint8');
        c = 0;
        
        tsum = sum(sum(in(sx:sx+4,sy:sy+4)));
        if tsum > 0
            new(sx,sy) = 255;
        end
        tsum = sum(sum(in(sdx:sdx+4,sdy-4:sdy)));
        if tsum > 0
            new(sdx,sdy) = 255;
        end
        tsum = sum(sum(in(ex-4:ex,ey-4:ey)));
        if tsum > 0
            new(ex,ey) = 255;
        end
        tsum = sum(sum(in(eux-4:eux,euy:euy+4)));
        if tsum > 0
            new(eux,euy) = 255;
        end
        
        if new(sx,sy) == 255 && new(sdx,sdy) == 255
            c = c+1;
            new(sx, sy:sdy) = 255;
            try
               new(sx-1, sy-1:sdy+1) = 255;
            catch
            end
        end
        if new(sx,sy) == 255 && new(eux,euy) == 255
            c = c+1;
            new(sx:eux, sy) = 255;
            try
               new(sx-1:eux+1, sy-1) = 255;
            catch
            end
        end
        if new(ex,ey) == 255 && new(sdx,sdy) == 255
            c = c+1;
            new(sdx:ex, ey) = 255;
            try
               new(sdx-1:ex+1, ey+1) = 255;
            catch
            end
        end
        if new(ex,ey) == 255 && new(eux,euy) == 255
            c = c+1;
            new(ex, euy:ey) = 255;
            try
               new(ex+1, euy-1:ey+1) = 255;
            catch
            end
        end
        
        if c>1
            endout = endout + new;
        end
        
%         mx = sx;
%         my = sy;
%         
%         tot = 0;
%         
%         while mx <= ex
%             my = sy;
%             while my <= ey
%                 if in(mx,my) == 255
%                     tx = tx + mx;
%                     ty = ty + my;
%                     tot = tot + 1;
%                 end
%                 my = my + 1;
%             end
%             mx = mx + 1;
%         end
%         
%         new(sx,sy) = 255;
%         new(ex,ey) = 255;
%         
%         if tot == 0
%             continue;
%         end
%         
%         tx = uint64(tx/tot);
%         ty = uint64(ty/tot);
%         
%         new(tx, ty) = 255;
        
    end
end

out = fillspots(endout);
out = out - getboundary(out, 1);
        