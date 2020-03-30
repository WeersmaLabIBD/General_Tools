#!/bin/bash
#SBATCH --job-name=test_capacities            
#SBATCH --output=test_capacities.out
#SBATCH --error=test_capacities.err
#SBATCH --time=23:59:00
#SBATCH --cpus-per-task=22
#SBATCH --mem=200gb
#SBATCH --nodes=1
#SBATCH --export=NONE
#SBATCH --get-user-env=L
df -h
