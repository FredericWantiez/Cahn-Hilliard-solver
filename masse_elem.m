function [M] = masse_elem(triangle)
    aire = get_area(triangle);
    M = (aire/12)*[2 1 1; 1 2 1; 1 1 2];
end