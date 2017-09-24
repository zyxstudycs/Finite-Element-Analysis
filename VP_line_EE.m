clear all;

d_RC=importdata('RC_d.mat');
d_RF=importdata('RF_d.mat');
node_inf_RF=xlsread('RF nodes coordinate');
node_inf_RC=xlsread('RC nodes coordinate');

figure(2);
%for coarse
n=size(node_inf_RC,2);
j=1;
for i=1:n
    if node_inf_RC(3,i)<0.01 & node_inf_RC(3,i)>-0.01 & node_inf_RC(2,i)<0
       RC_point_left(:,j)=node_inf_RC(:,i);
       j=j+1;
    end
end
[coordinate_RC_left,index_RC] = sort(RC_point_left(2,:));
for i=1:size(RC_point_left,2)
    dRC_left(i)=d_RC(RC_point_left(1,index_RC(i)));
end

j=1;
for i=1:n
    if node_inf_RC(3,i)<0.01 & node_inf_RC(3,i)>-0.01 & node_inf_RC(2,i)>0
       RC_point_right(:,j)=node_inf_RC(:,i);
       j=j+1;
    end
end
[coordinate_RC_right,index_RC] = sort(RC_point_right(2,:));
for i=1:size(RC_point_right,2)
    dRC_right(i)=d_RC(RC_point_right(1,index_RC(i)));
end

%for fine.
n=size(node_inf_RF,2);
j=1;
for i=1:n
    if node_inf_RF(3,i)<0.01 & node_inf_RF(3,i)>-0.01 & node_inf_RF(2,i)<0
       RF_point_left(:,j)=node_inf_RF(:,i);
       j=j+1;
    end
end
[coordinate_RF_left,index_RF] = sort(RF_point_left(2,:));
for i=1:size(RF_point_left,2)
    dRF_left(i)=d_RF(RF_point_left(1,index_RF(i)));
end
j=1;
for i=1:n
    if node_inf_RF(3,i)<0.01 & node_inf_RF(3,i)>-0.01 & node_inf_RF(2,i)>0
       RF_point_right(:,j)=node_inf_RF(:,i);
       j=j+1;
    end
end
[coordinate_RF_right,index_RF] = sort(RF_point_right(2,:));
for i=1:size(RF_point_right,2)
    dRF_right(i)=d_RF(RF_point_right(1,index_RF(i)));
end
hold on
plot(coordinate_RC_left,dRC_left,'r'); 
plot(coordinate_RF_left,dRF_left,'b');
plot(coordinate_RC_right,dRC_right,'r');  
plot(coordinate_RF_right,dRF_right,'b'); 
legend('Coarse','Fine');
title('Velocity potential in EE'); 
xlabel('xCoordinate');ylabel('velocity potential');
grid on
