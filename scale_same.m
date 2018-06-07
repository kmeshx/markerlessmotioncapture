function [scaled] = scaled_same(init_img, cur_bbox, size_vec)
	%check grayscale binary
	cropped_img = imcrop(init_img, cur_bbox);
	scaled = imresize(cropped_img, size_vec);
end
