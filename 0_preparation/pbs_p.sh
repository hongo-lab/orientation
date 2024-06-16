#!/bin/sh
#PBS -l select=1:ncpus=1:mpiprocs=1
#PBS -j oe
#PBS -N test
#PBS -q SEMINAR

cd $PBS_O_WORKDIR

time python ./hello.py

