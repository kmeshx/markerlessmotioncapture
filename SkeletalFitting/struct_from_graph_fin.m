function [skel] = struct_from_graph_fin(init, pts, I, tr)
    ipts = bwskel(I);
    M = init.segmap;
    n = init.numsegs;
    O = init.segorder; %O is 1xn type array with strings
    %L = init.lengths;
    assert(size(O, 2) == n);
    psize = size(pts, 1);
    %init has segdivs
    for i = 1:psize
        cp = pts(i, :);
        
        seg = closest_seg_new(cp, init);
        init.segdivs{seg} = [init.segdivs{seg}; cp];
        
    end
    
   % figure, hold on;
    for j = 1:n
        
        curseg = O{j};
        cursegmap = M(curseg);
        curpts = init.segdivs{j};
       % disp('segnum'); disp(j);
       % disp('curpts'); disp(curpts);
        ss = size(curpts, 1);
        if ss < 10 %MAGIC NUMBER HERE
            init = redistribute(init, j, pts, 25); %AND HERE
            curpts = init.segdivs{j};
        end
        %disp('segdivs'); disp(init.segdivs);
        
        [s, e, s2, e2] = get_medial_line_new(curpts);
        
        
        if strcmp(curseg, 'headneck')
            [s, e] = orient_head(s, e, ipts, tr);
            %plot([s(1); e(1)], [s(2); e(2)], 'b', 'LineWidth', 3);
            %hold off;
            cursegmap('curfx') = s(1);
            cursegmap('curfy') = s(2);
            cursegmap('curbx') = e(1);
            cursegmap('curby') = e(2);
            M(curseg) = cursegmap;
        else
            prevseg = cursegmap('prevname');
            prevsegmap = M(prevseg);
            refpt = [prevsegmap('curbx'), prevsegmap('curby')];
            [s, e] = reorient2(s, e, s2, e2, refpt);
           % plot([s(1); e(1)], [s(2); e(2)], 'b', 'LineWidth', 3); %hold off;
            cursegmap('curfx') = s(1);
            cursegmap('curfy') = s(2);
            cursegmap('curbx') = e(1);
            cursegmap('curby') = e(2);
            M(curseg) = cursegmap;
            
        end
        
        
    end
    hold off;
    
    for q = 1:30
        M = init.segmap;
        for k = 1:n
            curseg = O{k};
            cursegmap = M(curseg);


            if strcmp(curseg, 'headneck')
                continue;
            else
                prevseg = cursegmap('prevname');
                prevsegmap = M(prevseg);
                curlength = cursegmap('len');
                %prevlength = prevsegmap('len');

                offindend = [prevsegmap('curbx'), prevsegmap('curby')];
                tousecurstart = [cursegmap('curfx'), cursegmap('curfy')];

                middir = [(offindend(1) + tousecurstart(1))/2,(offindend(2) + tousecurstart(2))/2];

                %initpoint = [prevsegmap('curfx'), prevsegmap('curfy')];
                initpoint = [cursegmap('curbx'), cursegmap('curby')];

                netunitdir = (middir - initpoint)/get_norm2(middir - initpoint);

                finalpoint = netunitdir*curlength + initpoint;

                %prevsegmap('curbx') = finalpoint(1); prevsegmap('curby') = finalpoint(2);
                cursegmap('curfx') = finalpoint(1); cursegmap('curfy') = finalpoint(2);
                %M(prevseg) = prevsegmap;
                M(curseg) = cursegmap;
            end

        end
        init.segmap = M;
    end
    
    skel = init;


end