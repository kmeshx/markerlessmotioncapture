function [newmat] = spherical_pruning(pts, radius, density)
    newmat = [];
    n = size(pts, 1);
    
    [curid, dists] = rangesearch(pts, pts, radius);
    %disp
    
    for i = 1:n
        curpt = pts(i:i, :);
        %curid = rangesearch(pts, curpt, radius);
        %idx = curid{1};
        idx = curid{i};
        numpts = size(idx, 2); %confirm 1 or 2
        %disp(numpts);
        if numpts > density
            newmat = [newmat; curpt];
        end
    end
    
    
end