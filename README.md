# markerlessmotioncapture


Background Subtraction: Run getbbox.m (replace filename at the top with intended video to use it on)

3D Medial Axis Transform: Run the file ‘find_comp_ma.m’ with the 3D points mesh as input to get its medial axis

Calibration Functions: Use visualizeCones.m to get corresponding visual cones to images from multiple views. Use ‘extrinsics_from_chain_calib.m’ to perform chain calibration method on pairwise calibration of cameras.

3D points from 2D:
Use multi view_intersect.m to get 3D point corresponding to set of 2D points, focal length of camera, pixel size (Note: can modify code to take in multiple points, different focal lengths etc.)
(code by Bashar S. Alsadik )

Skeletal Fitting:
The structure used throughout this part of a pipeline is a nested map container in MATLAB.
An outer map contains all limb names corresponding to inner maps that have the coordinates of start points, end points, the name of the previous body segment it was connected to, and the fixed length of the current segment.
The file named ’cost_func.m’ contains the cost function to be minimized; it looks like tweaking the cost function should lead us towards the results we want. 
The file optim_main is the file to be run.
Replace initial image name with intended image to use and input the initial skeletal points in place of variable named ‘ij’ and initial upper left points of corresponding rectangle in the variable named ‘rps’.

Visual Hull: Run get_visual_hull; argument description given (code by Keith Forbes)
