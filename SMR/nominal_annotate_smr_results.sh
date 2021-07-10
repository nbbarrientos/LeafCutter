#!/bin/bash

### Shell script to annotate every smr result file ###

#Flags:
main_dir="/project/cphg-millerlab/CAD_QTL/coronary_QTL/transcriptome/LeafCutter/SMR/finalrun_PCs_Age_Sex_nominal"

module load gcc/7.1.0 openmpi/3.1.4 R/4.0.0

for i in $(seq 1 22);
do
        sbatch -A cphg-millerlab \
               -p parallel \
               -t 3:00:00 \
               --mem=25g \
               -N 4 \
               -n 20 \
               --wrap="Rscript nominal_annotate_smr_results.R ${main_dir}/Coronary_Artery_nominal_chr${i}.smr \
                                                              ${main_dir}/Coronary_Artery_nominal_chr${i}.annotated.smr.txt"
done
