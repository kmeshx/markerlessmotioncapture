function [startpt, endpt] = orient(p1, p2, ref)

    d1 = norm(p1 - ref); d2 = norm(p2 - ref);
    if d1 > d2
        startpt = p2; endpt = p1;
    else
        startpt = p1; endpt = p2;
    end
    
end