function u = cross_initial(vert)
    N = length(vert);
    u = -ones(N, 1);
    for i = 1:N
       if 0.15 <= vert(i, 1) && vert(i, 1) <= 0.85 && 0.40 <= vert(i, 2) && vert(i, 2) <= 0.60
          u(i) = 1; 
       end
      if 0.40 <= vert(i, 1) && vert(i, 1) <= 0.60 && 0.15 <= vert(i, 2) && vert(i, 2) <= 0.85
          u(i) = 1; 
       end
    end
end