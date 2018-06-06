function [two_d_img] = get_projection(three_d)
	zsize = size(three_d, 3);
	xsize = size(three_d, 1);
	ysize = size(three_d, 2);
	proj = zeros(xsize, ysize);

	%-----------------------------------
	for z = 1:zsize
		for x = 1:xsize
			for y = 1:ysize
				if three_d(x:x, y:y, z:z) == 1
					proj(x:x, y:y) = 1
				end
			end
		end
	end
	%-----------------------------------

	two_d_img = proj;

end
