function [M] = mass_matrix(vert, tria)
    n_vert = size(vert, 1);
    n_tri = size(tria, 1);
    
    M = sparse(n_vert, n_vert);
    i_ix = [];
    j_ix = [];
    val = [];
    for k = 1:n_tri
        triangle = [vert(tria(k, 1), :); vert(tria(k, 2), :); vert(tria(k, 3), :)];
        M_elem = masse_elem(triangle);
        for i = 1:3
           for j = 1:3
               i_ix = [i_ix, tria(k, i)];
               j_ix = [j_ix, tria(k, j)];
               val = [val, M_elem(i, j)];
           end
        end
    end
    M = sparse(i_ix, j_ix, val);
end