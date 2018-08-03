function [seg_num] = closest_seg_new(vert, init)

    M = init.segmap;
    n = init.numsegs;
    O = init.segorder; %O is 1xn type array with strings
    assert(size(O, 2) == n);
    
    
    mind = 10000000; bestseg = 1;
    for i = 1:n
        %disp([size(O), i]);
        curseg = O{i};
        cursegmap = M(curseg);
        fx = cursegmap('curfx');
        fy = cursegmap('curfy');
        bx = cursegmap('curbx');
        by = cursegmap('curby');
        
        j2 = [fx, fy]; j1 = [bx, by];
        
        
        d1 = get_norm2(j1 - vert); d2 = get_norm2(j2 - vert);
        
        pp(1) = (j1(2) - j2(2))/(j1(1) - j2(1));
        pp(2) = j1(2) - pp(1)*j1(1);
        fcol = find_closest_on_line(vert, pp);
        
        d = get_norm2(fcol - vert);
        
        if d < min([d1, d2])
            d = min([d1, d2]);
        end
       
        if d < mind
            mind = d;
            
            bestseg = i;
            
        end
    end
    
    seg_num = bestseg;
    
        
        
    
end