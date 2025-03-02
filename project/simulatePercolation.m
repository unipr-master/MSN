function [tbPercolation, lrPercolation] = simulatePercolation(N, p)
%   SIMULATEPERCOLATION Generate an N-by-N grid with site occupation p,
%   apply Hoshen-Kopelman labeling, and check if there is percolation.
%
%   [tbPercolates, lrPercolates] = simulatePercolation(N, p)
%
%   tbPercolation = true if there's a cluster connecting top to bottom
%   lrPercolation = true if there's a cluster connecting left to right

    % Generate random grid
    grid = rand(N) < p;   % NxN matrix of 1s (occupied) or 0s (empty)

    % Label the clusters via HK
    labels = hoshenKopelman(grid);

    % Check percolation
    [tbPercolation, lrPercolation] = checkPercolation(labels);
end