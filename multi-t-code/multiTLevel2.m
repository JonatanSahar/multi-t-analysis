function multiTLevel2(PP)
P = PP;
results_dir_1lvl = P.resultsDir;
outFolder=P.resultsDir;
results_dir_2lvl = P.resultsDir;

% Compute avgAnsMat across subjects, per condition - including all the permutations on the shuffels
for cond = P.conditions
    MAIN_compute_non_directional_second_level(cond, results_dir_1lvl, results_dir_2lvl, P)
end

% tDir=dir(fullfile(results_dir_1lvl,['101' '*' num2str(numShuffels) '*' 'shuffels' '.mat'])); %just for the spatial features of the map
% tVar=load(fullfile(df.folder,df.name));
% linearIndex = tVar.linearIndex;
   

t = load(P.MNIMaskIndex);
P.linearIndex =t.linearIndex;
P.locations =t.locations;

%calc P_value
for cond = P.conditions
    mat=dir(fullfile(results_dir_2lvl, sprintf('*10000*2013_%s.mat', cond)));
    t = load(fullfile(results_dir_2lvl, mat.name));
    Pval = calcPvalVoxelWise_semotor(t.avgAnsMat, cond, outFolder, P);
    fprintf("finished 2nd level analysis on condition: %s\n", cond);
end

end
