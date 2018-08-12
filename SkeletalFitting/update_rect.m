function [rectnew] = update_rect(s, e, rect)
    rectnew = zeros(1, 8);
    p1 = rect(1:1, 1:2); p2 = rect(1:1, 3:4);
    pmid = (p1 + p2)/2;
    dir = p1 - pmid;
    rectnew(1:1, 1:2) = s + dir;
    rectnew(1:1, 3:4) = s - dir;
    rectnew(1:1, 5:6) = e - dir;
    rectnew(1:1, 7:8) = e + dir;
    

end