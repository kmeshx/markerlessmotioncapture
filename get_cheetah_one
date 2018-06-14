%// read the video:
reader = VideoReader('CAM8.mp4');
%initf = [];
%cc = 0;
vid = {};
while hasFrame(reader)
    %{
    cc = cc + 1;
    if cc == 1
        initf = im2single(readFrame(reader));
    else
        initf = initf + im2single(readFrame(reader));
    end
    %}
    vid{end+1} = im2single(readFrame(reader));
    
end
%// simple background estimation using mean:
bg = mean( cat(4, vid{:}), 4 );
%// estimate foreground as deviation from estimated background:
%bg = initf ./ cc;
%fg = sum( abs( vid{fIdx} - bg ), 3 ) > 0.25;

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

n = size(vid, 2);
for c = 1:n
    %fg = readFrame(reader);
    %newimg = imsubtract(fg, bg);
    %newimg = fg > bg;
    newimg = sum( abs( vid{c} - bg ), 3 ) > 0.25;
   % newimg = detector(uint8(newimg));
    
    %newimg = sum( abs( vid{c} - bg ), 3 ) > 0.25;
    se = strel('square', 3);
    filteredForeground = imopen(newimg, se);
    %seer = strel('rectangle',[2 2]);
     
     %filteredForeground = imdilate(filteredForeground ,seer); %also imclose
     %filteredForeground = bwlargestblob(filteredForeground, 8);
     %out = filteredForeground;
     %filteredForeground = medfilt2(filteredForeground);
     
    filteredForeground = bwareaopen(imbinarize(uint32(medfilt2(wiener2(wiener2(wiener2(wiener2(wiener2(filteredForeground, [2 2])))))))), 5);%, 'approxcanny');
    %filteredForeground = bwlargestblob(filteredForeground, 8);
    %out = shapeInserter(filteredForeground, uint32(bbox));
	%filteredForeground = bwareafilt(filteredForeground,[9 9]);
    %filteredForeground = imcomplement(imerode(imcomplement(filteredForeground), se));
    filteredForeground = ExtractNLargestBlobs(filteredForeground, 1);
    bbox = cheecords(blob(filteredForeground));
    filteredForeground = shapeInserter(filteredForeground, uint32(bbox));
    videoPlayer(filteredForeground); 
		%out this

    
end

release(videoPlayer);
%release(reader);
