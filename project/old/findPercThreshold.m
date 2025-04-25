function percolationProb = findPercThreshold(simTime, N, pVals)
%   Sweeps over pVals and estimates percolation probability
%
%   percolationProb = findPercThreshold(N, numTrials, pVals)
%
%   - simTime: simulation epoch for each probability in pVals
%   - N: size of the square grid
%   - pVals: vector of occupation probabilities to test
%
%   percolationProb: TODO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%   the fraction of percolation for each p in pVals
    
    percolationProb = zeros(size(pVals));

    for i = 1:length(pVals)
        p = pVals(i);
        countPercolation = 0;
        
        for t = 1:simTime
            [tbPercolation, lrPercolation] = simulatePercolation(N, p);
            
            if tbPercolation || lrPercolation
                countPercolation = countPercolation + 1;
            end
        end

        percolationProb(i) = countPercolation / simTime;
        fprintf('p = %.3f, Percolation Probability = %.3f\n', ...
                p, percolationProb(i));
    end
end
