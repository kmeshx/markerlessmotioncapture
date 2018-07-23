function [tri_arr] = get_triangles(verts, faces)
%tri_arr is 3x3xfacessize array
    n = size(faces, 1);
    
    for i = 1:n
        
        curset = faces(i:i, :);
        tri_arr(1:1, :, i) = verts(curset(1):curset(1), :);
        tri_arr(2:2, :, i) = verts(curset(2):curset(2), :);
        tri_arr(3:3, :, i) = verts(curset(3):curset(3), :);
        
    end
    
end