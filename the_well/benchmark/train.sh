#!/bin/bash
#SBATCH --job-name=fno_h100
#SBATCH --mail-user=z.wu@stu.pku.edu.cn
#SBATCH --mail-type=ALL
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH --partition=gpu
#SBATCH --requeue
#SBATCH --gpus=h100:1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=128gb
#SBATCH --time=23:59:59
#SBATCH --output=/home/zw474/project/LOLL/the_well/the_well/h100job/active_matter_fno_%J.log

# export OMP_NUM_THREADS=${SLURM_CPUS_ON_NODE}

# Activate the virtual environment with all the dependencies
# source ~/well_venv/bin/activate

date;hostname;pwd
module load miniconda
conda activate well

cd /home/zw474/project/LOLL/the_well/the_well/benchmark

# source /mnt/home/polymathic/ceph/the_well/venv_benchmark_well/bin/activate
# Launch the training script
HYDRA_FULL_ERROR=1 python train.py experiment=fno server=local data=active_matter
