function [skel] = init_struct3()

 

    skel.numsegs = 12;

    skel.segarray(1:1, :) = [-2.037, -3.236, -6.331, -0.9686, 1.47, -4.027]; %0 - trunk-head

    %has x1, y1, z1, x2, y2, z2 coords of a seg, repeat

    skel.segarray(2:2, :) = [-0.9686, 1.47, -4.027, -0.3827, 0.7516, -1.867]; %1 - head-neck

    skel.segarray(3:3, :) = [-0.3827, 0.7516, -1.867, 0.7976, -2.26, -1.918];  %3 - shoulder-elbow-R

    skel.segarray(4:4, :) = [0.7976, -2.26, -1.918, 0.7634, -4.014, -1.924]; %5 - elbow-wrist1-R

    skel.segarray(5:5, :) = [-0.3827, 0.7516, -1.86, -1.475, -2.283, -0.7298]; %4 - shoulder-elbow-L

    skel.segarray(6:6, :) = [-1.475, -2.283, -0.7298, -1.572, -4.07, -1.009]; %6 - elbow-wrist-L

    skel.segarray(7:7, :) = [0.6608, 1.401, 3.895, -0.2469, -1.633, 2.568]; %7 - hip-knee-L

    skel.segarray(8:8, :) = [-0.2469, -1.633, 2.568, -0.4612, -3.668, 3.159]; %9 - knee-foot-L

    skel.segarray(9:9, :) = [0.6608, 1.401, 3.895, 1.621, -2.24, 3.748]; %8 - hip-knee-R

    skel.segarray(10:10, :) = [1.621, -2.24, 3.748, 1.535, -2.551, 2.459]; %10- knee-foot-R

    skel.segarray(11:11, :) = [-0.3827, 0.7516, -1.867, 0.6608, 1.401, 3.895]; %torso

    skel.segarray(12:12, :) = [0.6608, 1.401, 3.895, 1.036, -1.967, 5.868]; %tail

    

    skel.numjoints = 13;

    

    skel.jointarray(1:1, :) = [-2.037, -3.236, -6.331]; %trunk tip

    skel.jointarray(2:2, :) = [-0.9686, 1.47, -4.027]; %head

    skel.jointarray(3:3, :) = [-0.3827, 0.7516, -1.867]; %neck

    skel.jointarray(4:4, :) = [0.7976, -2.26, -1.918]; %right elbow

    skel.jointarray(5:5, :) = [0.7634, -4.014, -1.924]; %right wrist

    skel.jointarray(6:6, :) = [-1.475, -2.283, -0.7298]; %left elbow

    skel.jointarray(7:7, :) = [-1.572, -4.07, -1.009]; %left wrist

    skel.jointarray(8:8, :) = [-0.2469, -1.633, 2.568]; %left knee

    skel.jointarray(9:9, :) = [-0.4612, -3.668, 3.159]; %left foot 

    skel.jointarray(10:10, :) = [1.621, -2.24, 3.748]; %right knee

    skel.jointarray(11:11, :) = [1.535, -2.551, 2.459]; %right foot

    skel.jointarray(12:12, :) = [0.6608, 1.401, 3.895]; %pelvis

    skel.jointarray(13:13, :) = [1.036, -1.967, 5.868]; %tail end

    

    %repeat

    

    

end

