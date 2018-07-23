function [p, new_radius] = find_map(pointcos, normal, surfmesh, init_radius, delver)
%POINTCOS AND NORMAL ARE VECTORS; P is 1x3

    verts = surfmesh.vertices; faces = surfmesh.faces;
    radius = init_radius;
    mul = normal / get_norm(normal);
    sc = pointcos - radius*mul; %for each
    
     
    first_closest = dsearchn(verts, delver, sc');
  
    mypt = verts(first_closest:first_closest, :)';
    %plot3(mypt(1), mypt(2), mypt(3), 'g*');
    dist = get_norm(mypt - sc);
    
    
    while ~almost_equal(dist, radius) %WRITE ALMOST EQUAL
        %disp('radjusting');
        radius = adjusted_radius(pointcos, normal, mypt); %normal, mypt vector. WRITE adjusted_radius
        
        sc = pointcos - radius*mul;
        closest = dsearchn(verts, delver, sc');
        mypt = verts(closest:closest, :)';
        dist = get_norm(mypt - sc);
        %disp([radius, dist]);
        %plot3(mypt(1), mypt(2), mypt(3), 'g*');
        %disp(mypt);
    end
    
    new_radius = 11;
    p = sc'; 
    
end