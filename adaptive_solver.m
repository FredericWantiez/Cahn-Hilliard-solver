% Adpative mesh refinement FEM Method for the deterministic 
% Cahn-Hilliard equation

% Requires the package mesh2d and tricont
% Available at:
% mesh2d: https://github.com/dengwirda/mesh2d
% tricont: https://uk.mathworks.com/matlabcentral/fileexchange/40847-tricontf

addpath(genpath('./mesh2d'))
addpath(genpath('TRICONT'))
close all
clc

% Base domain [0, a]x[0, b]
a = 1; 
b = 1;
lx = 0.25;
ly = 0.25;
epsilon = 0.02;
thresh = 5;
n_refine = 2;
n_refine_initial = 5;
smooth_flag = false;
save_figure_flag = false;
vis = 'off';

% Helper function to refine the initial mesh
hfun = @cross_initial_bis;

% End time
T = 1;
dt = 1e-2;
N = T/dt;

% Define the rectangular domain
corners = [0, 0; a, 0; a, b; 0, b];
edges = [1, 2; 2, 3; 3, 4; 4, 1];

fprintf('Starting simulation for the Cahn-Hilliard problem')
fprintf('\n')

% Building the base triangular mesh
[bvert, betri, btria, btnum] = refine2(corners, edges);
for k = 1:n_refine_initial
    [bvert, betri, btria, btnum] = tridiv2(bvert, betri, btria, btnum);
end

% Get the non-uniform mesh from the cross
[vert, etri, tria, tnum] = refine_mesh_initial(corners, edges, hfun, 2);

% Constructing the FEM matrix (mass and stiffness)

n_vert = size(vert, 1);
n_tri = size(tria, 1);

M = mass_matrix(vert, tria);
S = stiff_matrix(vert, tria);

% Cross initial data
u = cross_initial(vert);

% Semi-implicit scheme
A = [M, dt*S; -(2/epsilon)*M - epsilon*S, M];
tdiv = zeros(size(btria, 1), 1);
for step = 2:N
   if step == 2
      grad = S*u;
   else
      grad = 1/epsilon*(u.^3 - u);
   end
   
   if step ==2
       i = abs(grad) > 2.5;
   else
       i = abs(grad) > 5;
   end
   
   ix = find_triangle(vert(i, :), btria, bvert);   
   tdiv(ix) = 1;
   tdiv = logical(tdiv);
   
   [nvert, netri, ntria, ntnum] = tridiv2(bvert, betri, btria, btnum, tdiv); 
   if smooth_flag == 1
        [nvert, netri, ntria, ntnum] = smooth2(nvert, netri, ntria, ntnum);
   end
   new_u = interpolate_fem_bis(nvert, vert, tria, u);

   M = mass_matrix(nvert, ntria);
   S = stiff_matrix(nvert, ntria); 
   A = [M, dt*S; -(2/epsilon)*M - epsilon*S, M];
     
   b = [M*new_u; (1/epsilon)*M*new_u.^3 - (3/epsilon)*M*new_u];
   n_vert = size(nvert);
   c = A\b;
   u = c(1:n_vert);
   w = c(n_vert+1:2*n_vert);
      
   vert = nvert; 
   tria = ntria;
   tnum = ntnum;
   etri = netri;
   
   if save_figure_flag == 1
    name = strcat('step', num2str(step));
    save_figure(u, vert, tria, name, vis)
   end
   
   if mod(step, 10) == 0
       fprintf('Step %d/%d', step, N)
       fprintf('\n')
   end
end