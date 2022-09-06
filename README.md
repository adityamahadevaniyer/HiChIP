# HiChIP

These are the scripts needed for data analysis of HiChIP data. HiChIP is a technique that combines ChIP with HiC to obtain protein-directed chromatin interactions. I performed HiChIP using H3K4me3 antibodies in 12 dpp mouse germ cells obtained from B6xCAST F1 mice. H3K4me3 are present at recombination hotspots, TSS, enhancers etc. 

Once we obtained the FASTQ files, I used the HiC-pro pipeline and then used hichipper to call the peaks. We also fed in our bed file (H3K4me3 locations in BxC germ cells) as anchor points to call the peaks. Once we got the peaks, we performed custom analysis in R to determine what genomic regions contacts the hotspots/TSS/enhancers etc. 
