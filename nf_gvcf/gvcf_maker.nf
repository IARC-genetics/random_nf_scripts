
params.fasta_ref= "/data/gep/mutographs/files/GRCh38_full_analysis_set_plus_decoy_hla/genome.fa"
// output name for the final vcf
params.output_name= "test"
// a text file of each VCF, one per a line
params.sampleslist= "/data/gep/mutographs/work/atkinsj/nextflow/gvcf_maker/test_vcfs.txt"
// publish dir
params.outdir= "/data/gep/mutographs/work/atkinsj/nextflow/gvcf_maker/"
// Path to app files
params.gvcfcaller= "/data/gep/mutographs/work/atkinsj/nextflow/gvcf_maker/gvcfgenotyper"
//SNPSift java file from SNPeff
params.snpeff="/scratch/atkinsj/snpeff/SnpSift.jar"
params.plink="~/bin/plink2" 

// DBSNP vcf file
params.vcf_name= "/scratch/atkinsj/snpeff/dbsnp150.vcf"


process chr1 {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chr1.vcf.gz" into chr1_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chr1.vcf.gz -r chr1

  """
}
process chr2 {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chr2.vcf.gz" into chr2_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chr2.vcf.gz -r chr2

  """
}
process chr3 {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chr3.vcf.gz" into chr3_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chr3.vcf.gz -r chr3

  """
}
 process chr4 {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chr4.vcf.gz" into chr4_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chr4.vcf.gz -r chr4

  """
}
process chr5 {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chr5.vcf.gz" into chr5_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chr5.vcf.gz -r chr5

  """
}
process chr6 {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chr6.vcf.gz" into chr6_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chr6.vcf.gz -r chr6

  """
}
process chr7 {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chr7.vcf.gz" into chr7_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chr7.vcf.gz -r chr7

  """
}
process chr8 {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chr8.vcf.gz" into chr8_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chr8.vcf.gz -r chr8

  """
}
process chr9 {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chr9.vcf.gz" into chr9_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chr9.vcf.gz -r chr9

  """
}
 process chr10 {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chr10.vcf.gz" into chr10_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chr10.vcf.gz -r chr10

  """
}
process chr11 {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chr11.vcf.gz" into chr11_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chr11.vcf.gz -r chr11

  """
}
process chr12 {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chr12.vcf.gz" into chr12_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chr12.vcf.gz -r chr12

  """
}
process chr13 {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chr13.vcf.gz" into chr13_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chr13.vcf.gz -r chr13

  """
}
 process chr14 {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chr14.vcf.gz" into chr14_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chr14.vcf.gz -r chr14

  """
}
process chr15 {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chr15.vcf.gz" into chr15_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chr15.vcf.gz -r chr15

  """
}
process chr16 {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chr16.vcf.gz" into chr16_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chr16.vcf.gz -r chr16

  """
}
process chr17 {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chr17.vcf.gz" into chr17_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chr17.vcf.gz -r chr17

  """
}
process chr18 {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chr18.vcf.gz" into chr18_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chr18.vcf.gz -r chr18

  """
}
process chr19 {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chr19.vcf.gz" into chr19_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chr19.vcf.gz -r chr19

  """
}
 process chr20 {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chr20.vcf.gz" into chr20_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chr20.vcf.gz -r chr20

  """
}
process chr21 {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chr21.vcf.gz" into chr21_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chr21.vcf.gz -r chr21

  """
}
process chr22 {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chr22.vcf.gz" into chr22_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chr22.vcf.gz -r chr22

  """
}
process chrX {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chrX.vcf.gz" into chrX_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chrX.vcf.gz -r chrX

  """
}
 process chrY {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val x from params.sampleslist
  val caller from params.gvcfcaller
  val p from params.gvcfcaller
  val fasta from params.fasta_ref
  
  output:
  file "chrY.vcf.gz" into chrY_gvcf
  script:
  """
  $p -l $x -f $fasta -Oz -o chrY.vcf.gz -r chrY

  """
}

 process put_together {
errorStrategy 'terminate'
 memory "32 GB"
 cpus 8
 conda 'bcftools'
  input:
  val chr1 from chr1_gvcf
  val chr2 from chr2_gvcf
  val chr3 from chr3_gvcf
  val chr4 from chr4_gvcf
  val chr5 from chr5_gvcf
  val chr6 from chr6_gvcf
  val chr7 from chr7_gvcf
  val chr8 from chr8_gvcf
  val chr9 from chr9_gvcf
  val chr10 from chr10_gvcf
  val chr11 from chr11_gvcf
  val chr12 from chr12_gvcf
  val chr13 from chr13_gvcf
  val chr14 from chr14_gvcf
  val chr15 from chr15_gvcf
  val chr16 from chr16_gvcf
  val chr17 from chr17_gvcf
  val chr18 from chr18_gvcf
  val chr19 from chr19_gvcf
  val chr20 from chr20_gvcf
  val chr21 from chr21_gvcf
  val chr22 from chr22_gvcf
  val chrX from chrX_gvcf
  val chrY from chrY_gvcf
  
  output:
  file "combined.vcf.gz" into combined
  script:
  """
  bcftools concat -O z -o combined.vcf.gz --threads 8 $chr1 $chr2 $chr3 $chr4 $chr5 $chr6 $chr7 $chr8 $chr9 $chr10 $chr11 $chr12 $chr13 $chr14 $chr15 $chr16 $chr17 $chr18 $chr19 $chr20 $chr21 $chr22 $chrX $chrY

  """
}

 process dbsnp_annotate {
errorStrategy 'terminate'
memory "120 GB"
cpus 4
input:
val snpeff from params.snpeff
val v from params.vcf_name
val input_file from combined

output: 
file "outfile.vcf" into dbsnp  
script:
  """
  java -Xmx120g -jar $snpeff annotate -id $v $input_file > outfile.vcf
  
  
  """
}


 process make_plink_file {
errorStrategy 'terminate'
publishDir params.outdir , mode: 'copy' 
memory "120 GB"
cpus 16
input:

val p from params.plink
val output_name from params.output_name
val dbsnp_vcf from dbsnp

  
output:
file "${output_name}.pvar"
file "${output_name}.psam"
file "${output_name}.pgen"

  script:
  """
  $p --vcf $dbsnp_vcf --memory 120000 --threads 16 --make-pfile --out $output_name
  
  """
}
