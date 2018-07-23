function [xd, yd, zd] = get_normal(xs, ys, zs)
%xs, ys, zs are all 3x1

    v1 = [xs(2)-xs(1), ys(2) - ys(1), zs(2) - zs(1)];
    v2 = [xs(3)-xs(1), ys(3) - ys(1), zs(3) - zs(1)];
    
    c = cross(v1, v2);
    xd = c(1); 
    yd = c(2); 
    zd = c(3);
end