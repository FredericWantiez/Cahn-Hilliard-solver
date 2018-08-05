function u = cross_initial_bis(tria, vert)
    N = size(tria, 1);
    u = zeros(N, 1);
    for i = 1:N
       t = vert(tria(i, :), :);
       for j = 1:3
           if 0.15 <= t(j, 1) && t(j, 1) <= 0.85 && 0.40 <= t(j, 2) && t(j, 2) <= 0.60
              u(i) = 1; 
           end
           if 0.40 <= t(j, 1) && t(j, 1) <= 0.60 && 0.15 <= t(j, 2) && t(j, 2) <= 0.85
              u(i) = 1; 
           end
       end
    end
    u = logical(u);
end