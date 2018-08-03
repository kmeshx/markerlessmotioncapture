function [new_image] = remove_shadow_from_binary(I, thresh)
%I is the skeleton of binary cheetah silhouette
    numrows = size(I, 1);
 %   numcols = size(I, 2);
  %  leftref = [numrows, 0];
  %  rightref = [numrows, numcols];
    new_image = I;
    [wrow, wcol] = find(I == 1);
    X = wcol; Y = numrows - wrow;
   % leftref = [leftref(2), numrows - leftref(1)];
  %  rightref = [rightref(2), numrows - rightref(1)];
    
    n = size(wcol, 1);
    %{
    rpt = [0, 0]; lpt = [0, 0];
    d1 = 10000000; d2 = 10000000;
    for i = 1:n
        curpt = [X(i), Y(i)];
        dr = get_norm2(curpt - rightref);
        dl = get_norm2(curpt - leftref);
        if dr < d1
            d1 = dr;
            rpt = curpt;
        end
        if dl < d2
            d2 = dl;
            lpt = curpt;
        end
        
    end
    %}
   % shadow_slope = (lpt(2) - rpt(2))/(lpt(1) - rpt(1));
   % c = lpt(2) - shadow_slope*lpt(1);
   % pp = [shadow_slope, c];
    lowesty = min(Y);
    for j = 1:n
        
        vert = [X(j), Y(j)]; %disp(vert);
        %f = find_closest_on_line(vert, pp);
        %disp(f);
        curd = get_norm2(vert - [vert(1), lowesty]);
        %curd = get_norm2(f - vert);
        %curd1 = get_norm2(vert - lpt);
        %curd2 = get_norm2(vert - rpt);
        %if (curd < min([curd1, curd2]))
        %    curd = min([curd1, curd2]);
        %end
       % disp(curd);
        if curd < thresh
            currow = numrows - Y(j);
            curcol = X(j);
            new_image(currow, curcol) = 0;
        end
    end
    %figure, hold on;
    %plot(X, Y, 'r*');
    %plot(lpt(1), lpt(2), 'b*'); plot(rpt(1), rpt(2), 'g*');
    %hold off;
   % disp('pp'); disp(pp);
   
    
end