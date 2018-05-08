function new_u = interpolate_fem_bis(nvert, overt, otria, old_u)
    N_new = size(nvert, 1);
    
    new_u = zeros(N_new, 1);
    % Find the old triangles
    [ix, W] = find_triangle_bis(nvert, otria, overt);
    
    for i = 1:N_new
        old_triangle = otria(ix(i), :);
        new_u(i) = W(i, :)*old_u(old_triangle);
    end
end