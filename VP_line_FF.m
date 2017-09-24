clear all;

d_RC=importdata('RC_d.mat');
d_RF=importdata('RF_d.mat');
node_inf_RF=xlsread('RF nodes coordinate');
node_inf_RC=xlsread('RC nodes coordinate');

figure(3)
% for coarse
n=size(node_inf_RC,2);
j=1;
for i=1:n
    if node_inf_RC(2,i)<0.01 & node_inf_RC(2,i)>-0.01 & node_inf_RC(3,i)<0
       RC_point_down(:,j)=node_inf_RC(:,i);
       j=j+1;
    end
end
[coordinate_RC_down,index_RC_down] = sort(RC_point_down(3,:));
for i=1:size(RC_point_down,2)
    dRC_down(i)=d_RC(RC_point_down(1,index_RC_down(i)));
end

j=1;
for i=1:n
    if node_inf_RC(2,i)<0.01 & node_inf_RC(2,i)>-0.01 & node_inf_RC(3,i)>0
       RC_point_up(:,j)=node_inf_RC(:,i);
       j=j+1;
    end
end
[coordinate_RC_up,index_RC_up] = sort(RC_point_up(3,:));
for i=1:size(RC_point_up,2)
    dRC_up(i)=d_RC(RC_point_up(1,index_RC_up(i)));
end

% for fine
n=size(node_inf_RF,2);
j=1;
for i=1:n
    if node_inf_RF(2,i)<0.01 & node_inf_RF(2,i)>-0.01 & node_inf_RF(3,i)<0
       RF_point_down(:,j)=node_inf_RF(:,i);
       j=j+1;
    end
end
[coordinate_RF_down,index_RF_down] = sort(RF_point_down(3,:));
for i=1:size(RF_point_down,2)
    dRF_down(i)=d_RF(RF_point_down(1,index_RF_down(i)));
end

j=1;
for i=1:n
    if node_inf_RF(2,i)<0.01 & node_inf_RF(2,i)>-0.01 & node_inf_RF(3,i)>0
       RF_point_up(:,j)=node_inf_RF(:,i);
       j=j+1;
    end
end
[coordinate_RF_up,index_RF_up] = sort(RF_point_up(3,:));
for i=1:size(RF_point_up,2)
    dRF_up(i)=d_RF(RF_point_up(1,index_RF_up(i)));
end


%draw the plot;
hold on
plot(coordinate_RC_down,dRC_down,'r'); 
plot(coordinate_RF_down,dRF_down,'b');
plot(coordinate_RC_up,dRC_up,'r');  
plot(coordinate_RF_up,dRF_up,'b'); 
legend('Coarse','Fine');
title('Velocity potential in FF'); 
xlabel('yCoordinate');ylabel('velocity potential');
grid on