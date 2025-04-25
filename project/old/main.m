clc; clear; close all;

simTime = 1000;  % how many random grids to generate for each p

N = 20; % size of the square grid
pVals = [0.025:0.025:0.5 0.5125:0.0125:0.7 0.725:0.025:1];
%pVals = 0:0.02:1; % vector of coloration probabilities

percProb = findPercThreshold(N, simTime, pVals);

figure;
plot(pVals, percProb, 'b-o', 'LineWidth',1.5);
xlabel('p');
ylabel('Percolation Probability');
title(['Percolation Probability vs p (N=', num2str(N), ')']);
grid on;