% Auto-generated by stereoCalibrator app on 29-Jun-2018
%-------------------------------------------------------


% Define images to process
imageFileNames1 = {'/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img129.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img132.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img134.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img135.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img140.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img141.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img142.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img173.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img38.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img40.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img47.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img48.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img49.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img50.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img62.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img65.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img66.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img67.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img68.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img69.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img70.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img71.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img72.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img73.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img74.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img75.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img76.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img77.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img78.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img79.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img80.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img81.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img82.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img83.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img84.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img85.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img86.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img87.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img88.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img89.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img90.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img91.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img92.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM2frames/img93.png',...
    };
imageFileNames2 = {'/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img129.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img132.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img134.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img135.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img140.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img141.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img142.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img173.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img38.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img40.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img47.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img48.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img49.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img50.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img62.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img65.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img66.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img67.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img68.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img69.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img70.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img71.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img72.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img73.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img74.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img75.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img76.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img77.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img78.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img79.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img80.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img81.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img82.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img83.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img84.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img85.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img86.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img87.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img88.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img89.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img90.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img91.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img92.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img93.png',...
    };

% Detect checkerboards in images
[imagePoints, boardSize, imagesUsed] = detectCheckerboardPoints(imageFileNames1, imageFileNames2);

% Generate world coordinates of the checkerboard keypoints
squareSize = 5.500000e+00;  % in units of 'centimeters'
worldPoints = generateCheckerboardPoints(boardSize, squareSize);

% Read one of the images from the first stereo pair
I1 = imread(imageFileNames1{1});
[mrows, ncols, ~] = size(I1);

% Calibrate the camera
[stereoParams, pairsUsed, estimationErrors] = estimateCameraParameters(imagePoints, worldPoints, ...
    'EstimateSkew', false, 'EstimateTangentialDistortion', false, ...
    'NumRadialDistortionCoefficients', 2, 'WorldUnits', 'centimeters', ...
    'InitialIntrinsicMatrix', [], 'InitialRadialDistortion', [], ...
    'ImageSize', [mrows, ncols]);

% View reprojection errors
h1=figure; showReprojectionErrors(stereoParams);

% Visualize pattern locations
h2=figure; showExtrinsics(stereoParams, 'CameraCentric');

% Display parameter estimation errors
displayErrors(estimationErrors, stereoParams);

% You can use the calibration data to rectify stereo images.
I2 = imread(imageFileNames2{1});
[J1, J2] = rectifyStereoImages(I1, I2, stereoParams);

% See additional examples of how to use the calibration data.  At the prompt type:
% showdemo('StereoCalibrationAndSceneReconstructionExample')
% showdemo('DepthEstimationFromStereoVideoExample')
