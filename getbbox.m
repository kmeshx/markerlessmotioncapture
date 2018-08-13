%// read the video:
reader = VideoReader('forsf1.mp4');
%initf = [];
cc = 0;
vid = {};
while hasFrame(reader)
    cc = cc + 1;
    %{
    cc = cc + 1;
    if cc == 1
        initf = im2single(readFrame(reader));
    else
        initf = initf + im2single(readFrame(reader));
    end
    %}
   % vid{end+1} = im2single(imcrop(readFrame(reader), [0, 350, 1920, 370]));
   if rem(cc, 20) == 0 
    vid{end+1} = im2single(readFrame(reader));
   end
end
%// simple background estimation using mean:
bg = mean( cat(4, vid{:}), 4 );
figure, imshow(bg);
disp('done');
imwrite(bg, 'bgcompf.png');

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
vv = VideoWriter('forsf13','Grayscale AVI');
open(vv);

n = size(vid, 2);
for c = 1:n
%%%while hasFrame(reader)
    %fg = readFrame(reader);2
    %newimg = imsubtract(fg, bg);
    %newimg = fg > bg;
    disp(c);
    %figure, imshow(vid{c} - bg);
    newimg = sum( abs( vid{c} - bg ), 3 ) > 0.25;
    
 
    %newimg = detector(uint8(fg));
    
    %newimg = sum( abs( vid{c} - bg ), 3 ) > 0.25;
    se = strel('square', 2);
    filteredForeground = imopen(newimg, se);
    %seer = strel('rectangle',[2 2]);
     
     %filteredForeground = imdilate(filteredForeground ,seer); %also imclose
     %filteredForeground = bwlargestblob(filteredForeground, 8);
     %out = filteredForeground;
     %filteredForeground = medfilt2(filteredForeground);
     
    %filteredForeground = bwareaopen(imbinarize(uint32(medfilt2(wiener2(wiener2(wiener2(wiener2(wiener2(filteredForeground, [2 2])))))))), 5);%, 'approxcanny');
    filteredForeground = bwareaopen(imbinarize(uint32(medfilt2(wiener2(wiener2(wiener2(wiener2(filteredForeground, [2 2]))))))), 5);%, 'approxcanny');
    
    %filteredForeground = bwlargestblob(filteredForeground, 8);
    %out = shapeInserter(filteredForeground, uint32(bbox));
	%filteredForeground = bwareafilt(filteredForeground,[9 9]);
    %filteredForeground = imcomplement(imerode(imcomplement(filteredForeground), se));
    filteredForeground = ExtractNLargestBlobs(filteredForeground, 1);
    
    filteredForeground = bwskel(filteredForeground);
    filteredForeground = remove_shadow_from_binary(filteredForeground, 20);
    writeVideo(vv, uint8(255 * filteredForeground));
    %if (c == 72)
   %     imwrite(filteredForeground, 'c28f.png');
    %    break;
   % end
    
    bbox = cheecords(blob(filteredForeground));
    filteredForeground = shapeInserter(filteredForeground, uint32(bbox));
    %filteredForeground = bwmorph(filteredForeground, 'skel', Inf);
    videoPlayer(filteredForeground); 
		%out this

    
end
close(vv);
release(videoPlayer);
%release(reader);
