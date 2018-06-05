function [rect] = cheecords(bbox_matrix)
    n = size(bbox_matrix, 1);
    a = 0; t1 = 0; t2 = 0;
    h = 0; w = 0;
    hb = 0; wb = 0;
    ul = [0, 0]; ur = [0, 0]; br= [0, 0]; bl = [0, 0]; %4 corners of rect
    t = 0;
    for i = 1:n
        w = bbox_matrix(i:i, 3:3);
        h = bbox_matrix(i:i, 4:4);
        t = w*h;
        if (t > a)
            hb = h; wb = w;
            a = t;
            t1 = bbox_matrix(i:i, 1:1);
            t2 = bbox_matrix(i:i, 2:2);
            ul = [t1, t2];
            ur = [t1 + w , t2];
            br = [t1 + w , t2 + h];
            bl = [t1 , t2 + h];
        end
    end
    rect = [floor(ul(1)), ceil(ul(2)), ceil(wb), ceil(hb)]; %assert(dims(rect) = 2 x 2)
end
