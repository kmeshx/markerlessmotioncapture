%CODE ADAPTED FROM keith2000 : https://github.com/keith2000/VisualHullMesh


%SAVE ONLY EFL< U0, V0 in int_arr at column indices 1, 2 and 3

function [fvh] = get_visual_hull(imgs_arr, int_arr, ext_arr)
  %images array, array of intrinsic arrays, array of extrinsic arrays

  if 3 ~= exist( 'VisualHullTriMeshMex', 'file' ) 
     disp('The mex file VisualHullTriMeshMex needs to be created for your system') 
     disp('Press any key to try to do this')
     pause
     CompileVisualHullTriMeshMex;
  end
      
  n = size(imgs_arr, 1);

  for i = 1:n
    cameraVec(i).efl = int_arr(i:i, 1:1); %effective focal length in pixels
    cameraVec(i).u0 = int_arr(i:i, 2:2); % horizontal component of principal point (in pixels)
    cameraVec(i).v0 = int_arr(i:i, 3:3); % vertical component of principal point (in pixels)
    cameraVec(i).pose = ext_arr(i:i, :, :); % 4x4 matrix to transform coordinates from the world ref frame to the camera ref frame

  end

 

  imgCell = cell(size(cameraVec));
  for viewLoop = 1:length(cameraVec)

      
      im = img_arr(viewLoop);
      imgCell{viewLoop} = double(im);
      cameraVec(viewLoop).height = size(im, 1); %ok<SAGROW> 
      cameraVec(viewLoop).width = size(im, 2); %ok<SAGROW> %removed #
  end


  %now we compute the visual hull:
  [pMesh, kMesh] = VisualHullTriMesh( cameraVec, imgCell, 0, 0.2);

  fovBound = CommonFovBoundBox( cameraVec ); %LOOKS FINE, MIGHT WANT TO REVISIT

  myFV.faces = kMesh';
  myFV.vertices = pMesh';

  

  fvh = polygon2voxel(myFV, [500 500 500]); %IMPORT polygon2voxel
  
  figure, cameratoolbar, axis off, axis vis3d, axis equal, set(gcf, 'renderer', 'zbuffer')
  cameratoolbar('ResetCameraAndSceneLight'), cameratoolbar togglescenelight
  patch('Faces', kMesh', 'Vertices', pMesh', 'FaceColor', 'g', 'EdgeColor', 'none');
  set(gcf, 'Name', 'Visual Hull')


end
