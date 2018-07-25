function [bang] = get_bisector_angle(p1, c, p2)

    v1 = p1 - c;
    v2 = p2 - c;
    dtp = dot(v1, v2);
    costheta = dtp/get_norm(v1)*get_norm(v2);
    bang = acosd(costheta);
    
end