function [s, e, s2, e2] = get_medial_line_new(pts)
    %figure; hold on;
    x = pts(:, 1); y = pts(:, 2);
    coeff = pca([x, y]);
    xmean = mean(x); ymean = mean(y);
    v1 = coeff(:, 1); v2 = coeff(:, 2);
    k = boundary([x, y]);
   
    n = size(k, 1);

    mind1 = 100000000;
    mind3 = 100000000;
    mind4 = 100000000;
    mind2 = 100000000;
    
    %y - ymean = slope1*(x - xmean)
    %p1(1) = slope1;
    %p1(2) = ymean - xmean*slope1;
    v1p1  = [0 ,0]; v1p2 = [0, 0];
    for i = 1:n
        ind = k(i);
        curpt = [x(ind), y(ind)];

        fcor1 = find_closest_on_ray(curpt, [xmean, ymean], v1');
        fcor2 = find_closest_on_ray(curpt, [xmean, ymean], -v1');
        fcor3 = find_closest_on_ray(curpt, [xmean, ymean], v2');
        fcor4 = find_closest_on_ray(curpt, [xmean, ymean], -v2');
        d = get_norm2(curpt - fcor1);
        if d < mind1
            mind1 = d;
            v1p1 = curpt;
        end

        d = get_norm2(curpt - fcor2);
        if d < mind2
            mind2 = d;
            v1p2 = curpt;
        end

        d = get_norm2(curpt - fcor3);
        if d < mind3
            mind3 = d;
            v2p1 = curpt;
        end

        d = get_norm2(curpt - fcor4);
        if d < mind4
            mind4 = d;
            v2p2 = curpt;
        end

    end

    dd1 = get_norm2(v1p1 - v1p2);
    dd2 = get_norm2(v2p1 - v2p2);
    if dd1 > dd2
        s = v1p1; e = v1p2;
        s2 = v2p1; e2 = v2p2;
    else
        s = v2p1; e = v2p2;
        s2 = v1p1; e2 = v1p2;
    end
    


   % plot(x, y, 'r+');
    %plot([v1(1); xmean], [v1(2); v2(2)], 'b', 'LineWidth', 3);
    %quiver([xmean; xmean], [ymean; ymean], [v1(1); v2(1)], [v1(2); v2(2)]);
    %plot([v1p1(1); v1p2(1)], [v1p1(2); v1p2(2)], 'b', 'LineWidth', 3);
    %plot([v2p1(1); v2p2(1)], [v2p1(2); v2p2(2)], 'b', 'LineWidth', 3);
   % plot([s(1); e(1)], [s(2); e(2)], 'b', 'LineWidth', 3);
    %plot([s2(1); e2(1)], [s2(2); e2(2)], 'b', 'LineWidth', 3);
    %hold off;
end