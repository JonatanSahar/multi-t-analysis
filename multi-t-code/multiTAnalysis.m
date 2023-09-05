function multiTAnalysis()
    rng('default')
    addpath("./multiT-code-from-paper")
    addpath("./multiT-code-from-paper/helper_functions")
    P.numShuffels = 100;
    P.subjects=[101:116];
    % P.subjects=[106];
    P.discardedSubjects=[102, 104, 105, 107, 113];
    P.subjects = setdiff(P.subjects, P.discardedSubjects);
    P.earConditions=["LE", "RE"];
    P.handConditions=["LE", "RE"];
    P.conditions=P.handConditions;

    P.audiomotorResults=fullfile("../multi-t-results/audiomotor");
    P.motorResults=fullfile("../multi-t-results/motor-only");
    P.resultsDir=P.motorResults;

    P.audiomotorDataDir=fullfile(pwd,"../multi-t-data/audiomotor");
    P.motorDataDir=fullfile(pwd,"../multi-t-data/motor-only");
    P.dataDir=P.motorDataDir;

    P.regionSize  = 27; % sl size
    P.MNIMask = fullfile("../multi-t-data/", "MNI152_T1_2mm_brain_mask.nii.gz");
    P.MNIMaskIndex = fullfile("../multi-t-data/", "MNI152_T1_2mm_brain_mask_INDEX.mat");
    P.dataLocation=P.dataDir;
    P.outputDir=P.resultsDir;


    %% call level one analysis
    multiTLevel1(P);

    %% call level two analysis
    multiTLevel2(P);

end
