# Freesurfer-Neuroimaging
Cognitive trajectory cluster analysis code


Freesurfer (v7.1.1) runs on linux (CentOS 7).

#Installation guide

$ cd $HOME

$ pwd

/home/tester

$ tar -zxpf freesurfer-linux-centos7_x86_64-7.1.1.tar.gz

<wait for command to finish>

$ cd freesurfer

$ pwd

/home/tester/freesurfer

$ export FREESURFER_HOME=$HOME/freesurfer

$ source $FREESURFER_HOME/SetUpFreeSurfer.sh

-------- freesurfer-linux-centos7_x86_64-7.1.1-20210720-aa8f76b --------
Setting up environment for FreeSurfer/FS-FAST (and FSL)
FREESURFER_HOME   /home/tester/freesurfer
FSFAST_HOME       /home/tester/freesurfer/fsfast
FSF_OUTPUT_FORMAT nii.gz
SUBJECTS_DIR      /home/tester/freesurfer/subjects
MNI_DIR           /home/tester/freesurfer/mni

$ which freeview
/home/tester/freesurfer/bin/freeview



#Image reconstruction

recon-all -s SUBJECTS_DIR -i SUBJECTS_DIR/*.nii -all -qcache


#Segmentation based on brain map

gtmseg --s SUBJECTS_DIR --ctx-annot Schaefer2018_1000Parcels_17Networks_order.annot index1 index2 --xcerseg




#Register PET image with the anatomical


mri_coreg --s SUBJECTS_DIR --mov SUBJECTS_DIR/BE*.nii --reg SUBJECTS_DIR/cbf.reg.lta


#Partial volume correction

mri_gtmpvc --i SUBJECTS_DIR/*.nii --reg SUBJECTS_DIR/cbf.reg.lta --psf 1 --seg SUBJECTS_DIR/gtmseg.mgz --default-seg-merge --auto-mask PSF .01 --mgx .01 --o SUBJECTS_DIR/gtmpvc

#CONN runs on the Matlab platform through an interface
