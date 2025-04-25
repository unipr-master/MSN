clc;clear;close all;

N = 10;

baseGrid = rand(N) >= 0.5;

figure('Visible', 'off'); 
imagesc(baseGrid);
colormap([0.2 0.2 0.2; 0.9 0 0]);  % black for 0, red for 1
title(compose("Grid (%d x %d)", N, N));
saveas(gcf, 'out/basegrid.png'); 
close(gcf);

[LofL, labels] = hk76(baseGrid);
disp(LofL);
figure('Visible', 'off'); 
imagesc(labels);
title(compose("Labels grid (%d x %d)", N, N));
saveas(gcf, 'out/labels.png'); 
close(gcf);