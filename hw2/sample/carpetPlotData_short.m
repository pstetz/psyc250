% aim: to Carpet Plot the data
% date: Jan 7, 2020
% author: saggar@stanford.edu

%% load data
clear; clc; 
anat_gm_mask = 'dataForPlotting/gm_3mm_fnirt.nii.gz';
anat_wm_mask = 'dataForPlotting/wm_3mm_fnirt.nii.gz';
anat_csf_mask = 'dataForPlotting/csf_3mm_fnirt.nii.gz';

func_file = 'dataForPlotting/rsfMRI_data.nii.gz';
fd_file = 'dataForPlotting/FD.1D';

gm_mask = niftiread(anat_gm_mask);
wm_mask = niftiread(anat_wm_mask);
csf_mask = niftiread(anat_csf_mask);

func_data = niftiread(func_file);
imgdim = size(func_data);
func_data = reshape(func_data, [imgdim(1)*imgdim(2)*imgdim(3), imgdim(4)]);
fd_data = load(fd_file);

func_data_de = detrend(func_data')';
figure; set(gcf, 'Position',[160   327   874   987]); set(gcf,'Color','White');
subplot(11,1,1), plot(fd_data); axis('tight');
subplot(11,1,2:5), imagesc(func_data_de(~~gm_mask(:),:),[-100,100]); colormap(gray);
subplot(11,1,6:9), imagesc(func_data_de(~~wm_mask(:),:),[-100,100]); colormap(gray);
subplot(11,1,10:11), imagesc(func_data_de(~~csf_mask(:),:),[-100,100]); colormap(gray);
