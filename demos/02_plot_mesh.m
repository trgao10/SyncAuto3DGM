%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% navigate into the folder you want to work in
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear vars
close all
path(pathdef);
addpath(path,genpath([pwd '/utils/']));

%% load 2 meshes to compare
G1 = Mesh('off', './data/PNAS2011/D09_sas.off');
G2 = Mesh('off', './data/PNAS2011/B03_sas.off');

%% draw 2 meshes in the same figure (but not sync-ed)
figure;
subplot(1,2,1);
G1.draw();
subplot(1,2,2);
G2.draw();

%% draw the 2 meshes in the same figure (sync-ed)
%%%%% simply putting two meshes in the same view will cause trouble
figure;
h = zeros(1,2);
h(1) = subplot(1,2,1);
G1.draw();
h(2) = subplot(1,2,2);
G2.draw();

Link = linkprop(h, {'CameraUpVector', 'CameraPosition', 'CameraTarget', 'CameraViewAngle'});
setappdata(gcf, 'StoreTheLink', Link);


%% so you need to "align" them before plotting them in the same view!
%%%%% As a first attempt, let us at least translate them to the origin at
%%%%% least; note that their scales are still different
G1.V = G1.V-repmat(mean(G1.V,2), 1, G1.nV);
G2.V = G2.V-repmat(mean(G2.V,2), 1, G2.nV);

figure;
h = zeros(1,2);
h(1) = subplot(1,2,1);
G1.draw();
h(2) = subplot(1,2,2);
G2.draw();

Link = linkprop(h, {'CameraUpVector', 'CameraPosition', 'CameraTarget', 'CameraViewAngle'});
setappdata(gcf, 'StoreTheLink', Link);

%% let's try to scale them to have the same surface area!
G1.Centralize('ScaleArea');
G2.Centralize('ScaleArea');

figure;
h = zeros(1,2);
h(1) = subplot(1,2,1);
G1.draw();
h(2) = subplot(1,2,2);
G2.draw();

Link = linkprop(h, {'CameraUpVector', 'CameraPosition', 'CameraTarget', 'CameraViewAngle'});
setappdata(gcf, 'StoreTheLink', Link);

