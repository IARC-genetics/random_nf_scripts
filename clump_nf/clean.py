import os
import sys
import pandas as pd
import argparse

def check_arg(args=None):
    parser = argparse.ArgumentParser(description='Clean sumstats remove dup rsid and nans' ,formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument('-i', '--input', help='Input file ',required='True')
    parser.add_argument('-p', '--pval', help='The name of pval column',required='True' )
    parser.add_argument('-s', '--snp', help='The name of SNP column ', required='True' )
    parser.add_argument('-o', '--output', help='output file', default='for_clump.txt')
    results = parser.parse_args(args)
    return (results.input , results.pval , results.snp , results.output) 

def main(infile, pval , snp , output):
    raw = pd.read_csv(infile, delimiter=r"\s+")
    raw.rename({ snp:'SNP', pval: 'P'}, axis=1, inplace=True)
    raw1 = raw.dropna()
    raw2 = raw1.drop_duplicates(subset=['SNP'])
    raw2.to_csv("for_clump.txt",sep="\t",index=None)

if __name__ == '__main__':
    raw, pval , snp , output  = check_arg(sys.argv[1:])
    main(raw, pval , snp , output )