function visualizeCones(img_arr, cV, n)
    %img_arr is array of binarized boundary images
    A_arr = [];
    B_arr = []; C_arr = [];
    colarr = ['r', 'g', 'b', 'm', 'c', 'y'];
    for k = 1:n
        curclr = colarr(k);
        cur_img = img_arr(:, :, k);
        [vs, us] = find(cur_img == 1);
        %imcols = size(cur_img, 2);
        
        %vs = imcols - vs;
        
        disp('us'); disp(us);
       
        m = size(us, 1);
        for i = 1:m
            
            cur_u = us(i); cur_v = vs(i);
            norm_x = (cur_u - cV(k).u0 ) / cV(k).efl;
            norm_y = (cur_v - cV(k).v0) / cV(k).efl;
            %Now you know where the point is on the camera's z=1 plane;
            %Let's say you want a ray from the camera centre to z = 50mm: 
            %That means you want a line thru A = [0;0;0] and B = 50 * [x;y;1]
            %You need to do this in the world reference frame so to convert to 
            %the world reference frame you use the 4x4 pose matrix associated 
            %with the camera
            
            A = [0; 0; 0]; B = [norm_x; norm_y; 1];
            Aw = inv( cV(k).pose ) * [A;1]; %augmented with a  one so that we can easily use a 4x4 matrix to trasform between reference frames
            Bw = inv( cV(k).pose ) * [B;1]; %augmented with a  one so that we can easily use a 4x4 matrix to trasform between reference frames
            
            A_arr = [A_arr; Aw'];
            B_arr = [B_arr; Bw'];
            C_arr = [C_arr; curclr];
            
        end
        
        
        
    end
    
    get_lines(A_arr, B_arr, C_arr);
end