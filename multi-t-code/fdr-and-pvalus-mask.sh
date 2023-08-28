#!/bin/bash
#  To be run from multi-t-analysis/multi-t-results

# Whole-brain
LE_thr=$(fdr -i LE_pMmap.nii.gz -m ../multi-t-data/standard_MNI_mask.nii.gz -q 0.05| cut -d":" -f2)
RE_thr=$(fdr -i RE_pMmap.nii.gz -m ../multi-t-data/standard_MNI_mask.nii.gz -q 0.05| cut -d":" -f2)

fslmaths RE_pMmap.nii.gz -uthr $LE_thr -bin RE_pMap_mask.nii.gz
fslmaths LE_pMmap.nii.gz -uthr $RE_thr -bin LE_pMap_mask.nii.gz

# # Auditory ROI
# LE_thr=$(fdr -i LE_pMmap.nii.gz -m  /media/user/Data/fmri-data/analysis-output/localizer-ROI-data/L_auditory_cortex_mask.nii.gz -q 0.05 | cut -d":" -f2)
# RE_thr=$(fdr -i RE_pMmap.nii.gz -m /media/user/Data/fmri-data/analysis-output/localizer-ROI-data/R_auditory_cortex_mask.nii.gz  -q 0.05 | cut -d":" -f2)
# if [[ $LE_thr -gt 0 ]]; then fslmaths RE_pMmap.nii.gz -uthr $LE_thr -bin RE_pMap_ROI_mask.nii.gz; else echo "no significant voxels in ROI (LE)"; fi
# if [[ $RE_thr -gt 0 ]]; then fslmaths LE_pMmap.nii.gz -uthr $RE_thr -bin LE_pMap_ROI_mask.nii.gz; else echo "no significant voxels in ROI (RE)"; fi
