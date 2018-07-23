function [newnorm] = correct_normal(refpt, oldnorm, point)
%all inputs 3x1 vectors
    
    p1 = point + 0.5*(oldnorm/get_norm(oldnorm));
    p2 = point - 0.5*(oldnorm/get_norm(oldnorm));
    n1 = get_norm(p1 - refpt); n2 = get_norm(p2 - refpt);
    
    if  n1 <= n2
        newnorm = -oldnorm;
    else
        newnorm = oldnorm;
    end
    
end