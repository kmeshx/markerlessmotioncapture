function [l] = get_rekt(s, e, np)
%p's are clockwise, np,p1 left of s
%{
    dir = np - s;
    dir = dir / 2; %CAN UPDATE
    p1 = s + dir;
    p2 = s - dir;
    p4 = e + dir;
    p3 = e - dir;
%}

    l = get_norm2(np - s);
   % disp('recty');
    
   % disp((dot((p1 - p2), (p4 - p3))/(get_norm2(p1 - p2)*get_norm2(p4 - p3))));
    
   % assert(round(rem((dot((p1 - p2), (p4 - p3))/(get_norm2(p1 - p2)*get_norm2(p4 - p3))), 90)) == 0);
    
    
end