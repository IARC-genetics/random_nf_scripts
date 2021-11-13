//quick script to clump summary stats
params.plink_1000G_ref="/scratch/atkinsj/plink_clump/1000G_P3"
params.plink="~/bin/plink" 
params.r2=0.01
params.clump_kb=10000 
params.clump_P = 0.00000005
params.infile="/scratch/atkinsj/LD_score/lung_fibrosis/finngen_R4_ILD"
params.outfile="summary_stats_0.01.txt"
params.snpcol_name="rsids"
params.pcol_name="pval"
params.path="/data/gep/mutographs/work/atkinsj/nextflow/nf_clump"


process clean_sumstats { 

    errorStrategy 'terminate'

    input:
    val file_name from params.infile
    val P from params.pcol_name
    val SNP from params.snpcol_name
    val path from params.path
    
    output:
    file "for_clump.txt" into clean_sum
    file "for_clump.txt" into clean1
    script:
     """
  python $path/clean.py -i $file_name -p $P -s $SNP -o for_clump.txt

  """
}

process plink {
errorStrategy 'terminate'
 memory "32 GB"
  input:
  val plink_ref from params.plink_1000G_ref
  val plink from params.plink
  val r2 from params.r2
  val kb from params.clump_kb 
  val pval from params.clump_P
  val file_name from clean_sum
  output:
  file "keep.clumped" into plink
  script:
  """
  $plink --bfile $plink_ref --clump $file_name --clump-kb $kb --clump-r2 $r2 --clump-p1 $pval --out keep

  """
}

process extract_variants { 

  errorStrategy 'terminate'
  publishDir params.path , mode: 'copy' 
    input:
    val file_name from plink
    val input_name from clean1
    val out from params.outfile
    val path from params.path
    
    
    output:
    file "${out}" 
    
    script:
     """
  python $path/create_sum.py -i $input_name -s $file_name -o $out

  """
 }


