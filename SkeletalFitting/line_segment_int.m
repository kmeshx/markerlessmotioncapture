function [poi] = line_segment_int(A, dir, B)

    
    
    l1A = A(1:1, :); l1B = B(1:1, :) ;
    l2A = A(2:2, :); l2B = B(2:2, :);
    m1 = norm(l1B - l1A);
    m2 = norm(l2B - l2A);
    slope1 = B(1:1, :) - A(1:1, :);
    slope2 = B(2:2, :) - A(2:2, :);
    %slope1 = dir(1:1, :);
    %slope2 = dir(2:2, :);
    l1 = []; l2 = [];
    m = 100;
    for t = 0:m
        
        l1c = l1A + (t/m)*slope1;
        l2c = l2A + (t/m)*slope2;
        l1 = [l1; l1c]; l2 = [l2; l2c];
    end
    
    n = m+1; mind = 1000000; poi1 = [0, 0, 0]; poi2 = [0, 0, 0]; 
    for i = 1:n
        l1p = l1(i:i, :);
        for j = 1:n
            l2p = l2(j:j, :);
            d = norm(l1p - l2p);
            
            if d < mind
                %disp('dli'); disp(d); disp(l1p); disp(l2p);
                mind = d;
                poi1 = l1p; poi2 = l2p;
            end
        end
    end
    %plot3(poi1(1), poi1(2), poi1(3), 'r*');  plot3(poi2(1), poi2(2), poi2(3), 'r*');
    poi = (poi1 + poi2)/2;
    
end