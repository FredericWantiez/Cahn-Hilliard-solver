function [] = save_figure(solution, vert, tria, name, vis)
    % Helper function to save some plots    
    % Solution plot

    [~, f] = tricontf(vert(:, 1), vert(:, 2), tria, solution);
    set(f,'edgecolor','none');
    set(gcf, 'visible', vis)
    name_ = strcat(name, '_contour');
    saveas(gcf, name_, 'epsc2')
    
    f = figure('visible', vis);
    triplot(tria, vert(:, 1), vert(:, 2), 'k')
    name_ = strcat(name, '_mesh');
    saveas(f, name_, 'epsc2')
end