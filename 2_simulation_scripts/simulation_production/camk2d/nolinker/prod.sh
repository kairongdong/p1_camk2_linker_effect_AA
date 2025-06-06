#!/bin/bash
#SBATCH --job-name="ctrl"               # Job name
#SBATCH -n 32                    # Number of cores
#SBATCH -N 1                     # Number of nodes
#SBATCH -o slurmlog_%j.out       # File to which STDOUT will be written
#SBATCH -e slurmlog_%j.err       # File to which STDERR will be written
#SBATCH --gres=gpu:4             # require 4 gpus
#SBATCH -p fast

## create hostfile for mpirun
#scontrol show hostnames $SLURM_JOB_NODELIST|cat | awk ' { print $1, str} ' str="slots=10" > hostfile_$SLURM_JOB_ID
#env > fullenv
#gpuid=`env | grep CUDA_VISIBLE_DEVICES`
#echo "gpuid is $gpuid"

###  env
module unload openmpi/gcc/64/1.10.1

export PATH=/home/zgjia/Software/openmpi/2.1.0/bin/:$PATH:/home/zgjia/Software/openmpi/2.1.0/bin
export  LD_LIBRARY_PATH=/home/zgjia/Software/openmpi/2.1.0/lib/:$LD_LIBRARY_PATH:/home/zgjia/Software/openmpi/2.1.0/lib

module load cuda/9.0.176

export PATH=$PATH:/home/zgjia/Software/gromacs/plumed252/bin/
export  LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/zgjia/Software/gromacs/plumed252/lib/
export PATH=/home/zgjia/Software/gromacs/gromacs2019_plumed253/bin/:$PATH:/home/zgjia/Software/gromacs/gromacs2019_plumed253/bin/
export  LD_LIBRARY_PATH=/home/zgjia/Software/gromacs/gromacs2019_plumed253/lib/:$LD_LIBRARY_PATH:/home/zgjia/Software/gromacs/gromacs2019_plumed253/lib/

### command

cd /home/kairongdong/work/p1_camk2/t3_camk2d_symmetry/ctrl/charmm-gui-8961773770/gromacs

gmx_mpi grompp -f step5_production_400k.mdp -o ./prod/step5_1_400k.tpr -c ./equi/step4.1_equilibration.gro -p topol.top -n index.ndx

cd /home/kairongdong/work/p1_camk2/t3_camk2d_symmetry/ctrl/charmm-gui-8961773770/gromacs/prod

gmx_mpi mdrun -deffnm ctrl_s1_400k -s step5_1_400k.tpr -ntomp 4 -nb gpu -pme gpu -bonded gpu -gpu_id 0 -pin on -pinoffset 0 &
gmx_mpi mdrun -deffnm ctrl_s2_400k -s step5_1_400k.tpr -ntomp 4 -nb gpu -pme gpu -bonded gpu -gpu_id 1 -pin on -pinoffset 8 &

wait
echo "Job is done"
