function u = get_cross_initial(tria, vert, lx, ly, a, b)
    N = size(tria, 1);
    u = zeros(N, 1);
    
    cx = a/2;
    cy = b/2;
    for i = 1:N
       t = vert(tria(i, :), :);
       for j = 1:3
           if cx - lx <= t(j, 1) && t(j, 1) <= cx + lx && cy - ly <= t(j, 2) && t(j, 2) <= cy + ly
              u(i) = 1; 
           end
           if cy - ly <= t(j, 1) && t(j, 1) <= cy + ly && cx - lx <= t(j, 2) && t(j, 2) <= cx + lx
              u(i) = 1; 
           end
       end
    end
    u = logical(u);
end