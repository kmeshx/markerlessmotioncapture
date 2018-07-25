function [new_mat] = prune_mat(matpts, rad_thresh, ang_thresh)
    new_mat = [];
    matdt = delaunayTriangulation(matpts(:, 1:1), matpts(:, 2:2), matpts(:, 3:3));
    [V, R] = voronoiDiagram(matdt);
   % cl = matdt.ConnectivityList;
    n = size(matpts, 1);
    
    for i = 1:n
        
        curpt = matpts(i:i, :);
        
        Idx = R{i};
        %Idx = knnsearch(matpts, curpt, 'K', 4);
        i1 = Idx(1); i2 = Idx(2); i3 = Idx(3); i4 = Idx(4);
        
        
        p1 = V(i1:i1, :);
        in = [-Inf, -Inf, -Inf];
        
        p2 = V(i2:i2, :);
        
        p3 = V(i3:i3, :);
        p4 = V(i4:i4, :);
        
        
        if sum(p1 == in) == 0
            d(1) = get_norm(p1 - curpt);
        end
        if sum(p2 == in) == 0
            d(2) = get_norm(p2 - curpt); 
        end
        if sum(p3 == in) == 0
            d(3) = get_norm(p3 - curpt); 
        end
        if sum(p4 == in) == 0
            d(4) = get_norm(p4 - curpt); 
        end
        
        [val, ind] = min(d); 
        
        %1-2, 1-3, 1-4, 2-3, 2-4, 3-4
        
        c = curpt;
        b(1) = get_bisector_angle(p1, c, p2);
        b(2) = get_bisector_angle(p1, c, p3);
        b(3) = get_bisector_angle(p1, c, p4);
        b(4) = get_bisector_angle(p2, c, p3);
        b(5) = get_bisector_angle(p2, c, p4);
        b(6) = get_bisector_angle(p3, c, p4);
        
        [b_val, b_ind] = max(b);
        
        if ~(b_val > ang_thresh && val > rad_thresh)
            new_mat = [new_mat; curpt];
        end
    end
           
        
end