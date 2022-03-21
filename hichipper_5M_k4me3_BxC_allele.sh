#!/bin/bash
#SBATCH -N 1
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH --mem-per-cpu=60G
#SBATCH --mail-user=aditya.mahadevaniyer@jax.org
#SBATCH --mail-type=end
#SBATCH --job-name=hichipper
#SBATCH --export=ALL

module load singularity

ONAME=hichip_5M_k4me3_BxC_allele-eachself
YPATH=/projects/baker-lab/hichip/scripts/yaml/hichip_5M_k4me3_BxC_allele.yaml

singularity exec /projects/baker-lab/containers/hichipper_0.7.8b0.sif \
 hichipper --make-washu --out ${ONAME} ${YPATH}
