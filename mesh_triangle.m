%mesh 2D for triangle elements;
function mesh_triangle;
include_flags;


%get collection of x and y coordinates
x=node_inf(2,:);
y=node_inf(3,:);

%generate the IEN connectivity array
IEN=element_inf(2:4,:);

plotmesh_triangle;

