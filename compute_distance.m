clear all
d_physical=importdata('CF_d.mat');
d_parent=importdata('CF_d_tri.mat');

distance=0;
for i=1:size(d_parent,1)
    x=sqrt((d_parent(i)-d_physical(i))^2);
    distance=distance+x;
end
disp('the distance of potential velocity between isoparametric triangle and exact integration triangle is');
disp(distance);