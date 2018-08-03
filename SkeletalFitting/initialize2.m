function [skel] = initialize2(init_joints)
    %joint order :-
    %1 - head
    %2 - neck
    %3 - sh
    %4 - le
    %5 - re
    %6 - lh
    %7 - rh
    %8 - lg
    %9 - rg
    %10 - legc
    %11 - lk
    %12 - rk
    %13 - lf
    %14 - rf
    %15 - lt
    %16 - rt
    %17 - hip
    %18 - tail1
    %19 - tail2
    
    %joint order :-
    %1 - head
    %2 - neck
    %3 - sh
    %4 - e
    %
    %5 - lh
    %6 - rh
    %7 - lg
    %8 - rg
    %9 - legc
    %10 - k
    %
    %11 - lf
    %12 - rf
    %13 - lt
    %14 - rt
    %15 - hip
    %16 - tail1
    %17 - tail2
    
   % joints = ['head', 'neck', 'sh', 'le', 're', 'lh', 'rh', 'lg', 'rg', 'legc', 'lk', 'rk', 'lf', 'rf', 'lt', 'rt', 'hip', 'tail'];
    n = size(init_joints, 1);
   % disp([size(init_joints, 1); n]);
  %  assert(size(init_joints, 1) == n);
    
    skel.numjoints = n; skel.numsegs = 16; %MAGIC NUMBER HERE
    skel.segdivs = cell(1, skel.numsegs);
    
    limbSet = {'headneck', 'necksh', 'she', 'elh', 'erh', 'lhlg', 'rhrg', 'legck', 'klf', 'krf', 'lflt', 'rfrt', 'legchip', 'shlegc', 'hiptail1', 'tail1tail2'};
    assert(size(limbSet, 2) == skel.numsegs);
    genericKeySet = {'curfx', 'curfy', 'curbx', 'curby', 'len', 'prevname'};
    mapSet = {};
    
    %1 - headneck
    curfx = init_joints(1, 1); curfy = init_joints(1, 2); curbx = init_joints(2, 1); curby = init_joints(2, 2);
    curvalset = {curfx, curfy, curbx, curby, get_norm2([curfx, curfy] - [curbx, curby]), ''};
    curmap = containers.Map(genericKeySet, curvalset);
    mapSet{1} = curmap;
    
    %2 - necksh
    curfx = init_joints(2, 1); curfy = init_joints(2, 2); curbx = init_joints(3, 1); curby = init_joints(3, 2);
    curvalset = {curfx, curfy, curbx, curby, get_norm2([curfx, curfy] - [curbx, curby]), 'headneck'};
    curmap = containers.Map(genericKeySet, curvalset);
    mapSet{2} = curmap;
    
    %3 - she
    curfx = init_joints(3, 1); curfy = init_joints(3, 2); curbx = init_joints(4, 1); curby = init_joints(4, 2);
    curvalset = {curfx, curfy, curbx, curby, get_norm2([curfx, curfy] - [curbx, curby]), 'necksh'};
    curmap = containers.Map(genericKeySet, curvalset);
    mapSet{3} = curmap;
    
    
    
    %4 - elh
    curfx = init_joints(4, 1); curfy = init_joints(4, 2); curbx = init_joints(5, 1); curby = init_joints(5, 2);
    curvalset = {curfx, curfy, curbx, curby, get_norm2([curfx, curfy] - [curbx, curby]), 'she'};
    curmap = containers.Map(genericKeySet, curvalset);
    mapSet{4} = curmap;
    
    %5 - erh
    curfx = init_joints(4, 1); curfy = init_joints(4, 2); curbx = init_joints(6, 1); curby = init_joints(6, 2);
    curvalset = {curfx, curfy, curbx, curby, get_norm2([curfx, curfy] - [curbx, curby]), 'she'};
    curmap = containers.Map(genericKeySet, curvalset);
    mapSet{5} = curmap;
    
    %6 - lhlg
    curfx = init_joints(5, 1); curfy = init_joints(5, 2); curbx = init_joints(7, 1); curby = init_joints(7, 2);
    curvalset = {curfx, curfy, curbx, curby, get_norm2([curfx, curfy] - [curbx, curby]), 'elh'};
    curmap = containers.Map(genericKeySet, curvalset);
    mapSet{6} = curmap;
    
    %7 - rhrg
    curfx = init_joints(6, 1); curfy = init_joints(6, 2); curbx = init_joints(8, 1); curby = init_joints(8, 2);
    curvalset = {curfx, curfy, curbx, curby, get_norm2([curfx, curfy] - [curbx, curby]), 'erh'};
    curmap = containers.Map(genericKeySet, curvalset);
    mapSet{7} = curmap;
    
    %8 - legck
    curfx = init_joints(9, 1); curfy = init_joints(9, 2); curbx = init_joints(10, 1); curby = init_joints(10, 2);
    curvalset = {curfx, curfy, curbx, curby, get_norm2([curfx, curfy] - [curbx, curby]), 'shlegc'};
    curmap = containers.Map(genericKeySet, curvalset);
    mapSet{8} = curmap;
    
    
    
    %9 - klf
    curfx = init_joints(10, 1); curfy = init_joints(10, 2); curbx = init_joints(11, 1); curby = init_joints(11, 2);
    curvalset = {curfx, curfy, curbx, curby, get_norm2([curfx, curfy] - [curbx, curby]), 'legck'};
    curmap = containers.Map(genericKeySet, curvalset);
    mapSet{9} = curmap;
    
    %10 - krf
    curfx = init_joints(10, 1); curfy = init_joints(10, 2); curbx = init_joints(12, 1); curby = init_joints(12, 2);
    curvalset = {curfx, curfy, curbx, curby, get_norm2([curfx, curfy] - [curbx, curby]), 'legck'};
    curmap = containers.Map(genericKeySet, curvalset);
    mapSet{10} = curmap;
    
    %11 - lflt
    curfx = init_joints(11, 1); curfy = init_joints(11, 2); curbx = init_joints(13, 1); curby = init_joints(13, 2);
    curvalset = {curfx, curfy, curbx, curby, get_norm2([curfx, curfy] - [curbx, curby]), 'klf'};
    curmap = containers.Map(genericKeySet, curvalset);
    mapSet{11} = curmap;
    
    %12 - rfrt
    curfx = init_joints(12, 1); curfy = init_joints(12, 2); curbx = init_joints(14, 1); curby = init_joints(14, 2);
    curvalset = {curfx, curfy, curbx, curby, get_norm2([curfx, curfy] - [curbx, curby]), 'krf'};
    curmap = containers.Map(genericKeySet, curvalset);
    mapSet{12} = curmap;
    
    %13 - legchip
    curfx = init_joints(9, 1); curfy = init_joints(9, 2); curbx = init_joints(15, 1); curby = init_joints(15, 2);
    curvalset = {curfx, curfy, curbx, curby, get_norm2([curfx, curfy] - [curbx, curby]), 'shlegc'};
    curmap = containers.Map(genericKeySet, curvalset);
    mapSet{13} = curmap;
    
    %14 - shlegc
    curfx = init_joints(3, 1); curfy = init_joints(3, 2); curbx = init_joints(9, 1); curby = init_joints(9, 2);
    curvalset = {curfx, curfy, curbx, curby, get_norm2([curfx, curfy] - [curbx, curby]), 'necksh'};
    curmap = containers.Map(genericKeySet, curvalset);
    mapSet{14} = curmap;
    
    %15 - hiptail1
    curfx = init_joints(15, 1); curfy = init_joints(15, 2); curbx = init_joints(16, 1); curby = init_joints(16, 2);
    curvalset = {curfx, curfy, curbx, curby, get_norm2([curfx, curfy] - [curbx, curby]), 'legchip'};
    curmap = containers.Map(genericKeySet, curvalset);
    mapSet{15} = curmap;
    
    %16 - tail1tail2
    curfx = init_joints(16, 1); curfy = init_joints(16, 2); curbx = init_joints(17, 1); curby = init_joints(17, 2);
    curvalset = {curfx, curfy, curbx, curby, get_norm2([curfx, curfy] - [curbx, curby]), 'hiptail1'};
    curmap = containers.Map(genericKeySet, curvalset);
    mapSet{16} = curmap;
    
    skel.segmap = containers.Map(limbSet, mapSet);
    skel.segorder = {'headneck', 'necksh', 'she', 'elh', 'erh', 'lhlg', 'rhrg', 'legck', 'klf', 'krf', 'lflt', 'rfrt', 'legchip', 'shlegc', 'hiptail1', 'tail1tail2'};
    assert(size(skel.segorder, 2) == skel.numsegs);

end