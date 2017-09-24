function  get_flux_triangle(d,e);
include_flags;


% get coordinates of element nodes 
sctr = IEN(:,e);  
de = d(sctr);    % extract temperature at  element nodes
C  = [x(sctr); y(sctr)]'; 



% compute flux vector
x1=C(1,1);x2=C(2,1);x3=C(3,1);y1=C(1,2);y2=C(2,2);y3=C(3,2);
A=(1/2)*(x1*y2+x2*y3+x3*y1-x1*y3-x2*y1-x3*y2);
B=1/(2*A)*[y2-y3 y3-y1 y1-y2;x3-x2 x1-x3 x2-x1];
q=B*de;

q_x = q(1,:);
q_y = q(2,:);
q_total=sqrt(q_x^2+q_x^2);
X=[(x1+x2+x3)/3 (y1+y2+y3)/3];
%          #x-coord      y-coord       q_x(eta,psi)      q_y(eta,psi)
flux_e1  = [X(:,1)       X(:,2)        q_x'              q_y'];
fprintf(1,'\t\t\tx-coord\t\t\t\ty-coord\t\t\t\tq_x\t\t\t\t\tq_y\n');
fprintf(1,'\t\t\t%f\t\t\t%f\t\t\t%f\t\t\t%f\n',flux_e1');

% plot the pressure field?assume P0=0.
if strcmpi(plot_pressure,'yes')==1;  
%   d1 = d(ID);
P0=0; g=10;
   figure(3); 
   
       XX = [x1  x2  x3   x1];
       YY = [y1  y2  y3   y1];
       pp = [P0-g*y1-0.5*1*q_total^2 P0-g*y2-0.5*1*q_total^2 P0-g*y3-0.5*1*q_total^2  P0-g*y1-0.5*1*q_total^2];
       patch(XX,YY,pp);hold on;  
   
title('Pressure distribution'); xlabel('X'); ylabel('Y'); colorbar;
end

if strcmpi(plot_flux,'yes')==1 & strcmpi(plot_mesh,'yes') ==1;  
    figure(1); 
    quiver(X(:,1),X(:,2),q_x',q_y',0.3,'k');
    plot(X(:,1),X(:,2),'rx');
    title('Heat Flux');
    xlabel('X');
    ylabel('Y');


end

