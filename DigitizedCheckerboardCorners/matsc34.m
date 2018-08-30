% Auto-generated by stereoCalibrator app on 28-Jun-2018
%-------------------------------------------------------


% Define images to process
imageFileNames1 = {'/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img112.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img114.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img120.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img126.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img127.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img128.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img129.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img131.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img132.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img133.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img136.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img137.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img140.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img142.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img173.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img174.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img92.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img93.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img94.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img95.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img96.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img97.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img98.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM3frames/img99.png',...
    };
imageFileNames2 = {'/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img112.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img114.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img120.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img126.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img127.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img128.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img129.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img131.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img132.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img133.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img136.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img137.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img140.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img142.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img173.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img174.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img92.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img93.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img94.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img95.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img96.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img97.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img98.png',...
    '/Users/kushamaharshi/Desktop/mmc/Top Set/CAM4frames/img99.png',...
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