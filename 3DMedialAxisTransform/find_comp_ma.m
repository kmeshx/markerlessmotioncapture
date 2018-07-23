function [map_pts] = find_comp_ma(surfmesh)
    verts = surfmesh.vertices;
    n = size(surfmesh.faces, 1);
    m = size(surfmesh.vertices, 1);
    %currand = randi(m);
    figure,
    plot3(surfmesh.vertices(:, 1:1), surfmesh.vertices(:, 2:2), surfmesh.vertices(:, 3:3), 'r+');
    hold on;
    %tri_arr = get_triangles(surfmesh.vertices, surfmesh.faces);
    tree = KDTreeSearcher(verts);
    radiuss = 1;
     min_neighbors = 8;
    %rad_rand = tri_arr(currand:currand, :);
    mypc = pointCloud(surfmesh.vertices);
    sphm = pcfitsphere(mypc, 0.1);
    disp('sphereradius'); 
    init_radius = sphm.Radius; disp(init_radius);
    refpt = get_mid(surfmesh.vertices(:, 1:1), surfmesh.vertices(:, 2:2), surfmesh.vertices(:, 3:3));
    delver = delaunayn(surfmesh.vertices);
    map_pts = [];
    for i=1:m
        %curptcos = tri_arr(:, :, i);
        %curptx = [curptcos(1:1, 1:1); curptcos(2:2, 1:1); curptcos(3:3, 1:1)];
        %curpty = [curptcos(1:1, 2:2); curptcos(2:2, 2:2); curptcos(3:3, 2:2)];
       % curptz = [curptcos(1:1, 3:3); curptcos(2:2, 3:3); curptcos(3:3, 3:3)];
       % [curnormx, curnormy, curnormz] = get_normal(curptx, curpty, curptz);
        pt = verts(i:i, :);
        curnorm = estimateNormal(verts, tree, pt, radiuss, min_neighbors);
       
        %pointcos = get_mid(curptx, curpty, curptz)';
        curnorm = correct_normal(refpt', curnorm, pt'); %curnorm is vector
        %curnorm = [curnormx, curnormy, curnormz]';
        [cur_map, new_radius] = find_map(pt', curnorm, surfmesh, init_radius, delver);
       
        init_radius = new_radius;
        %plot3(pt(1), pt(2), pt(3), 'g*');
        plot3(cur_map(1), cur_map(2), cur_map(3), 'b*');
        map_pts = [map_pts; cur_map];
        
        
    end
    
    save;
    hold off;
end
