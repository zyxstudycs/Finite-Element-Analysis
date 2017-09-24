clear all;
close all; 

% include global variables
include_flags;

% Preprocessing
[K,f,d] = preprocessor;

% Evaluate element conductance matrix, nodal source vector and assemble
for e = 1:nel        
    
    sctr = IEN(:,e);
    
    [ke, fe] = flow2Delem(e);
    %[ke, fe] = flow2Delem_iso(e);

    K(sctr,sctr) = K(sctr,sctr) + ke;
    f(sctr)      = f(sctr) + fe;    
end

% Compute and assemble nodal boundary flux vector and point sources
f = src_and_flux(f);

% Solution
d = solvedr(K,f);

%save the value of d and K , for question 8 and 9.
if size(d,1)==252
    save('CC_d','d');
    save('CC_K','K');
elseif size(d,1)==818
    save('CF_d','d');
    save('CF_K','K');
    elseif size(d,1)==256
    save('RC_d','d');
    save('RC_K','K');
    elseif size(d,1)==894
    save('RF_d','d');
    save('RF_K','K');
end

% Postprocessor
postprocess_triangle(d);
