function [ ke, fe ] = flow2Delem( e )
include_flags;

ke  = zeros(nen,nen);    % initialized element conductance matrix
fe  = zeros(nen,1);      % initialize element nodal source vector

% get coordinates of element nodes 
je = IEN(:,e);  
C  = [x(je); y(je)]';
x1=C(1,1);x2=C(2,1);x3=C(3,1);y1=C(1,2);y2=C(2,2);y3=C(3,2);
% compute element conductance matrix and nodal flux vector 
A=(1/2)*(x1*y2+x2*y3+x3*y1-x1*y3-x2*y1-x3*y2);
B=1/(2*A)*[y2-y3 y3-y1 y1-y2;x3-x2 x1-x3 x2-x1];
ke=B'*B*A;
fe=[0;0;0];

end

