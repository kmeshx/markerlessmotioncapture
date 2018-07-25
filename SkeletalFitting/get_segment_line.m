function [A, dir, B] = get_segment_line(points)


    % Step 2: find the mean of the points

    avg = mean(points, 1);

    % Step 3: subtract the mean from all points

    subtracted = bsxfun(@minus, points, avg);

    % Step 4 : perform SVD

    [~, ~, V] = svd(subtracted);

    % Step 5: find the direction vector

    %        (which is the right singular vector corresponding to the largest singular value)

    direction = V(:, 1);
    %disp('direction: '); disp(direction);
    % Line is 'avg' and 'direction'

   % p0 = avg;
    %d = direction;
    
    n = size(points, 1);
    maxdb = 0; maxdf = 0; pb = avg; pf = avg;
    for i = 1:n
        curpt = points(i:i, :);
        curd = norm(curpt - avg);
        cursign = dot(curpt - avg, direction);
        if cursign < 0 && curd > maxdb
            maxdb = curd; pb = curpt;
        elseif cursign >= 0 && curd > maxdf
            maxdf = curd; pf = curpt;
        else
            continue;
        end
    end
            %disp('avg: '); disp(avg);
            %disp('direction/norm(direction): '); disp(direction/norm(direction));
            %disp('maxdb'); disp(maxdb);
    A = avg - ((direction/norm(direction))')*maxdb; %disp('A:'); disp(A);
    %A = avg;
    B = avg + ((direction/norm(direction))')*maxdf; %disp('B: '); disp(B);
    dir = direction';
    %pinpt = A; enpt = B;
    %figure, hold on; 
    %plot3(points(:, 1:1), points(:, 2:2), points(:, 3:3), 'g*');
    %plot3([pinpt(1); enpt(1)], [pinpt(2); enpt(2)], [pinpt(3); enpt(3)]);
    %quiver3(A(1), A(2), A(3), dir(1), dir(2), dir(3));

    % Parametric equation: P = p0 + t*d
end