%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% navigate into the folder you want to work in
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear vars
close all
path(pathdef);
addpath(path,genpath([pwd '/utils/']));

G = Mesh('off', './data/PNAS2011/D09_sas.off');
G.draw();

%%% explore fields in G using G."something"
%%% G.V
%%% G.F
%%% size(G.V)  ---- check shape of G.V ---- should be 3-by-num of vertices
%%% size(G.F)  ---- check shape of G.F ---- should be 3-by-num of faces
clf
%%% check function definition: type "help scatter3" in terminal
scatter3(G.V(1,:), G.V(2,:), G.V(3,:), 1, 'g', 'filled');

%%%% draw mesh, and visualize a specific vertex
% vIdx = [3000,3003,3005,3007,4000];
vIdx = 1:G.nV;
clf
G.draw();
hold on
scatter3(G.V(1,vIdx), G.V(2,vIdx), G.V(3,vIdx), 20, 'g', 'filled');

%%%% perform pca on the vertices of mesh G
[coeff, score, latent] = pca(G.V');
clf
G.draw();
COM = mean(G.V,2);
hold on
scatter3(COM(1),COM(2),COM(3),20,'r','filled'); %% draw center of mass

%%%%%% draw pca axes ---- pick directions and multiply the magnitude by
%%%%%% twice the variance in this direction
pcaAxis1 = 2*sqrt(latent(1))*(coeff(:,1))+COM;
scatter3(pcaAxis1(1),pcaAxis1(2),pcaAxis1(3),20,'g','filled');
line([COM(1),pcaAxis1(1)],[COM(2),pcaAxis1(2)],[COM(3),pcaAxis1(3)],'color','g');
pcaAxis2 = 2*sqrt(latent(2))*(coeff(:,2))+COM;
scatter3(pcaAxis2(1),pcaAxis2(2),pcaAxis2(3),20,'b','filled');
line([COM(1),pcaAxis2(1)],[COM(2),pcaAxis2(2)],[COM(3),pcaAxis2(3)],'color','b');
pcaAxis3 = 2*sqrt(latent(3))*(coeff(:,3))+COM;
scatter3(pcaAxis3(1),pcaAxis3(2),pcaAxis3(3),20,'m','filled');
line([COM(1),pcaAxis3(1)],[COM(2),pcaAxis3(2)],[COM(3),pcaAxis3(3)],'color','m');



