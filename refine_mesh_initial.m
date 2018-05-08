function [vert, etri, tria, tnum] = refine_mesh_initial(corners, edges, hfun, n_refine)
    % Initial mesh
    [vert, etri, tria, tnum] = refine2(corners, edges);
    [vert, etri, tria, tnum] = tridiv2(vert, etri, tria, tnum);
    [vert, etri, tria, tnum] = tridiv2(vert, etri, tria, tnum);
    [vert, etri, tria, tnum] = tridiv2(vert, etri, tria, tnum);
    [vert, etri, tria, tnum] = tridiv2(vert, etri, tria, tnum);
    for k = 1:n_refine
       tdiv = hfun(tria, vert);
       [vert, etri, tria, tnum] = tridiv2(vert, etri, tria, tnum, tdiv); 
    end
    [vert, etri, tria, tnum] = smooth2(vert, etri, tria, tnum);
end