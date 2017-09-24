clear all;
 
%import all the potential data.
d_CC=importdata('CC_d.mat');
d_CF=importdata('CF_d.mat');
%import all the nodes data.
node_inf_CC=xlsread('CC nodes coordinate');
node_inf_CF=xlsread('CF nodes coordinate');

%draw FGH velocity potential
figure(1)
n=size(node_inf_CC,2);
j=1;
for i=1:n
    if node_inf_CC(3,i)>=0 & sqrt(node_inf_CC(2,i)^2+node_inf_CC(3,i)^2)<1.26 & sqrt(node_inf_CC(2,i)^2+node_inf_CC(3,i)^2)<1.26
       CC_point(:,j)=node_inf_CC(:,i);
       j=j+1;
    end
end
[coordinate_CC,index_CC] = sort(CC_point(2,:));
for i=1:size(CC_point,2)
    x=CC_point(2,index_CC(i)); y=CC_point(3,index_CC(i)); r=sqrt(x*x+y*y);
    angleCC(i)=180-acos(x/r)/pi*180;
    dCC(i)=d_CC(CC_point(1,index_CC(i)));
end
plot(angleCC,dCC);
hold on;
n=size(node_inf_CF,2);
j=1;
for i=1:n
    if node_inf_CF(3,i)>=0 & sqrt(node_inf_CF(2,i)^2+node_inf_CF(3,i)^2)<1.26 & sqrt(node_inf_CF(2,i)^2+node_inf_CF(3,i)^2)<1.26
       CF_point(:,j)=node_inf_CF(:,i);
       j=j+1;
    end
end
[coordinate_CF,index_CF] = sort(CF_point(2,:));
for i=1:size(CF_point,2)
    x=CF_point(2,index_CF(i)); y=CF_point(3,index_CF(i)); r=sqrt(x*x+y*y);
    angleCF(i)=180-acos(x/r)/pi*180;
    dCF(i)=d_CF(CF_point(1,index_CF(i)));
end
plot(angleCF,dCF);
title('Velocity potential in FGH'); 
xlabel('Angle');ylabel('velocity potential');
legend('Coarse','Fine'); grid on;



