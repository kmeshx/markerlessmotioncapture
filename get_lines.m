function get_lines(As, Bs, Cs)
    
    %hold on;
    %disp('As');
    %disp(As);
    %colarr = ['r', 'g', 'b', 'm', 'c', 'y'];
    n = size(As, 1);
    px = []; py = []; pz = [];
    vx = []; vy = []; vz = [];
    for i = 1:n
        A = As(i:i, :); B = Bs(i:i, :);
        slope = B - A;
        t = 0:20:3000;
        ptsx = A(1) + slope(1)*t;
        ptsy = A(2) + slope(2)*t;
        ptsz = A(3) + slope(3)*t;
        %px = [px; A(1)];
       % py = [py; A(2)];
       % pz = [pz; A(3)];
        %color = colarr(i);
        
        clr = Cs(i);
        plot3(ptsx, ptsy, ptsz, 'Color', clr);
        
       % vx = [vx; slope(1)];
        %vy = [vy; slope(2)];
       % vz = [vz; slope(3)];
        
    end
    
    %quiver3(px, py, pz, vx, vy, vz);
        
    %{    
    xlim = get(gca,'XLim');
        m = (B(2)-B(1))/(A(2)-A(1));
        n = B(2)*m - A(2);
        y1 = m*xlim(1) + n;
        y2 = m*xlim(2) + n;
        hold on
        line([xlim(1) xlim(2)],[y1 y2])
        hold off
    %}
    hold off;
    
end