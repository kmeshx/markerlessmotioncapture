%adapted from Keith Forbes: https://github.com/keith2000/VisualHullMesh
%modified version of VisualHullMeshDemo files
function [sv] = gvh(img_arr, int_arr, ext_arr)
  
  if 3 ~= exist( 'VisualHullTriMeshMex', 'file' ) 
     disp('The mex file VisualHullTriMeshMex needs to be created for your system') 
     disp('Press any key to try to do this')
     pause
     CompileVisualHullTriMeshMex;
  end
      
  n = size(int_arr, 1);

  for i = 1:n
    fprintf("ind %d\n", i);
    cameraVec(i).efl = int_arr(i:i, 1:1); 
    cameraVec(i).u0 = int_arr(i:i, 2:2); 
    cameraVec(i).v0 = int_arr(i:i, 3:3);
    cameraVec(i).pose = ext_arr(:, :, i);
    disp(cameraVec);
    disp(length(cameraVec));
  end

  

  imgCell = cell(size(cameraVec));
  for viewLoop = 1:length(cameraVec)


      im = img_arr(:, :, viewLoop);
      fprintf("imsize");
      disp(size(im));
      imgCell{viewLoop} = double(im);
      cameraVec(viewLoop).height = size(im, 1); 
      cameraVec(viewLoop).width = size(im, 2); 
  end
  
  for jj = 1:length(cameraVec)    
      cameraVec(jj).pose(1:3,1:3) = inv(cameraVec(jj).pose(1:3,1:3 ) );
  end
  
 % DisplayCamerasTwo(cameraVec);
  
  for i = 1:n
      bda(:, :, i) = edge(img_arr(:, :, i), 'approxcanny');
  end
  
  visualizeCones(bda, cameraVec, n);
  [pMesh, kMesh] = VisualHullTriMesh( cameraVec, imgCell, 0, 0.2);

  fovBound = CommonFovBoundBox( cameraVec ); 

  myFV.faces = kMesh';
  myFV.vertices = pMesh';
  %{
  [sf, sv] = surf2solid(myFV.faces, myFV.vertices, 'thickness',-0.1);
  [sf, sv] = surf2solid(sf, sv, 'thickness',-0.2);
  [sf, sv] = surf2solid(sf, sv, 'thickness',-0.3);
  [sf, sv] = surf2solid(sf, sv, 'thickness',-0.4);
  [sf, sv] = surf2solid(sf, sv, 'thickness',-0.5);
  [sf, sv] = surf2solid(sf, sv, 'thickness',-0.6);
  %}
  %eg_skeleton_laplacian_rosa(myFV.vertices, myFV.faces);
  
  sv = myFV.vertices;
  %disp(sv);
  %volumeViewer(bwskel(logical(bin_vol_from_pts(sv, 500))));
  %sv = bwdistsc(logical(bin_vol_from_pts(sv, 500)));
  volumeViewer(sv);
  %figure, scatter3(sv(:, 1:1, :), sv(:, 2:2, :), sv(:, 3:3, :), 'r');
  
  %volumeViewer(logical(bin_vol_from_pts(sv, 500)));
  %volumeViewer(Skeleton3D(logical(bin_vol_from_pts(sv, 500))));
  %[MyMedialAxis, MyMAT] = PowerCrust(sv);
  %figure, scatter3(sv(:, 1:1, :), sv(:, 2:2, :), sv(:, 3:3, :), 'r');
  %figure, scatter3(MyMedialAxis(:, 1:1, :), MyMedialAxis(:, 2:2, :), MyMedialAxis(:, 3:3, :),  'b');
  
 
  
  
end
