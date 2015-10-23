clear all;
close all;
clc;

[t,out] = ode23(@(t,y) test1(t,y,0) ,0:0.01:500,[0;0;0;0;0;0;0;0;0;0;]);
figure(1);
plot(t, out(:,1));
title('gGABA = 0')
hold on;
plot(t, out(:,2));
hold off; 

[t,out] = ode23(@(t,y) test1(t,y,0.1) ,0:0.01:500,[0;0;0;0;0;0;0;0;0;0;]);
figure(2);
plot(t, out(:,1));
title('gGABA = 0.1')
hold on;
plot(t, out(:,2));
hold off; 

[t,out] = ode23(@(t,y) test1(t,y,0.3) ,0:0.01:500,[0;0;0;0;0;0;0;0;0;0;]);
figure(3);
plot(t, out(:,1));
title('gGABA = 0.3')
hold on;
plot(t, out(:,2));
hold off; 

[t,out] = ode23(@(t,y) test1(t,y,0.5) ,0:0.01:500,[0;0;0;0;0;0;0;0;0;0;]);
figure(4);
plot(t, out(:,1));
title('gGABA = 0.5')
hold on;
plot(t, out(:,2));
hold off; 

[t,out] = ode45(@(t,y) test1(t,y,0.8) ,0:0.01:500,[0;0;0;0;0;0;0;0;0;0;]);
figure(5);
plot(t, out(:,1));
title('gGABA = 0.8')
hold on;
plot(t, out(:,2));
hold off; 