% Auto-generated by stereoCalibrator app on 29-Jun-2018
%-------------------------------------------------------


% Define images to process
imageFileNames1 = {'/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img175.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img193.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img195.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img196.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img197.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img211.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img214.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img215.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img216.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img217.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img218.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img219.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img220.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img221.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img222.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img223.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img224.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img225.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img226.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img227.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img228.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img229.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img230.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img231.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img232.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img233.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img234.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img235.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img237.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img238.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img239.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img241.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img242.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img243.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img244.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img246.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img35.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM5frames/img36.png',...
    };
imageFileNames2 = {'/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img175.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img193.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img195.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img196.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img197.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img211.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img214.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img215.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img216.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img217.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img218.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img219.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img220.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img221.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img222.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img223.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img224.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img225.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img226.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img227.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img228.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img229.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img230.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img231.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img232.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img233.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img234.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img235.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img237.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img238.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img239.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img241.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img242.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img243.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img244.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img246.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img35.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM6frames/img36.png',...
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
