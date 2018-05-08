function [M] = stiff_elem(triangle)
    area = get_area(triangle);
    u = triangle(2, :) - triangle(3, :);
    v = triangle(3, :) - triangle(1, :);
    w = triangle(1, :) - triangle(2, :);
    
    D = [u(2) v(2) w(2); -u(1) -v(1) -w(1)];
    M = (1/(4*area))*(D.')*D;
end