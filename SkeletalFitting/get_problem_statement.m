function [problem_object, pts, skel] = get_problem_statement(I, init_skel, theta_flag)
    %init_skel let it be map as before
    %eps has fixed endpoints
    %I is image name
    %if theta_flag true, need to initialize thetas
    I = imread(I);
    %I = rgb2gray(I);
    I = imbinarize(I);
    irows = size(I, 1); %icols = size(I, 2);
    [row, col] = find(I == 1);
    X = col; Y = irows - row;
    pts = [X, Y];
    n = size(pts, 1);
    
    O = init_skel.segorder;
    numsegs = init_skel.numsegs; %might be wrong name
    %thetas = init_skel.thetas; %in degrees, first loop below for initializing thetas the first time, after this just the thetas obtained from last iteration
    %thetamap = init_skel.thetamap;
    M = init_skel.segmap;
    thetaSet = double(zeros(17, 1)); %MAGNUM 
    %thetaNames = O;
    if theta_flag
        for i = 2:numsegs %not taking headneck
            curseg = O{i};
            
            curmap = M(curseg);
            prevseg = curmap('prevname');
            prevmap = M(prevseg);
            v2 = [curmap('curfx') - curmap('curbx'), curmap('curfy') - curmap('curby')];
            v1 = [prevmap('curfx') - prevmap('curbx'), prevmap('curfy') - prevmap('curby')];
            x1 = v1(1); x2 = v2(1); y1 = v1(2); y2 = v2(2);
            %curtheta = atan2d(x1*y2-y1*x2,x1*x2+y1*y2);
            
            th1 = atand(y1/x1); th2 = atand(y2/x2);
            if th1 > 0 && y1 < 0 && x1 < 0
                th1 = 180 + th1;
            
            elseif th1 > 0 && y1 > 0 && x1 > 0
                th1 = th1;
            elseif th1 < 0 && y1 > 0 && x1 < 0
                th1 = 180 + th1;
            elseif th1 < 0 && y1 < 0 && x1 > 0
                th1 = 360 + th1;
            elseif x1==0 && y1 < 0
                th1= 270;
            elseif x1 ==0 && y1 > 0
                th1 = th1;
            elseif y1 == 0 && x1 > 0
                th1 = 0;
            elseif y1 ==0 && x1 < 0
                th1 = 180;
            else
                th1 = th1;
            end
            th11 = th1;
            th1 = th2;
            x1 = x2; y1 = y2;
            if th1 > 0 && y1 < 0 && x1 < 0
                th1 = 180 + th1;
            
            elseif th1 > 0 && y1 > 0 && x1 > 0
                th1 = th1;
            elseif th1 < 0 && y1 > 0 && x1 < 0
                th1 = 180 + th1;
            elseif th1 < 0 && y1 < 0 && x1 > 0
                th1 = 360 + th1;
            elseif x1==0 && y1 < 0
                th1= 270;
            elseif x1 ==0 && y1 > 0
                th1 = th1;
            elseif y1 == 0 && x1 > 0
                th1 = 0;
            elseif y1 ==0 && x1 < 0
                th1 = 180;
            else
                th1 = th1;
            end
            
            th22 = th1;
            curtheta = th22 - th11;
            
            %curtheta = atan2d(x1*y2-y1*x2,x1*x2+y1*y2);
            
            %if curtheta < 0
             %   curtheta = 360 + curtheta;
           % end
            
            thetaSet(i - 1) = curtheta; %check indexing, -1 IS MAGIC NUM
            
            
        end
        
        init_skel.thetas = thetaSet;
    end
    
    disp('thetas'); disp(thetaSet);
    show_oskel(init_skel.thetas, pts, init_skel);
   % curmap = mm('headneck');
    
    %GET X0 AND WRITE COST FUNCTION SEPARATELY
    %FORM THE INEQUALITY FUNCTION
    %cost func parameters include pts, eps, variable thetas
    %cost_func(thetas, pts, eps);
    
    %inequality matrix A
    ts = init_skel.thetas;
    tnum = size(ts, 1);
    
    A1 = zeros(tnum, tnum);
    A1(:, 1:1) = ones(tnum, 1);
    %A1(:, (tnum+1):(tnum + 1)) = -ts;
    
    A2 = zeros(tnum, tnum);
    A2(:, 1:1) = (-1)*(ones(tnum, 1));
    %A2(:, (tnum+1):(tnum + 1)) = ts;
    
    deltas = [30; 30; 30; 
        30; 30; 30
        30; 30; 30;
        30; 30; 30;
        30; 30; 30;
        30; 60]; %17
    
    b1 = ts + deltas;
    b2 = deltas - ts;
    A = [A1; A2]; b = [b1; b2];
    skel = init_skel;
   % disp(size(A)); disp(size(b1)); disp(size(b2));
   
   % eee = cost_func(init_skel.thetas, pts, eps, skel); disp(eee);
    
    %ff = @(x)cost_func(x, pts, skel);
    %problem_object = createOptimProblem('fmincon', 'Aineq', A, 'bineq', b, 'objective', ff, 'x0', init_skel.thetas);
    %optionsm = optimoptions(@fmincon, 'MaxFunctionEvaluations', 100, 'StepTolerance', 10^(-6));
    %problem_object = createOptimProblem('fmincon', 'objective', ff, 'x0', init_skel.thetas , 'options', optionsm);
    problem_object = init_skel.thetas;
    
    
end