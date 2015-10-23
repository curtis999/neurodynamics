function out = test1( t,X , ggaba)
%TEST Summary of this function goes here
%   Detailed explanation goes here
v1 = X(1);
v2 = X(2);
m1 = X(3);
m2 = X(4);
h1 = X(5);
h2 = X(6);
n1 = X(7);
n2 = X(8);
r1 = X(9);
r2 = X(10);

iext1 = 10;
iext2 = 20;
ena = 45;
ek = -82;
el = -59.387;
gna = 120;
gk = 36;
gl = .3;
ecl = -80;
ar = 5;
br = .18;
tmax = 1.5;
kp = 5;
vp = 7;
% ggaba = 0.34;

am1 = .1*(v1 + 45)./(1 - exp(-(v1 + 45)/10));
bm1 = 4*exp(-(v1 + 70)/18);
ah1 = .07*exp(-(v1 + 70)/20);
bh1 = 1./(1 + exp(-(v1 + 40)/10));
an1 = .01*(v1 + 60)./(1 - exp(-(v1 + 60)/10));
bn1 = .125*exp(-(v1 + 70)/80);

am2 = .1*(v2 + 45)./(1 - exp(-(v2 + 45)/10));
bm2 = 4*exp(-(v2 + 70)/18);
ah2 = .07*exp(-(v2 + 70)/20);
bh2 = 1./(1 + exp(-(v2 + 40)/10));
an2 = .01*(v2 + 60)./(1 - exp(-(v2 + 60)/10));
bn2 = .125*exp(-(v2 + 70)/80);
bigt1 = tmax/(1 + exp(-(v1-vp)/kp));
bigt2 = tmax/(1 + exp(-(v2-vp)/kp));

dmdt1 = am1*(1 - m1) - bm1*m1;
dmdt2 = am2*(1 - m2) - bm2*m2;
dhdt1 = ah1*(1 - h1) - bh1*h1;
dhdt2 = ah2*(1 - h2) - bh2*h2;
dndt1 = an1*(1 - n1) - bn1*n1;
dndt2 = an2*(1 - n2) - bn2*n2;
drdt1 = ar.*bigt1.*(1 - r1)-br.*r1;
drdt2 = ar.*bigt2.*(1 - r2)-br.*r2;

ina1 = gna*m1^3*h1*(v1 - ena);
ina2 = gna*m2^3*h2*(v2 - ena);
ik1 = gk*n1^4*(v1 - ek);
ik2 = gk*n2^4*(v2 - ek);
il1 = gl*(v1 - el);
il2 = gl*(v2 - el);
isyn1 = ggaba.*r1.*(v2 - ecl);
isyn2 = ggaba.*r2.*(v1 - ecl);

dvdt1 = -ina1 - ik1 - il1 + isyn1 + iext1;
dvdt2 = -ina2 - ik2 - il2 + isyn2 + iext2;

out(1) = dvdt1;
out(2) = dvdt2;
out(3) = dmdt1;
out(4) = dmdt2;
out(5) = dhdt1;
out(6) = dhdt2;
out(7) = dndt1;
out(8) = dndt2;
out(9) = drdt1;
out(10) = drdt2;

out = out';

end

