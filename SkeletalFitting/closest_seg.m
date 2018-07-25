function [seg_num] = closest_seg3(vert, skel)
%vert, curptsare 1x3/6 arrays

    n = skel.numsegs;
    mind = 0; bestseg = 1;
    for i = 1:n
        curpts = skel.segarray(i:i, :);
        d = point_to_line_dist(vert, curpts(1:3), curpts(4:6));
        if d < mind
            mind = d;
            bestseg = 1;
        end
    end
    
    seg_num = bestseg;
    
        
        
    
end