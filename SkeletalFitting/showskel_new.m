function showskel_new(skel)
    figure, hold on;
    n = skel.numsegs;
    L = skel.segorder;
    M = skel.segmap;
    figure, hold on;
    colarr = {'r*', 'g*', 'y*', 'c*', 'm*', 'r+', 'g+', 'y+', 'c+', 'm+', 'ro', 'go', 'yo', 'co', 'mo', 'r--', 'g--', 'y--'};
%    assert(size(colarr, 2) == skel.numsegs);
    for i = 1:n
        curseg = L{i};
        cursegmap = M(curseg);
        s(1) = cursegmap('curfx');
        s(2) = cursegmap('curfy');
        e(1) = cursegmap('curbx');
        e(2) = cursegmap('curby');
        curpts = skel.segdivs{i};
        curclr = colarr{i};
        plot(curpts(:, 1), curpts(:, 2), curclr);
        plot([s(1); e(1)], [s(2), e(2)], 'b', 'LineWidth', 3);
    end
    hold off;
end