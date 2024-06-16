#!/bin/csh
#PBS -j oe -l select=2:ncpus=16:mpiprocs=16
#PBS -q SINGLE
#PBS -N G16

##################################################
### Job Script for KAGAYAKI                    ###
### 32 Core , 128GB Mem Job for Gaussian16     ###
###                      2021.7.30 k-miya      ###
##################################################
##
## To use multicore, don't forget to confirm Link0 option of setup file.
##

cd $PBS_O_WORKDIR

source /etc/profile.d/modules.csh

module load g16/c.01

### Gaussian Scratch file is saved in current directory ###
setenv GAUSS_SCRDIR $PBS_O_WORKDIR

echo "-C-32"  > Default.Route
echo "-M-120GB" >> Default.Route
### memory size should be set a little less than the size allocated by the job.

g16 < test.com > gaussian.log

rm -f ./Default.Route
