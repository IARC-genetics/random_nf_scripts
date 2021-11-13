params.samples = "ids.txt"
params.snpeff= "/scratch/atkinsj/snpeff"
params.vcf_name = "/scratch/atkinsj/snpeff/dbsnp150.vcf"
params.dbnsfp_reference = "/scratch/atkinsj/RCC/dbNSFP4.1a.txt.gz"
samples = Channel.from(file(params.samples).readLines().each{file(it)})
params.outdir = "./"
params.strelka2_path = '/data/gep/mutographs/files/Germline/RCC/RCC_Manuscript/03_15_2021_strelka2/' 


process clean_calls {
errorStrategy 'terminate'
 memory "32 GB"
 

  input:
  
  val x from samples
	val c from params.strelka2_path
  val p from params.snpeff
  

  output:
  file "${x}.ann.vcf" into clean_vcf
  file "${x}.ann.vcf" into clean_vcf1
  val "${x}" into ids
  val "${x}" into ids1
  script:
  """
  java -Xmx32g -jar $p/SnpSift.jar filter " (FILTER = 'PASS') " $c${x}/variants/genome.vcf.gz > ${x}.temp
  java -Xmx32g -jar $p/snpEff.jar GRCh38.99 ${x}.temp > "${x}.ann.vcf"


  """
}
 
process missense { 

errorStrategy 'terminate'
publishDir params.outdir , mode: 'copy' 
memory "32 GB"

input:
file snpeff from clean_vcf
val id from ids
val p from params.snpeff
val v from params.vcf_name
val db from params.dbnsfp_reference

output: 
file "${id}.miss.txt"

script:
"""
java -Xmx32g -jar $p/SnpSift.jar filter "(ANN[0].EFFECT = 'missense_variant') " ${snpeff} > miss.temp 
java -Xmx32g -jar $p/SnpSift.jar annotate -id $v miss.temp > miss.temp1
java -Xmx32g -jar $p/SnpSift.jar dbnsfp -v -db $db  -f SIFT_pred,Polyphen2_HDIV_pred,Polyphen2_HVAR_pred,MetaLR_pred,clinvar_id,clinvar_clnsig,clinvar_trait,gnomAD_genomes_AC,gnomAD_genomes_AF,GTEx_V8_gene,GTEx_V8_tissue  miss.temp1 > miss.ann.temp
java -Xmx32g -jar $p/SnpSift.jar  extractFields -e "." miss.ann.temp CHROM POS ID REF ALT EFF[0].GENE EFF[0].IMPACT EFF[0].EFFECT GEN[*].GT dbNSFP_SIFT_pred dbNSFP_Polyphen2_HDIV_pred dbNSFP_Polyphen2_HVAR_pred dbNSFP_MetaLR_pred dbNSFP_gnomAD_genomes_AC dbNSFP_gnomAD_genomes_AF dbNSFP_clinvar_id dbNSFP_clinvar_clnsig dbNSFP_clinvar_trait > ${id}.miss.txt

""" 
}

process high_impact { 

errorStrategy 'terminate'
publishDir params.outdir , mode: 'copy' 
memory "32 GB"

input:
val p from params.snpeff
file snpeff from clean_vcf1
val v from params.vcf_name
val db from params.dbnsfp_reference
val id from ids1

output: 
file "${id}.high.txt"


script:

"""

java -Xmx32g -jar $p/SnpSift.jar filter "(ANN[0].IMPACT = 'HIGH') & (ANN[0].EFFECT !='structural_interaction_variant')  " ${snpeff} > high.temp 
java -Xmx32g -jar $p/SnpSift.jar annotate -id $v high.temp > high.temp1
java -Xmx32g -jar $p/SnpSift.jar dbnsfp -v -db $db  -f SIFT_pred,Polyphen2_HDIV_pred,Polyphen2_HVAR_pred,MetaLR_pred,clinvar_id,clinvar_clnsig,clinvar_trait,gnomAD_genomes_AC,gnomAD_genomes_AF,GTEx_V8_gene,GTEx_V8_tissue  high.temp1 > high.ann.temp
java -Xmx32g -jar $p/SnpSift.jar  extractFields -e "." high.ann.temp CHROM POS ID REF ALT EFF[0].GENE EFF[0].IMPACT EFF[0].EFFECT GEN[*].GT dbNSFP_SIFT_pred dbNSFP_Polyphen2_HDIV_pred dbNSFP_Polyphen2_HVAR_pred dbNSFP_MetaLR_pred dbNSFP_gnomAD_genomes_AC dbNSFP_gnomAD_genomes_AF dbNSFP_clinvar_id dbNSFP_clinvar_clnsig dbNSFP_clinvar_trait > ${id}.high.txt

""" 
}