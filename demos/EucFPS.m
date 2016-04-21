function sampleArray = EucFPS( G, SampleSize )
%EUCFPS Summary of this function goes here
%   Detailed explanation goes here

G.BV = G.FindBoundaries;
sampleArray = zeros(1, SampleSize);
rng(111)
sampleArray(1) = randi(G.nV);
for j=2:SampleSize
    progressbar(j, SampleSize, 20);
    points_sampled = G.V(:, sampleArray(1:(j-1)));
    distance2sampled = min(pdist2(points_sampled', G.V'));
    distance2sampled(G.BV) = -1;
    [~, newIdx] = max(distance2sampled);
    sampleArray(j) = newIdx;
end


end

