clear vars
close all
path(pathdef);
addpath(path,genpath('../utils/'));

%% load 2 meshes to compare
G1 = Mesh('off', '../data/PNAS2011/D09_sas.off');
G2 = Mesh('off', '../data/PNAS2011/B03_sas.off');

%% Euclidean Furthest Point Sampling
SampleSize = 1000;
% sampleArray = zeros(1, SampleSize);
% rng(111)
% 
% sampleArray(1) = randi(G1.nV);
% for j=2:SampleSize
%     points_sampled = G1.V(:, sampleArray(1:(j-1)));
%     distance2sampled = min(pdist2(points_sampled', G1.V'));
%     [~, newIdx] = max(distance2sampled);
%     sampleArray(j) = newIdx;
% end

sampleArray = EucFPS(G1, SampleSize);
G1.draw();
hold on
scatter3(G1.V(1, sampleArray), G1.V(2, sampleArray), G1.V(3, sampleArray), 20, 'g', 'filled');

% sampleArray = zeros(1, SampleSize);
% sampleArray(1) = randi(G2.nV);
% for j=2:SampleSize
%     points_sampled = G2.V(:, sampleArray(1:(j-1)));
%     distance2sampled = min(pdist2(points_sampled', G2.V'));
%     [~, newIdx] = max(distance2sampled);
%     sampleArray(j) = newIdx;
% end

sampleArray = EucFPS(G2, SampleSize);
figure;
G2.draw();
hold on
scatter3(G2.V(1, sampleArray), G2.V(2, sampleArray), G2.V(3, sampleArray), 20, 'g', 'filled');
