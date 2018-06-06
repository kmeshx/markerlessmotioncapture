function [message] = combine_videos(vidnames_array)
    %number of rows in array is number of videos
    
    n = size(vidnames_array, 1);
    sources_arr = [];
    
    for i = 1:n
        videoSource = vision.VideoFileReader(vidnames_arr(i:i, 1:1),...
        'ImageColorSpace','Intensity','VideoOutputDataType','uint8');
    
        sources_arr = [sources_arr; videoSource];
    end
    
        
    %videoSource = vision.VideoFileReader('CAM8.mp4',...
        %'ImageColorSpace','Intensity','VideoOutputDataType','uint8');

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
    %frame_arr = [];
    while (~isDone(sources_arr)) %write isAllDone
         %frame_arr  = videoSource();
         forvh = [];
         %setting array of current frames
         for j = 1:n
            %frame_arr = [frame_arr; cur_frame];
            cur_source = sources_arr(j:j, 1:1);
            cur_frame = step(cur_source);
            cur_fgMask = detector(cur_frame);
            cur_bbox = cheecords(blob(fgMask));
            se = strel('square', 3);
            filteredForeground = imopen(fgMask, se);
            seer = strel('rectangle',[2 2]);
            filteredForeground = bwareaopen(imbinarize(uint32(medfilt2(wiener2(wiener2(wiener2(wiener2(wiener2(filteredForeground, [2 2])))))))), 5);%, 'approxcanny');
            forvh = [forvh; [filteredForeground, cur_bbox];

         end
         cur_vh = get_visual_hull(forvh);
         cur_thinned = thinner_three_d(cur_vh);
         %cur_skelstruct = get_skel(cur_thinned);
         projected = get_projection(cur_skelstruct);
         %display_frame = mark_projected(projected, base_img);
         display_frame = projected;

        %TO WRITE:::
        %get_skel, mark_projected

         %fgMask = detector(frame); IMP
         %bbox   = cheecords(blob(fgMask)); IMP

         %bbox = blob(fgMask);
         %bbox is row-wise matrix of all blobs
         %each row has [x, y, width, height]
         %x, y is upper-left corner
         %USE CHEECORD HERE
         %se = strel('square', 3); IMP
         %filteredForeground = imopen(fgMask, se); IMP

         %filteredForeground = bwareaopen(imbinarize(uint32(filteredForeground)), 50);
         %filteredForeground = imfill(imbinarize(uint32(filteredForeground)), 'holes');

         %seer = strel('rectangle',[2 2]); IMP

         %filteredForeground = imdilate(filteredForeground ,seer); %also imclose
         %filteredForeground = bwlargestblob(filteredForeground, 8);
         %out = filteredForeground;
       %  filteredForeground = medfilt2(filteredForeground);
         %fun = @(x) median(x(:));
         %filteredForeground = bwareaopen(imbinarize(uint32(medfilt2(wiener2(wiener2(wiener2(wiener2(wiener2(filteredForeground, [2 2])))))))), 5);%, 'approxcanny'); IMP
         
         %REMED
         %out = shapeInserter(filteredForeground, uint32(bbox));
         videoPlayer(display_frame);
    end
    release(videoPlayer);
    release(videoSource);
end
