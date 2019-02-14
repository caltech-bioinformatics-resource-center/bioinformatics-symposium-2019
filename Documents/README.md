# Tips for software installation

# Cheatsheet: commonly used commands for kallisto and BUStools


# Walkthrough: How to download sequencing data from the SRA 

In this example we will look at some bulk RNA-seq samples from the 2018 article [Sirt1 protects from K-Ras-driven lung carcinogenesis](https://doi.org/10.15252/embr.201643879). Let's try to download the reads for sample `GSM3168965` from RNA-Seq experiment `GSE115179`. 
The GEO ("Gene Expression Omnibus") page for this experiment is  https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE115179

Notice that there is no download option for the raw data anywhere - only for summaries of the data. The [GEO help page](https://www.ncbi.nlm.nih.gov/geo/info/download.html) simply says:
_All the data in GEO can be downloaded in a variety of formats using a variety of mechanisms._

In this example (and very often) the data that we want is actually hosted on the [Sequence Read Archive (SRA)](https://www.ncbi.nlm.nih.gov/sra), so the sample `GSM3168965` gets another identifier associated to it. In the SRA it's known as `SRR7244429`. And on the sample's SRA page you can actually look at individual reads from the sequencing run (click on the `Reads` tab): https://trace.ncbi.nlm.nih.gov/Traces/sra/?run=SRR7244429


But we can't download it directly. We need to use the `NCBI SRA Toolkit`, available at: https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=software. Development information is on their github repository: https://github.com/ncbi/sra-tools. After the toolkit is installed, we can download the files using the tool `fastq-dump`, documented at: https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=software.


Specifically, for this sample we'd use the command: `fastq-dump -I --split-files SRR7244429`
Because it's a paired end read Illumina run it produces two `.fastq` files

This downloads two files of 3.7GB each, `SRR7244429\_1.fastq` and `SRR7244429\_2.fastq`. You have to hope your connection doesn't get interrupted.  If you are unhappy with the official documentation (as many are), here is an additional helpful resource: https://edwards.sdsu.edu/research/fastq-dump/

Thankfully, there is a (much much) faster option: `fasterq-dump` (but it's only available for Mac and Linux): https://github.com/ncbi/sra-tools/wiki/HowTo:-fasterq-dump

If you decide to use `fasterq-dump`, you can download the data with the command `fasterq-dump SRR7244429`

Finally, to help you navigate the confusing and teacherous world of getting other people's data in bioinformatics (welcome!) below is a helpful diagram of how to find the sample SRA identifier, which is what you need to run `fastq-dump` or `fasterq-dump`. Get used to this gymnastics, being able to do it is like having a super power.



![SRA_download](https://github.com/caltech-bioinformatics-resource-center/bioinformatics-symposium-2019/blob/master/Hands-on%20Part2%20PYTHON%20NOTEBOOK/GEO_to_SRA.png)
