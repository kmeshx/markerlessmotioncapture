function [thinned_imgarr] = thinner_three_d(three_d_img)

	thinned_imgarr = bwskel(imbinarize(three_d_img));
	
end
