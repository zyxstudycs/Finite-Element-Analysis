function [ ke, fe ] = flow2Delem_iso( e )

include_flags;

ke  = zeros(nen,nen);    % initialized element conductance matrix
fe  = zeros(nen,1);      % initialize element nodal source vector

% get coordinates of element nodes 
je = IEN(:,e);  
C  = [x(je); y(je)]'; 
x1=C(1,1);x2=C(2,1);x3=C(3,1);y1=C(1,2);y2=C(2,2);y3=C(3,2);

w=[0.1666666666 0.1666666666 0.1666666666 ]; 
gp=[0.1666666666,0.1666666666;0.6666666666,0.1666666666;0.1666666666,0.6666666666];% get gauss points and weights

% compute element conductance matrix and nodal flux vector 
for i=1:3
   
       eta1 = gp(i,1); 
       eta2 = gp(i,2);
 
       N       = [eta1, eta2, 1-eta1-eta2];       % shape functions matrix
       GN      = [1 0 -1; 0 1 -1];
       J       = [x1-x3, y1-y3; x2-x3, y2-y3];    % derivative of the shape functions
       detJ    = det(J);
       B       = J\GN;
       
       ke = ke + w(i)*B'*B*detJ;   % element conductance matrix
       se = N*s(:,e);                     % compute s(x)
       fe = fe + w(i)*N'*se*detJ;    % element nodal source vector

          
end

