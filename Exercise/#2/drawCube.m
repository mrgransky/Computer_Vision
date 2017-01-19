function P_coor = drawCube(startP,endP,vertex,T_mat)

% disp('------------------- Welcome! ------------------');
if nargin < 4
      T_mat = eye(4);
end

Tran_mat = T_mat(1:3,4)';
Rot_mat = [T_mat(1,1:3);T_mat(2,1:3);T_mat(3,1:3)];

x = vertex(1,:);
y = vertex(2,:);
z = vertex(3,:);

P_coor = ([x;y;z]'*Rot_mat)';
for j = 1:size(P_coor,2)
    P_coor(:,j) = P_coor(:,j)+Tran_mat';
end


for i = 1:size(startP,2)
    A = [x(:,startP(i)),y(:,startP(i)),z(:,startP(i))]*Rot_mat;
    B = [x(:,endP(i)),y(:,endP(i)),z(:,endP(i))]*Rot_mat;
    AB = [A;B];
    plot3(Tran_mat(:,1)+AB(:,1),Tran_mat(:,2)+AB(:,2),Tran_mat(:,3)+AB(:,3)','m-.','LineWidth',2);
    hold on;
end

xlabel('x');
ylabel('y');
zlabel('z');

axis square;
end 