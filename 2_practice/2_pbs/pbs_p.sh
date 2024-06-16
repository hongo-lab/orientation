#!/bin/sh

#################################################################
# A40 1GPU Job Script only for orientation
#                                       2024/06/16 K. Hongo
#################################################################

#PBS -N gpu
#PBS -j oe
#PBS -q SEMINAR-GPU
#PBS -l select=1:ngpus=1

source /etc/profile.d/modules.sh
module purge
module load cuda
module load singularity

cd ${PBS_O_WORKDIR}

singularity exec --nv /app/container_images/tensorflow_23.05-tf2-py3.sif python mnist.py

