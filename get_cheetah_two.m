videoSource = vision.VideoFileReader('CAM1_1.mp4',...
    'ImageColorSpace','Intensity','VideoOutputDataType','uint8');
detector = vision.ForegroundDetector(...
       'NumTrainingFrames', 5, ... 
       'InitialVariance', 30*30);
blob = vision.BlobAnalysis(...
       'CentroidOutputPort', false, 'AreaOutputPort', false, ...
       'BoundingBoxOutputPort', true, ...
       'MinimumBlobAreaSource', 'Property', 'MinimumBlobArea', 250);

shapeInserter = vision.ShapeInserter('BorderColor','White');
videoPlayer = vision.VideoPlayer();
set(videoPlayer, 'Position', [100, 1000, 800, 800]);
while ~isDone(videoSource)
     frame  = videoSource();
     fgMask = detector(frame);
     %bbox   = cheecords(blob(fgMask));
     %bbox = blob(fgMask);
     %bbox is row-wise matrix of all blobs
     %each row has [x, y, width, height]
     %x, y is upper-left corner
     %USE CHEECORD HERE
     %fgMask = blob(fgMask);
     %fgMask = ExtractNLargestBlobs(fgMask, 6);
     se = strel('square', 3);
     filteredForeground = imopen(fgMask, se);
     
     %filteredForeground = bwareaopen(imbinarize(uint32(filteredForeground)), 50);
     %filteredForeground = imfill(imbinarize(uint32(filteredForeground)), 'holes');
     %seer = strel('rectangle',[2 2]);
    
     
     %filteredForeground = imdilate(filteredForeground ,seer); %also imclose
     %filteredForeground = bwlargestblob(filteredForeground, 8);
     %out = filteredForeground;
   %  filteredForeground = medfilt2(filteredForeground);
     %fun = @(x) median(x(:));
     filteredForeground = bwareaopen(imbinarize(uint32(medfilt2(wiener2(wiener2(wiener2(wiener2(wiener2(filteredForeground, [2 2])))))))), 5);%, 'approxcanny');
     filteredForeground = ExtractNLargestBlobs(filteredForeground, 1);
     bbox   = cheecords(blob(filteredForeground));
     out = shapeInserter(filteredForeground, uint32(bbox));
     videoPlayer(out); 
end
release(videoPlayer);
release(videoSource);

