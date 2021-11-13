import os
import sys
import pandas as pd
import argparse

def check_arg(args=None):
    parser = argparse.ArgumentParser(description='Clean sumstats remove dup rsid and nans' ,formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument('-i', '--input', help='Input file ',required='True')
    parser.add_argument('-s', '--snplist', help='The name of SNP column ', required='True' )
    parser.add_argument('-o', '--output', help='output file', default='output.txt')
    results = parser.parse_args(args)
    return (results.input , results.snplist , results.output) 

def main(infile, snplist , output):
    sumstats = pd.read_csv(infile, delimiter=r"\s+")
    SNP_list = pd.read_csv(snplist, delimiter=r"\s+")
    clean = (sumstats[sumstats["SNP"].isin(SNP_list.SNP)])
    clean.to_csv(output, sep="\t", index=None)

if __name__ == '__main__':
    raw , snp , output  = check_arg(sys.argv[1:])
    main(raw, snp , output )