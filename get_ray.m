function [xss, yss] = get_ray(selx, sely, int1, int2, exts1, exts2)

    xs = []; xss = [];
    ys = []; yss = [];
   % fx = sp.CameraParameters.CameraParameters1.FocalLength(1);
   % fy = sp.CameraParameters.CameraParameters1.FocalLength(2);
    
    norm_x = (sely - int1(2) ) / int1(1);
    norm_y = (selx - int1(3) ) / int1(1);
            
    A = [0; 0; 0]; B = [norm_x; norm_y; 1]; %or z = 50 => 50*[x; y; 1]
    Aw = inv( exts1 ) * [A;1]; %augmented with a  one so that we can easily use a 4x4 matrix to trasform between reference frames
    Bw = inv( exts1 ) * [B;1]; %augmented with a  one so that we can easily use a 4x4 matrix to trasform between reference frames
    
    slope(1) = Bw(1) - Aw(1); slope(2) = Bw(2) - Aw(2); slope(3) = Bw(3) - Aw(3);
    
    t = 0:1;
    ptsx = Aw(1) + slope(1)*t;
    ptsy = Aw(2) + slope(2)*t;
    ptsz = Aw(3) + slope(3)*t;
    
    ptsx = ptsx'; ptsy = ptsy'; ptsz = ptsz';
        
    ptsize = size(ptsx, 1);
    
    for i = 1:ptsize
        curpt = [ptsx(i); ptsy(i); ptsz(i); 1];
        newpt = exts2*curpt;
        curz = newpt(3);
        newbx = newpt(1)/curz; 
        newby = newpt(2)/curz;
        imgy = newbx*int2(1) + int2(2);  imgx = newby*int2(1) + int2(3);
        xs = [xs; imgx]; ys = [ys; imgy];
        
    end
    
    xss = 0:50:1920;
    slope2d = (ys(2) - ys(1))/(xs(2) - xs(1));
    yss = ys(1) + (xss - xs(1))*slope2d;
    %{
    cam_ray = [camx; camy; camz];
    
    world_ray = exts1\cam_ray;
    
    wor2cam2 = exts2*[0; 0; 0; 1];
    wpt2cam2 = exts2*[world_ray; 1];
    pc2 = int2*[wor2cam2(1); wor2cam2(2); wor2cam2(3)];
    qc2 = int2*[wpt2cam2(1); wpt2cam2(2); wpt2cam2(3)];
    
    rayp1 = [pc2(1); pc2(2)] ;
    rayp2 = [qc2(1); qc2(2)] ;
    %}
    
    
    
end