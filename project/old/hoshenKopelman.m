function [lofl, labels] = hoshenKopelman(grid)
%   HOSHENKOPELMAN Perform Hoshen-Kopelman labeling on a binary grid.
%   labels = hoshenKopelman(grid) takes a 2D array 'grid' of 0s and 1s, 
%   and returns a 2D array 'labels' of the same size where each 1-cell is 
%   labeled according to the connected component it belongs to 
%   (4-connectivity: up, down, left, right).
%
%   grid(i,j) = 1 if site is occupied, 0 otherwise.
%   labels(i,j) = cluster label (0 if site is unoccupied).

    [rows, cols] = size(grid);
    labels       = zeros(rows, cols);   % This will store the assigned labels
    nextLabel    = 1;                   % The next label to assign
    lofl = [0];          % Label of labels
    
    function r = findRoot(x)
        while lofl(x) < 0
            x = -lofl(x); 
        end
        r = x;
    end


    function updateLofl(goodL, badL)
        if nargin == 1
            root = findRoot(goodL);
            lofl(root) = lofl(root) + 1;
        else
            % Merging the clusters of label & badLabel
            goodRoot = findRoot(goodL);
            badRoot = findRoot(badL);
            if goodRoot ~= badRoot
                % Merge smaller into bigger, or just do rootA as winner:
                lofl(goodRoot) = lofl(goodRoot) + lofl(badRoot);
                lofl(badRoot) = -goodRoot;
            end
        end
    end
    
    % Label the grid, row by row
    for r = 1:rows
        for c = 1:cols
            if grid(r,c) == 1  % site is colorated
                % Get neighbor labels (top and left)
                leftLabel = 0;
                topLabel  = 0;

                if c > 1 && grid(r,c-1) == 1
                    leftLabel = labels(r,c-1);
                end
                if r > 1 && grid(r-1,c) == 1
                    topLabel = labels(r-1,c);
                end

                % If both neighbors are 0 (no labels), assign a new label
                if leftLabel == 0 && topLabel == 0
                    labels(r,c) = nextLabel;
                    lofl(nextLabel) = 1; % init lofl for label
                    nextLabel = nextLabel + 1;

                % If only one neighbor is labeled, use that label
                elseif leftLabel ~= 0 && topLabel == 0
                    labels(r,c) = leftLabel;
                    updateLofl(leftLabel);

                elseif leftLabel == 0 && topLabel ~= 0
                    labels(r,c) = topLabel;
                    updateLofl(topLabel);

                 % If both neighbors are labeled (same label)
                elseif leftLabel ~= 0 && topLabel ~= 0 && leftLabel == topLabel
                    labels(r,c) = leftLabel;
                    updateLofl(leftLabel);

                % If both neighbors are labeled (different label)
                elseif leftLabel ~= 0 && topLabel ~= 0 && leftLabel ~= topLabel
                    goodLabel = min(leftLabel, topLabel);
                    badLabel = max(leftLabel, topLabel);
                    labels(r,c) = goodLabel;
                    updateLofl(goodLabel, badLabel);
                end
            end
        end
    end

end