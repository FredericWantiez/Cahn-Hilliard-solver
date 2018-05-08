function area = get_area(triangle)
    a = triangle(2, :) - triangle(1, :);
    b = triangle(3, :) - triangle(1, :);
    a = [a, 0];
    b = [b, 0];
    area = 0.5*norm(cross(a, b));
end