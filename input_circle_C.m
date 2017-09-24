%input data of coarse circle object.
include_flags
element_inf=xlsread('CC element nodes number');
node_inf=xlsread('CC nodes coordinate');

%material property
k=1;
D=k*eye(2);

% mesh specifications
nsd  = 2;         % number of space dimensions
nnp  = size(node_inf,2);         % number of nodal nodes
nel  = size(element_inf,2);         % number of elements
nen  = 3;         % number of element nodes 
ndof = 1;         % degrees-of-freedom per node
neq  = nnp*ndof;  % number of equations

f = zeros(neq,1);      % initialize nodal source vector
d = zeros(neq,1);      % initialize nodal temperature vector
K = zeros(neq);        % initialize stiffness matrix

flags = zeros(neq,1);  % array to set B.C flags 
e_bc  = zeros(neq,1);  % essential B.C array
n_bc  = zeros(neq,1);  % natural B.C array
P    = zeros(neq,1);   % initialize point source defined at a node
s     = 0*ones(nen,nel);  % heat source

% gauss Integration
ngp    = 2;                          % number of gauss points
% boundary conditions and point forces
nd = 1;     % number of nodes on essential boundary

% essential B.C.
for i=1:nnp
    if 4.95<node_inf(2,i) && node_inf(2,i)<5.05 && -2.55<node_inf(3,i) && node_inf(3,i)<-2.45
        flags(i)=2;
        e_bc(i)=0;
    end
end

% plots
compute_flux = 'yes';
plot_mesh    = 'yes';
plot_nod     = 'yes';
plot_temp    = 'no';
plot_flux    = 'yes';
plot_pressure= 'no';

% natural B.C  - defined on edges positioned on natural boundary
% pick up nodes in the natural b.c
j=1;
for i=1:nnp
    if node_inf(2,i)>-5.05 && node_inf(2,i)<-4.95
        nature_left(:,j)=node_inf(:,i);
        j=j+1;
    end
end
n_bc_left=size(nature_left,2);

j=1;
for i=1:nnp
    if node_inf(2,i)>4.95 && node_inf(2,i)<5.05
        nature_right(:,j)=node_inf(:,i);
        j=j+1;
    end
end
n_bc_right=size(nature_right,2);

n_bc=zeros(4,n_bc_left+n_bc_right-2);
[coordinate,index_left] = sort(nature_left(3,:));
for i=1:n_bc_left-1
    n_bc(1,i)=nature_left(1,index_left(i));
    n_bc(2,i)=nature_left(1,index_left(i+1));
    n_bc(3,i)=-1;
    n_bc(4,i)=-1;
end

[coordinate,index_right] = sort(nature_right(3,:));
for i=n_bc_left:n_bc_left+n_bc_right-2
     n_bc(1,i)=nature_right(1,index_right(i-n_bc_left+1));
     n_bc(2,i)=nature_right(1,index_right(i-n_bc_left+2));
     n_bc(3,i)=1;
     n_bc(4,i)=1;
end
% we have got n_bc.
nbe=size(n_bc,2);

mesh_triangle;