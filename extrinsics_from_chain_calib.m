

function [exts_array] = extrinsics_from_chain_calib(rel_pose_array, rel_loc_array, img_arr, int_arr, n)
%%INPUT:
	%rel_pose_array has all relative poses in chain calibration method as:
	%rel_pose_array(:, :, 1) = eye(3)
	%rel_pose_array(:, :, 2) = cam 2 wrt cam base (cam 1)
	%rel_pose_array(:, :, 3) = cam 3 wrt cam 2 ...
	%rel_loc_array(1:1, :) = [0 0 0]
	%rel_loc_array(i:i, :) = relative location of cam i wrt cam i-1

	%n = number of cameras
%%OUTPUT:
	%exts_array(:, :, 1) = base camera exts
	%exts_array(:, :, 2) = cam 2 exts ...
	%size(exts_array) = 4 x 4 x (number of cameras)
    
    i1 = regionprops(img_arr(:, :, 1));
    c(1:1, :) = i1.Centroid;
    i2 = regionprops(img_arr(:, :, 2));
    c(2:2, :) = i2.Centroid;
     %{
    i3 = regionprops(img_arr(:, :, 3));
    c(3:3, :) = i3.Centroid;
   
    i4 = regionprops(img_arr(:, :, 4));
    c(4:4, :) = i4.Centroid;
    i5 = regionprops(img_arr(:, :, 5));
    c(5:5, :) = i5.Centroid;
    i6 = regionprops(img_arr(:, :, 6));
    c(6:6, :) = i6.Centroid ; 
%}
	exts_array = [];
	pose_to_base(:, :, 1) = eye(3);
	loc_to_base(1:1, :) = [0, 0, 0];
	prev_pose = rel_pose_array(:, :, 1);
	prev_loc = rel_loc_array(1:1, :);

	for i = 2:n

		cur_rel_pose = rel_pose_array(:, :, i);
		cur_rel_loc = rel_loc_array(i:i, :);
        
		% Compute the current camera pose in the global coordinate system
    	% relative to the first view.
    	cur_pose = cur_rel_pose * prev_pose;
        
        %disp(cur_rel_loc);
        
    	cur_loc    = prev_loc + cur_rel_loc * prev_pose; %cur_rel_loc is (1 x 3)
    	pose_to_base(:, :, i) = cur_pose;
    	loc_to_base(i:i, :) = cur_loc;
    	prev_pose = cur_pose;
    	prev_loc = cur_loc;

	end

	figure; 
    plot3(0, 0, 0 , 'b*');
    hold on
    
	for i = 1:n
		cur_pose_base = pose_to_base(:, :, i);
		cur_loc_base = loc_to_base(i:i, :);
		[rotMatrix,transVec] = cameraPoseToExtrinsics(cur_pose_base,cur_loc_base);
        
        %%%
        orientation = rotMatrix';
        location = -transVec * orientation;
        plotCamera('Location',location,'Orientation',orientation,'Size',20, 'Label', char(i));
        %%%
        %{
        cur_int = int_arr(i:i, :);
        fx = cur_int(1); fy = cur_int(2); cx = cur_int(3); cy = cur_int(4);
        cam_pt = ([[fx, 0, cx]; [0, fy, cy]; [0, 0, 1]]')*[c(i:i, 1); c(i:i, 2); 1];
        wor_po = rotMatrix *(cam_pt / 10000);
        wor_dir = rotMatrix *(cam_pt/10000 - transVec');
        
        quiver3(wor_po(1), wor_po(2), wor_po(3), wor_dir(1), wor_dir(2), wor_dir(3)) ;         
        
        %if (i == 2)
        plot3(location(1) ,location(2) ,location(3) , 'g*');
        %end
        %}
		exts_array(:, :, i) = [[rotMatrix, transVec']; [0, 0, 0, 1]];
    end
    
    hold off;
	disp(exts_array);

end
