function computeFFXresults(subsToExtract,fold,ffxResFold,numMaps,cond, P)
cnt = 1;
%% extract results from each subject
for ss = 1:length(subsToExtract)
    start = tic;
%     subStrSrc = sprintf('*shuf*%3.3d*.mat',i);
%     [firstlevelfold,~] = fileparts(ffxResFold);
%     ff = findFilesBVQX(firstlevelfold,subStrSrc);
    t = load(subsToExtract{ss});
    ansMat = t.ansMat;
    if ss==1
        ansMatOut=zeros([size(ansMat),length(subsToExtract)]);
    end
%     fprintf('B = sub %d has %d nans\n',i,sum(isnan(median(ansMat,2))))
    modeuse = 'equal-min'; % modes to deal with zeros also 'equal-zero', 'equal-min' and 'weight'
    ansMat = squeeze(ansMat(:,:,1)); % first val is multi t 2013
%     fixedAnsMat = fixAnsMat(ansMat,locations,modeuse); % fix ansMat for zeros
    ansMatOut(:,:,cnt) = ansMat;
    cnt = cnt + 1;
%     fprintf('A = sub %d has %d nans\n\n',i,sum(isnan(median(fixedAnsMat,2))))
end
% find out how many shufs you have
numshufs = size(ansMatOut,2)-1;


%% compute the MSCM maps
[avgAnsMat,stlzerPermsAnsMat] = createStelzerPermutations(ansMatOut,numMaps,'mean');
clear ansMat;

%% save the file
numsubs = size(ansMatOut,3);
[pn,fn]= fileparts(ffxResFold);
fnTosave = sprintf(...
    'ND_FFX_VDS_%d-subs_%d-slsze_%d-fld_%dshufs_%d-stlzer_mode-%s_newT2013_%s.mat',...
    numsubs,...
    P.regionSize,...
    fold,...
    numshufs,...
    numMaps,...
    modeuse,...
    cond);
save(fullfile(ffxResFold,fnTosave),...
    'avgAnsMat',...
    'stlzerPermsAnsMat',...
    'fnTosave','subsToExtract','P', '-v7.3');

end
