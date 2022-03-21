#!/bin/bash

# start interactive node

module load singularity

# Must match name in configure file
ONAME=hichip_5M_k4me3_BxC_allele
FASTQ=/projects/baker-lab/hichip/fastq/${ONAME}
ODIR=/projects/baker-lab/hichip/output/${ONAME}
CONFIG=/projects/baker-lab/hichip/scripts/${ONAME}_config-hicpro.txt

# Example for sample smc1a data
singularity exec /projects/baker-lab/containers/hicpro_2.11.4.sif \
HiC-Pro \
-i ${FASTQ} \
-o ${ODIR} \
-c ${CONFIG} \
-p

# script creator for HiC Pro isn't 100% accurate
# following code cleans it up and makes it run using containers
# first edit step 1 script
# move to output directory
cd ${ODIR}
# add line for singularity container
sed -i '13isingularity exec /projects/baker-lab/containers/hicpro_2.11.4.sif \\' HiCPro_step1_$ONAME.sh
# add line to load singularity
sed -i '12imodule load singularity' HiCPro_step1_$ONAME.sh
# remove excess sbatch command
sed -i '6d' HiCPro_step1_$ONAME.sh

# edit step 2 script
# add line for singularity container
sed -i '16isingularity exec /projects/baker-lab/containers/hicpro_2.11.4.sif \\' HiCPro_step2_$ONAME.sh
# add line to load singularity
sed -i '13imodule load singularity' HiCPro_step2_$ONAME.sh
# remove excess sbatch command
sed -i '7d' HiCPro_step2_$ONAME.sh

# when finished need to exit interactive job
# navigate to output directory
# use sbatch to launch job
