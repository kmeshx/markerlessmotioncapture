function [new_skel] = inited_skel(skel)
    %when only headneck is fixed
    %new_skel = skel;
   % mm = skel.segmap;
   % curmap = mm('headneck');
   % disp('intoinitedskel'); 
   % disp([curmap('curfx'), curmap('curfy'), curmap('curbx'), curmap('curby')]);
    
    O = skel.segorder;
    n = skel.numsegs;
    M = skel.segmap;
    
    for i = 2:n
        curseg = O{i};
        curmap = M(curseg);
        curmap('curfx') = NaN;
        curmap('curfy') = NaN;
        curmap('curbx') = NaN;
        curmap('curby') = NaN;
        M(curseg) = curmap;
        
    end
    new_skel = skel;
    skel.segmap = M;
    
    new_skel.segmap = M;
   % mm = new_skel.segmap;
   % curmap = mm('headneck');
   % disp('frominitedskel'); 
   % disp([curmap('curfx'), curmap('curfy'), curmap('curbx'), curmap('curby')]);
         
end