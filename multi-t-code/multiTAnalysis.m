function multiTAnalysis()

    rng('default')
    addpath('../niiTool')
    addpath("./multiT-code-from-paper")
    addpath("./multiT-code-from-paper/helper_functions")
    P.numShuffels = 100;
    P.subjects=[101:116];
    % P.subjects=[101];
    P.discardedSubjects=[102, 104, 105, 107, 113];
    P.subjects = setdiff(P.subjects, P.discardedSubjects);
    P.conditions=["LE", "RE"];

    P.regionSize      = 27; % sl size
    P.multiResDirName=fullfile("../multi-t-results");
    P.dataDir=fullfile(pwd,"../multi-t-data");
    P.multiTMNIMask = fullfile(P.dataDir,"standard_MNI_mask.nii.gz");
    P.MNIMaskIndex = fullfile(P.dataDir,"standard_MNI_mask_index.mat");
    P.multiDataLoc=P.dataDir;
    P.multiout_dir=P.multiResDirName;


    %% call level one analysis
    % multiTLevel1(P);

    %% call level two analysis
    multiTLevel2(P);

end
