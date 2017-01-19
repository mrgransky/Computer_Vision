function drawtransf(T)


Origin = T(4,1:3);
Tran = T(1:3,4)';

OT_x = [T(1,1:3);Origin];
OT_y = [T(2,1:3);Origin];
OT_z = [T(3,1:3);Origin];

% plot3(R(:,1),R(:,2),R(:,3),'ks','LineWidth',3)
% hold on;
% plot3(Origin(:,1),Origin(:,2),Origin(:,3),'cs','LineWidth',2)
% hold on;
plot3(Tran(:,1)+OT_x(:,1),Tran(:,2)+OT_x(:,2),Tran(:,3)+OT_x(:,3),'r');
hold on;
plot3(Tran(:,1)+OT_y(:,1),Tran(:,2)+OT_y(:,2),Tran(:,3)+OT_y(:,3),'g');
hold on;
plot3(Tran(:,1)+OT_z(:,1),Tran(:,2)+OT_z(:,2),Tran(:,3)+OT_z(:,3),'b');


xlabel('x');
ylabel('y');
zlabel('z');

grid on;
axis equal;

end