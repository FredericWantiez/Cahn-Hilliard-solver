function [ix_triangle, W] = find_triangle_bis(points, tria, vert)
    TR = triangulation(tria, vert); 
    [ix_triangle, W] = pointLocation(TR, points);
end