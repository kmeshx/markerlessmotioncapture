function [newskel] = try_skelfit(verts)

    importfile( 'eledatay.mat');
    %disp(eMAT);
    %verts = eMAT;

    myskel = init_struct3();

    disp('pms'); disp(myskel.jointarray);
    newskel = get_lse_params(myskel, verts);

    ja = newskel.jointarray;
   % newskel = myskel;
    %plot3(verts(:, 1:1), verts(:, 2:2), verts(:, 3:3), 'r*');
    ja1 = ja(:, 1:1);
    ja2 = ja(:, 2:2);
    ja3 = ja(:, 3:3);
    plot3(ja1, ja2, ja3, 'm*');

    disp('nms');
    disp(newskel);
    disp(newskel.jointarray);
end

