## job on gearshift

#!/bin/bash
#SBATCH --job-name=NAME
#SBATCH --output=/groups/umcg-weersma/tmp01/singelcell/NAME.out
#SBATCH --error=/groups/umcg-weersma/tmp01/singelcell/NAME.err
#SBATCH --time=6-23:59:00
#SBATCH --cpus-per-task=22
#SBATCH --mem=200gb
#SBATCH --nodes=1
#SBATCH --export=NONE
#SBATCH --get-user-env=L
#SBATCH --tmp=2700gb
mkdir -p ${TMPDIR}/cellranger/NAME
mkdir /groups/umcg-weersma/tmp01/singelcell/NAME/
cd ${TMPDIR}/cellranger/NAME
/groups/umcg-weersma/tmp01/umcg-hbrugge/cellranger-3.0.2/cellranger count \
--id=NAME \
--transcriptome=/groups/umcg-weersma/tmp01/umcg-hbrugge/refdata-cellranger-hg19-3.0.0 \
--libraries=/groups/umcg-weersma/tmp01/singelcell/PSC_data_202001/library_files/library_NAME.csv \
--feature-ref=/groups/umcg-weersma/tmp01/singelcell/PSC_data_202001/feature_refs/feature_ref_NAME.csv \
--localcores=22 

mv ${TMPDIR}/cellranger/200108_lane1/ /groups/umcg-weersma/tmp01/singelcell/NAME/
rm -rf ${TMPDIR}/cellranger/NAME/SC_RNA_COUNTER_CS
