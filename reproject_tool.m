function [lv_arr] = reproject_tool(vid1, vid2, int1, int2, exts1, exts2)
    lv_arr = [];
    reader2 = VideoReader(vid2);
    vid = {};
    cc = 1;
    while hasFrame(reader2)
    
       vid{cc} = im2single(readFrame(reader2));
       cc = cc+1;
       
    end
    
    
    
    reader1 = VideoReader(vid1);
    d = 0;
    while hasFrame(reader1)
       d = d + 1;
       close all;
       curframe = im2single(readFrame(reader1));
       figure
       imshow(curframe);
       w = waitforbuttonpress;
       
       if w == 0
        [selx, sely] = getpts;
        lv_arr = [lv_arr; [selx, sely]];
        [myxs, myvs] = get_ray(selx, sely, int1, int2, exts1, exts2);
       
        
        figure, imshow(vid{d}); axis on;
        hold on; plot(myxs, myvs, 'Color', 'c'); axis ij;
        hold off;
        
        
        w1 = waitforbuttonpress;
        if w1 == 0
            
            continue;
        else
            break;
        end
        
       
       else
           continue;
       end
       
       
       
    end
    
    
end