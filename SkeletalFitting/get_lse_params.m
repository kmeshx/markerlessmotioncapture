function [retskel] = get_lse_params(skel, verts)

    n = skel.numsegs;
    v = size(verts, 1);
    skeldivide = cell(1, n);
    for i = 1:v
        curv = verts(i:i, :);
        curclosest = closest_seg3(curv, skel);
       % if i > size(skeldivide, 2)
        %    skeldivide{1, curclosest} = curv;
        %else
         skeldivide{curclosest} = [skeldivide{curclosest}; curv];
        
    end
    disp('sd'); disp(size(skeldivide));
    
    figure, hold on;
    for k = 1:12
        curpts = skeldivide{k};
        %disp('cp'); %disp(curpts);
        if rem(k, 2) == 0
            plot3(curpts(:, 1:1), curpts(:, 2:2), curpts(:, 3:3), 'g*');
        else
            plot3(curpts(:, 1:1), curpts(:, 2:2), curpts(:, 3:3), 'b*');
        end
    end
    
    %TRUNK-HEAD
    [Ath, dirth, Bth] = get_segment_line(skeldivide{1});
    
    skel.jointarray(1:1, :) = Ath;
    
    %HEAD-NECK
    [Ahn, dirhn, Bhn] = get_segment_line(skeldivide{2});
    [Ahn, Bhn] = orient(Ahn, Bhn, skel.jointarray(1:1, :));
    [poi_th_hn] = line_segment_int([Ath; Ahn], [dirth; dirhn], [Bth; Bhn]);
    skel.jointarray(2:2, :) = poi_th_hn;
    line3(skel.jointarray(1:1, :), skel.jointarray(2:2, :));
    
    %NECK-PELVIS
    
    [Anp, dirnp, Bnp] = get_segment_line(skeldivide{11});
    [Anp, Bnp] = orient(Anp, Bnp, skel.jointarray(2:2, :));
    [poi_hn_np] = line_segment_int([poi_th_hn; Anp], [(Bhn-poi_th_hn); dirnp], [Bhn; Bnp]);
    skel.jointarray(3:3, :) = poi_hn_np;
    line3(skel.jointarray(2:2, :), skel.jointarray(3:3, :));
    
    %PELVIS-TAIL
    
    [Apt, dirpt, Bpt] = get_segment_line(skeldivide{12});
    [Apt, Bpt] = orient(Apt, Bpt, skel.jointarray(3:3, :));
    [poi_np_pt] = line_segment_int([poi_hn_np; Apt], [(Bnp-poi_hn_np); dirpt], [Bnp; Bpt]);
    skel.jointarray(12:12, :) = poi_np_pt;
    skel.jointarray(13:13, :) = Bpt;
    line3(skel.jointarray(12:12, :), skel.jointarray(13:13, :));
    line3(skel.jointarray(3:3, :), skel.jointarray(12:12, :));
    %NECK-RIGHT-ELBOW
    
    [Are, dirre, Bre] = get_segment_line(skeldivide{3});
    [Are, Bre] = orient(Are, Bre, skel.jointarray(3:3, :));
    [poi_np_nre] = line_segment_int([poi_hn_np; Are], [(poi_np_pt - poi_hn_np); dirre], [poi_np_pt; Bre]);
    
     
     
    %RIGHT-ELBOW-WRIST
    [Arw, dirrw, Brw] = get_segment_line(skeldivide{4});
    [Arw, Brw] = orient(Arw, Brw, skel.jointarray(3:3, :));
    [poi_nre_nrw] = line_segment_int([poi_np_nre; Arw], [(Bre-poi_np_nre); dirrw], [Bre; Brw]);
    skel.jointarray(4:4, :) = poi_nre_nrw;
    skel.jointarray(5:5, :) = Brw;
    
    line3(skel.jointarray(3:3, :), skel.jointarray(4:4, :));
    line3(skel.jointarray(4:4, :), skel.jointarray(5:5, :));
    
    
    %NECK-LEFT-ELBOW
    
    [Ale, dirle, Ble] = get_segment_line(skeldivide{5});
    [Ale, Ble] = orient(Ale, Ble, skel.jointarray(3:3, :));
    [poi_np_nle] = line_segment_int([poi_hn_np; Ale], [(poi_np_pt - poi_hn_np); dirle], [poi_np_pt; Ble]);
    
    %LEFT-ELBOW-WRIST
    [Alw, dirlw, Blw] = get_segment_line(skeldivide{6});
    [Alw, Blw] = orient(Alw, Blw, skel.jointarray(3:3, :));
    [poi_nle_nlw] = line_segment_int([poi_np_nle; Alw], [(Ble-poi_np_nle); dirlw], [Ble; Blw]);
    skel.jointarray(6:6, :) = poi_nle_nlw;
    skel.jointarray(7:7, :) = Blw;
    
    line3(skel.jointarray(3:3, :), skel.jointarray(6:6, :));
    line3(skel.jointarray(6:6, :), skel.jointarray(7:7, :));
    
    
    %PELVIS-RIGHT-KNEE
    
    [Ark, dirrk, Brk] = get_segment_line(skeldivide{9});
    
    [Ark, Brk] = orient(Alw, Blw, skel.jointarray(12:12, :));
    [poi_np_prk] = line_segment_int([poi_hn_np; Ark], [(poi_np_pt - poi_hn_np); dirrk], [poi_np_pt; Brk]);
    
    %RIGHT-KNEE-FOOT
    [Arf, dirrf, Brf] = get_segment_line(skeldivide{10});
    
    [Arf, Brf] = orient(Arf, Brf, skel.jointarray(12:12, :));
    [poi_prk_rkrf] = line_segment_int([poi_np_prk; Arf], [(Brk-poi_np_prk); dirrf], [Brk; Brf]);
    skel.jointarray(10:10, :) = poi_prk_rkrf;
    skel.jointarray(11:11, :) = Brf;
    
    line3(skel.jointarray(12:12, :), skel.jointarray(10:10, :));
    line3(skel.jointarray(10:10, :), skel.jointarray(11:11, :));
    
    
    
    
    %PELVIS-LEFT-KNEE
    
    [Alk, dirlk, Blk] = get_segment_line(skeldivide{7});
    
    [Alk, Blk] = orient(Alk, Blk, skel.jointarray(12:12, :));
    [poi_np_plk] = line_segment_int([poi_hn_np; Alk], [(poi_np_pt - poi_hn_np); dirlk], [poi_np_pt; Blk]);
    
    %LEFT-KNEE-FOOT
    [Alf, dirlf, Blf] = get_segment_line(skeldivide{8});
    
    [Alf, Blf] = orient(Alf, Blf, skel.jointarray(12:12, :));
    [poi_plk_lklf] = line_segment_int([poi_np_plk; Alf], [(Blk-poi_np_plk); dirlf], [Blk; Blf]);
    skel.jointarray(8:8, :) = poi_plk_lklf;
    skel.jointarray(9:9, :) = Blf;
    
    line3(skel.jointarray(12:12, :), skel.jointarray(8:8, :));
    line3(skel.jointarray(8:8, :), skel.jointarray(9:9, :));
    
    
    skel.segpts = skeldivide;
    retskel = skel;
end
