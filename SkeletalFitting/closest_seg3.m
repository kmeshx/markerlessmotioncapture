function [seg_num] = closest_seg3(vert, skel)
%vert, curptsare 1x3/6 arrays
    %disp('for one vertex');
    n = skel.numsegs;
    mind = 10000000; bestseg = 1;
    for i = 1:n
        curpts = skel.segarray(i:i, :);
        d = abs(point_to_line_distance(vert, curpts(1:3), curpts(4:6)));
        %disp('d: '); disp(d);
        if d < mind
            mind = d;
            bestseg = i;
        end
    end
   % disp('seg_num'); disp(bestseg);
    seg_num = bestseg;
    
end