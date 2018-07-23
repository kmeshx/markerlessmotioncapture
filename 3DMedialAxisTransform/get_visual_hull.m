%VisualHullMeshDemo4b
%close all
%clear all
%drawnow

%SAVE ONLY EFL< U0, V0 in int_arr at column indices 1, 2 and 3

function [eleMAT] = get_visual_hull(img_arr, int_arr, ext_arr)
  %images array, array of intrinsic arrays, array of extrinsic arrays

  if 3 ~= exist( 'VisualHullTriMeshMex', 'file' ) 
     disp('The mex file VisualHullTriMeshMex needs to be created for your system') 
     disp('Press any key to try to do this')
     pause
     CompileVisualHullTriMeshMex;
  end
      
 % n = size(int_arr, 1);

  %{
  for i = 1:n
    fprintf("ind %d\n", i);
    cameraVec(i).efl = int_arr(i:i, 1:1); %effective focal length in pixels
    cameraVec(i).u0 = int_arr(i:i, 2:2); % horizontal component of principal point (in pixels)
    cameraVec(i).v0 = int_arr(i:i, 3:3); % vertical component of principal point (in pixels)
    cameraVec(i).pose = ext_arr(:, :, i); % 4x4 matrix to transform coordinates from the world ref frame to the camera ref frame
    disp(cameraVec);
    disp(length(cameraVec));
  end
%}
  
  cameraVec(1).efl = 15499.1;%effective focal length in pixels
  cameraVec(1).u0 = 331.558;% horizontal component of principal point (in pixels)
  cameraVec(1).v0 = 231.812;% vertical component of principal point (in pixels)
  cameraVec(1).pose = [[-0.792527;-0.00173618;-0.609835;0],[-0.00297251;0.999995;0.00101604;0],[0.60983;0.00261797;-0.792528;0],[-1.13687e-013;-4.44089e-016;500;1]];% 4x4 matrix to transform coordinates from the world ref frame to the camera ref frame
  cameraVec(2).efl = 15545.1;%effective focal length in pixels
  cameraVec(2).u0 = 331.302;% horizontal component of principal point (in pixels)
  cameraVec(2).v0 = 231.579;% vertical component of principal point (in pixels)
  cameraVec(2).pose = [[0.828626;-0.527436;-0.187592;0],[-0.527436;-0.62328;-0.57735;0],[0.187592;0.57735;-0.794654;0],[1.38778e-014;5.55112e-014;500;1]];% 4x4 matrix to transform coordinates from the world ref frame to the camera ref frame
  cameraVec(3).efl = 15487.2;%effective focal length in pixels
  cameraVec(3).u0 = 331.8;% horizontal component of principal point (in pixels)
  cameraVec(3).v0 = 231.844;% vertical component of principal point (in pixels)
  cameraVec(3).pose = [[-0.174616;0.853409;0.491123;0],[0.853409;0.379962;-0.356822;0],[-0.491123;0.356822;-0.794655;0],[5.55112e-014;-0;500;1]];% 4x4 matrix to transform coordinates from the world ref frame to the camera ref frame
  cameraVec(4).efl = 15484.2;%effective focal length in pixels
  cameraVec(4).u0 = 331.264;% horizontal component of principal point (in pixels)
  cameraVec(4).v0 = 231.678;% vertical component of principal point (in pixels)
  cameraVec(4).pose = [[-0.174616;-0.853409;0.491123;0],[-0.853409;0.379962;0.356822;0],[-0.491123;-0.356822;-0.794655;0],[5.55112e-014;-0;500;1]];% 4x4 matrix to transform coordinates from the world ref frame to the camera ref frame
  cameraVec(5).efl = 15534.3;%effective focal length in pixels
  cameraVec(5).u0 = 331.937;% horizontal component of principal point (in pixels)
  cameraVec(5).v0 = 231.091;% vertical component of principal point (in pixels)
  cameraVec(5).pose = [[0.828626;0.527436;-0.187592;0],[0.527436;-0.62328;0.57735;0],[0.187592;-0.57735;-0.794654;0],[1.38778e-014;-5.55112e-014;500;1]];% 4x4 matrix to transform coordinates from the world ref frame to the camera ref frame
  cameraVec(6).efl = 15500.1;%effective focal length in pixels
  cameraVec(6).u0 = 331.612;% horizontal component of principal point (in pixels)
  cameraVec(6).v0 = 231.763;% vertical component of principal point (in pixels)
  cameraVec(6).pose = [[-0.187592;0;-0.982247;0],[0;1;0;0],[0.982247;0;-0.187592;0],[-1.38778e-014;-0;500;1]];% 4x4 matrix to transform coordinates from the world ref frame to the camera ref frame
  cameraVec(7).efl = 15535.7;%effective focal length in pixels
  cameraVec(7).u0 = 331.3;% horizontal component of principal point (in pixels)
  cameraVec(7).v0 = 231.702;% vertical component of principal point (in pixels)
  cameraVec(7).pose = [[0.886595;-0.349025;-0.303531;0],[-0.349025;-0.0741872;-0.934172;0],[0.303531;0.934172;-0.187592;0],[2.77556e-014;-0;500;1]];% 4x4 matrix to transform coordinates from the world ref frame to the camera ref frame
  cameraVec(8).efl = 15494.8;%effective focal length in pixels
  cameraVec(8).u0 = 331.763;% horizontal component of principal point (in pixels)
  cameraVec(8).v0 = 232.034;% vertical component of principal point (in pixels)
  cameraVec(8).pose = [[0.222711;0.564734;0.794654;0],[0.564734;0.589697;-0.57735;0],[-0.794654;0.57735;-0.187592;0],[5.55112e-014;5.55112e-014;500;1]];% 4x4 matrix to transform coordinates from the world ref frame to the camera ref frame
  cameraVec(9).efl = 15497;%effective focal length in pixels
  cameraVec(9).u0 = 331.306;% horizontal component of principal point (in pixels)
  cameraVec(9).v0 = 231.894;% vertical component of principal point (in pixels)
  cameraVec(9).pose = [[0.222711;-0.564734;0.794654;0],[-0.564734;0.589697;0.57735;0],[-0.794654;-0.57735;-0.187592;0],[5.55112e-014;-5.55112e-014;500;1]];% 4x4 matrix to transform coordinates from the world ref frame to the camera ref frame
  cameraVec(10).efl = 15518;%effective focal length in pixels
  cameraVec(10).u0 = 331.656;% horizontal component of principal point (in pixels)
  cameraVec(10).v0 = 231.533;% vertical component of principal point (in pixels)
  cameraVec(10).pose = [[0.886595;0.349025;-0.303531;0],[0.349025;-0.0741872;0.934172;0],[0.303531;-0.934172;-0.187592;0],[2.77556e-014;-0;500;1]];% 4x4 matrix to transform coordinates from the world ref frame to the camera ref frame
  

  imgCell = cell(size(cameraVec));
  for viewLoop = 1:length(cameraVec)

      
      imgFilename = sprintf('%s/Elephant%02d.png', fileparts(mfilename('fullpath')), viewLoop);
      fprintf('loading %s...\n', imgFilename )%l
      im = imread( imgFilename );
      imgCell{viewLoop} = double(im);
      cameraVec(viewLoop).height = size(im, 1); %ok<SAGROW> 
      cameraVec(viewLoop).width = size(im, 2); %ok<SAGROW> %removed #

      %{
      im = img_arr(:, :, viewLoop);
      fprintf("imsize");
      disp(size(im));
      imgCell{viewLoop} = double(im);
      cameraVec(viewLoop).height = size(im, 1); %ok<SAGROW> 
      cameraVec(viewLoop).width = size(im, 2); %ok<SAGROW> %removed #
      %}
  end

  %{
  figure, cameratoolbar, axis off, axis vis3d, axis equal, set(gcf, 'renderer', 'zbuffer')
  cameratoolbar('ResetCameraAndSceneLight'), cameratoolbar togglescenelight
  DisplayCamerasTwo( cameraVec )
  %}

  %now we compute the visual hull:
  [pMesh, kMesh] = VisualHullTriMesh( cameraVec, imgCell, 0, 0.2);

  fovBound = CommonFovBoundBox( cameraVec ); %LOOKS FINE, MIGHT WANT TO REVISIT

  myFV.faces = kMesh';
  myFV.vertices = pMesh';
 % disp('LOOK'); 
  %tty = 1:10:size(myFV.vertices, 1);
  %disp(myFV.vertices(tty, :));
  pointcos = [-0.351; 1.197; 4.22]; normal = [-6.811; 4.987; 5.361];
  surfmesh = myFV; init_radius = 8; 
  delver = delaunayn(surfmesh.vertices);
 
  [p, new_radius] = find_map(pointcos, normal, surfmesh, init_radius, delver);
  %figure, plot3(myFV.vertices(:, 1:1) , myFV.vertices(:, 2:2), myFV.vertices(:, 3:3), 'r*'); hold on;
  %plot3(p(1), p(2), p(3), 'm*'); plot3(p(1), p(2), p(3), 'm*'); plot3(p(1), p(2), p(3), 'm*');
  quiver3(pointcos(1), pointcos(2), pointcos(3), -normal(1), -normal(2), -normal(3));
  radiuos = init_radius;
  mul = normal / get_norm(normal);
  sc = pointcos - radiuos*mul;
  %plot3(sc(1), sc(2), sc(3), 'b*');
  %plot3(1.9389, 0.7871, 3.4895, 'c*');
  
  get_all_normals(myFV.vertices, myFV.faces);
  eleMAT = find_comp_ma(myFV);
  %{
  midpt = get_mid(myFV.vertices(:, 1:1) , myFV.vertices(:, 2:2), myFV.vertices(:, 3:3)) + [0.5, 0.5, 0.5];
  kk = dsearchn(myFV.vertices, delaunayn(myFV.vertices), midpt);
  disp('KK!!!'); disp(kk);
  figure, plot3(myFV.vertices(:, 1:1) , myFV.vertices(:, 2:2), myFV.vertices(:, 3:3), 'r*'); hold on;
  mypt = myFV.vertices(kk:kk, :);
  plot3(mypt(1), mypt(2), mypt(3), 'g+'); plot3(midpt(1), midpt(2), midpt(3), 'b+');

 
  
  
  disp('FACES!!');
  disp(myFV.faces);
  disp(max(myFV.faces));
  disp(size(myFV.vertices));
  figure, plot3(myFV.vertices(:, 1:1) , myFV.vertices(:, 2:2), myFV.vertices(:, 3:3), 'r*');
  %}
  %disp('verts!!!');
 % disp(myFV.vertices);

 %{ 
 vertTri = delaunayTriangulation(myFV.vertices(:, 1:1), myFV.vertices(:, 2:2), myFV.vertices(:, 3:3));
  disp('vertTri');
  disp(vertTri);
  tetramesh(vertTri);
  
  patch('Faces', convhulln(fovBound'), 'Vertices', fovBound', 'FaceColor', 'none', 'EdgeColor', 'k');
  patch('Faces', kMesh', 'Vertices', pMesh', 'FaceColor', 'g', 'EdgeColor', 'none');
  set(gcf, 'Name', 'Visual Hull, Common Field Of View, and Cameras')

  figure, cameratoolbar, axis off, axis vis3d, axis equal, set(gcf, 'renderer', 'zbuffer')
  cameratoolbar('ResetCameraAndSceneLight'), cameratoolbar togglescenelight
  patch('Faces', kMesh', 'Vertices', pMesh', 'FaceColor', 'g', 'EdgeColor', 'none');
  patch('Faces', convhulln(fovBound'), 'Vertices', fovBound', 'FaceColor', 'none', 'EdgeColor', 'k');
  set(gcf, 'Name', 'Visual Hull and Common Field Of View')


  
  figure, cameratoolbar, axis off, axis vis3d, axis equal, set(gcf, 'renderer', 'zbuffer')
  cameratoolbar('ResetCameraAndSceneLight'), cameratoolbar togglescenelight
  patch('Faces', kMesh', 'Vertices', pMesh', 'FaceColor', 'g', 'EdgeColor', 'none');
  set(gcf, 'Name', 'Visual Hull')
  
 
  ss = size(myFV.vertices, 1);
  %t = 1: 100:ss;
  figure,
  plot3(myFV.vertices(:, 1:1) , myFV.vertices(:, 2:2), myFV.vertices(:, 3:3), 'r*');
  [snx, sny, snz] = surfnorm(myFV.vertices);
  figure, surfnorm(myFV.vertices);
  figure, surf(myFV.vertices);
  figure, plot3(snx, sny, snz, 'b*');
  
  figure, 
  [nx, ny, nz] = surfnorm(myFV.vertices(:, 1:1)', myFV.vertices(:, 2:2)', myFV.vertices(:, 3:3));
  quiver3(myFV.vertices(:, 1:1)', myFV.vertices(:, 2:2)', myFV.vertices(:, 3:3)', nx, ny, nz, 0.5);
  %}
  %t = 1: 100:ss;
  %quiver3(myFV.vertices(t, 1:1), myFV.vertices(t, 2:2), myFV.vertices(t, 3:3), snx(t), sny(t), snz(t));
  
  %figure, surf2solid(myFV);
  %[sf, sv] = surf2solid(myFV);
  %[sf, sv] = surf2solid(myFV.faces, myFV.vertices, 'thickness',-1);
  
  %{
  figure, cameratoolbar, axis off, axis vis3d, axis equal, set(gcf, 'renderer', 'zbuffer')
  cameratoolbar('ResetCameraAndSceneLight'), cameratoolbar togglescenelight
  patch('Faces', sf, 'Vertices', sv, 'FaceColor', 'g', 'EdgeColor', 'none');
  set(gcf, 'Name', 'Visual Hull')
  myFV2.vertices = sv;
  myFV2.faces = sf;
  %imv = polygon2voxel(myFV2, [500 500 500], 'au', false);
  %volumeViewer(imv);
  %volumeViewer(Skeleton3D(imv));
  figure, surf2solid(myFV.faces, myFV.vertices, 'thickness',-0.5); axis image; camlight;
  sfv.vertices = sv;
  sfv.faces = sf;
  %}
  %img_vol1 = polygon2voxel(myFV, [500 500 500], 'au', false); %IMPORT polygon2voxel
  %disp(size(img_vol1));
  %volumeViewer(img_vol1);
  %figure, scatter3(img_vol1);
  %[img_volx, img_voly, img_volz] = ind2sub([500, 500, 500], find(img_vol1 == 1));
  
 %size(img_vol1)
  
  
  %points = get_testp();
  %in1 = in_polyhedron(myFV, points);
  %figure, hold on, view(3)        % Display the result
  %set(gcf, 'Position', get(gcf, 'Position').*[0 0 1.5 1.5])
  %patch(myFV,'FaceColor','r','FaceAlpha',0.2)
 % figure, plot3(img_volx, img_voly, img_volz, '*');
  %[V, C] = voronoin([img_volx, img_voly, img_volz]);
  %plot3(points( in1,1),points( in1,2),points( in1,3),'bo','MarkerFaceColor','b')
  %plot3(points(~in1,1),points(~in1,2),points(~in1,3),'r.'), axis image
 % figure, scatter3(V(:, 1:1), V(:, 2:2), V(:, 3:3));
  %figure, scarred3(C(:, 1:1), C(:, 2:2), C(:, 3:3));
  %figure, plot3(V(:, 1:1), V(:, 2:2), V(:, 3:3));
  
  %figure, plot3(C);
%  legend({'volume', 'points inside', 'points outside'}, 'Location', 'southoutside')
  
  %img_volx = points( in1,1);
 % img_voly = points( in1,2);
 % img_volz = points( in1,3);
     
  %disp(size([img_volx, img_voly, img_volz]));
  %img_vol = [img_volx, img_voly, img_volz];
  %{
  tt = get_testp();
  fvh = intriangulation(myFV.vertices, myFV.faces, tt, 3);
  inim = zeros(500, 500, 500);
  
  fvhh = find(fvh);
  fprintf("fvhh\n");
  disp(fvh);
  fvhn = size(fvhh, 1);
  for i = 1:fvhn
      fprintf('YAY');
      inim(tt(i:i, 1:1):tt(i:i, 1:1), tt(i:i, 2:2):tt(i:i, 2:2), tt(i:i, 3:3):tt(i:i, 3:3)) = 1;
  end
  fprintf("inim");
  disp(size(ind2sub(size(inim),find(inim == 1))));
  %disp(inim);
  
  volumeViewer(inim);
  %[xs, ys, zs] = find(fvh);
  %figure, scatter3(xs, ys, zs);
  %figure, pcshow([xs, ys, zs]);
  %fvhh = bwskel(fvh);
  %volumeViewer(fvh);
  fprintf("start\n");
  %disp(convhulln([xs, ys, zs], {'Qt', 'Pp'}));
  %IIIP = regionprops3(fvh, 'ConvexHull');
  %disp(IIIP);
  %disp(IIIP.ConvexHull);
  %disp(IIIP.ConvexHull(1:1, :, :));
  centroid_info = regionprops3(fvh, 'Centroid');
  my_cent = get_centroid(centroid_info.Centroid);
  disp(my_cent);
  %insurf = isinsurface(fvh, my_cent);
  %volumeViewer(insurf);
  %img_vol = isinsurface(fvh, my_cent);
  %disp(regionprops3(III, 'Centroid'));
  %disp(regionprops3(fvh, 'Image'));
  %III = imgfrompoints(IIIP);
  %volumeViewer(III);
  %[xx, yy, zz] = find(fvhh);
  %figure, scatter3(xx, yy, zz);
%}
end
