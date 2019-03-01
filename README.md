# RNASeqProject
Using Galaxy to compare several bioinformatics pipelines for differential gene expression in Drosophila

## Galaxy on BisonNet
https://galaxy.bucknell.edu

# Galaxy Tutorial

1. Log into https://galaxy.bucknell.edu and take the interactive tours of the `Galaxy UI` and `History`
2. In Lab last week we have already accomplished:
- Downloading the data from the sequence read archive (see below for links to the samples)
- Trimming the data to remove adapters and poor quality reads using trimmomatic
- Assessing the quality of the data using FastQC
3. Transfer the trimmed reads from the Data Library
- Click on `Shared Data`... `Data Libraries`
- Select "RNASeq Group Project" and then choose all of the files.
- Click `To History`, `as Datasets`, and then `Import`
- Click on the Galaxy logo in the top left to return to the Analysis page.
- The data files should be in the History panel on the right.
4. Pseudoaligning the reads to a transcriptome
- In the tool panel, search for Salmon
- Select the following options for Salmon
  - Use a built-in index? Use one from the history
  - Select the reference transcriptome: Drosophila_melanogaster.BDGP6.cdna.all.fa.gz
  - kmerLen: 21
  - Is this library mate-paired? Single-end
  - FASTQ/FASTA file: Trimmomatic on S2_DRSC_Untreated-1
  - Specify the strandedness of the reads: Not stranded (U)
  - File containing a mapping of transcripts to genes: Drosophila_melanogaster.BDGP6.95.chr.gtf.gz
- Leave all of the other options as the defaults, and click `Execute`
5. After that job successfully runs on BisonNet, click the 'Eye' icon to view the results.
- You should see two results files, one for genes and the other for transcripts.
- Each should have a 5 column table that includes the transcripts per million mapped reads (TPM) and the number of reads (numReads) mapped to each gene/transcript.
6. Click one of the results files in the History panel and then click `Run this job again`.
- Leave all settings the same except change the the FASTQ/FASTA file to Trimmomatic on S2_DRSC_CG8144_RNAi-1.
- Click `Execute`
7. While that is running use `Run this job again` to set up one of the paired read files to run:
- Change Is this library mate-paired? to Paired-end
- Select Mate pair 1: Trimmomatic on S2_DRSC_Untreated-3_R1
- Select Mate pair 2: Trimmomatic on S2_DRSC_Untreated-3_R2
- Double check that you have R1 for Mate pair 1, R2 for Mate pair 2, and both come from the same sample
- Click `Execute`
8. Now set up the other three paired samples. (You can fill up the queue and then grab a beverage while you wait.)
9. 


## Brooks et al. 
Conservation of an RNA regulatory map between Drosophila and mammals
https://genome.cshlp.org/content/21/2/193.full

### Samples
Untreated samples: 

- SRR031711 http://www.ncbi.nlm.nih.gov/Traces/sra/?run=SRR031711
- SRR031714 http://www.ncbi.nlm.nih.gov/Traces/sra/?run=SRR031714
- SRR031716 http://www.ncbi.nlm.nih.gov/Traces/sra/?run=SRR031716

RNAi-treated samples

+ SRR031718 http://www.ncbi.nlm.nih.gov/Traces/sra/?run=SRR031718
+ SRR031724 http://www.ncbi.nlm.nih.gov/Traces/sra/?run=SRR031724
+ SRR031726 http://www.ncbi.nlm.nih.gov/Traces/sra/?run=SRR031726

## Williams et al. 2017
Empirical assessment of analysis workflows for differential expression analysis of human samples using RNA-Seq
https://doi.org/10.1186/s12859-016-1457-z
