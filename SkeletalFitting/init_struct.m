function [skel] = init_struct()

    skel.numsegs = 12;
    
    skel.segarray(1:1, :) = [1, 2, 3, 4];
    %has x1, y1, x2, y2 coords of a seg, repeat
    skel.segarray(2:2, :) = [1, 2, 3, 4];
    skel.segarray(3:3, :) = [1, 2, 3, 4];
    skel.segarray(4:4, :) = [1, 2, 3, 4];
    skel.segarray(5:5, :) = [1, 2, 3, 4];
    skel.segarray(6:6, :) = [1, 2, 3, 4];
    skel.segarray(7:7, :) = [1, 2, 3, 4];
    skel.segarray(8:8, :) = [1, 2, 3, 4];
    skel.segarray(9:9, :) = [1, 2, 3, 4];
    skel.segarray(10:10, :) = [1, 2, 3, 4];
    skel.segarray(11:11, :) = [1, 2, 3, 4];
    skel.segarray(12:12, :) = [1, 2, 3, 4];
    skel.segarray(13:13, :) = [1, 2, 3, 4];
    
    %segment order:
    %1 - head-neck
    %2 - torso
    %3 - shoulder-elbow1
    %4 - shoulder-elbow2
    %5 - elbow-wrist1
    %6 - elbow-wrist2
    %7 - hip-knee1
    %8 - hip-knee2
    %9 - knee-foot1
    %10- knee-foot2
    %11 - tailfirst
    %12 - tailsecond
    
    skel.numjoints = 13;
    
    skel.joint_array(1:1, :) = [1, 2]; %repeat
    
    
end