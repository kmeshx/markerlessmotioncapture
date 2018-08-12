
vv1 = [93, 120-49];
vv2 = [80, 120 - 47];
v1 = vv1 - vv2;
vt1 = [80, 120 - 47]; vt2 = [64, 120 - 50];
v2 = vt1 - vt2;

ij = [[93, 49];
[80, 47];
[64, 50];
[62, 59];
[57, 57];
[62, 70];
[48, 67];
[61, 77];
[48, 73];
[41, 44];
[49, 50];
[41, 50];
[41, 59];
[30, 52];
[50, 69];
[38, 67];
[33, 39];
[14, 31];
[3, 16]
];


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


disp( v1); disp(v2);
disp(curtheta);


%disp(acosd(dot(v1, v2)/(get_norm2(v1)*get_norm2(v2))));

R = [[cosd(curtheta), -sind(curtheta)]; [sind(curtheta), cosd(curtheta)]];
v22 = get_norm2(v2')*(R*(v1')/get_norm2(R*(v1')));      
curtheta = -curtheta; R = [[cosd(curtheta), -sind(curtheta)]; [sind(curtheta), cosd(curtheta)]];
v23 = R*(v22);
figure, hold on; quiver(0, 0, v1(1), v1(2), 'r'); quiver(0, 0, v2(1), v2(2), 'b'); quiver(0, 0, v22(1), v22(2), 'g'); quiver(0, 0, v23(1), v23(2), 'm');

