## A small script to retrieve DNA and mRNA sequence around fusion breakpoints

### Prerequisite

This script uses the [sequence](http://varianttools.sourceforge.net/VtoolsReport/Sequence) reporting tool of [variant tools](https://github.com/vatlab/VariantTools)
to retrieve RNA sequences around a fusion breakpoint. Please install variant tools from github before you try to use it.

```
git clone http://github.com/vatlab/VariantTools.git
cd VariantTools
python setup.py install
```

### Workflows

This script defines a `RNA` workflow to output RNA transcripts to the left and right of the breakpoint


```
$ sos run Fusion_sequences RNA --break-point 'chr1:186337017>chr1:89251786' --gene1 TPR --gene2 PKN2
INFO: Executing RNA_0: Get RNA sequence for a particular fusion candidate with parameter break_point:  break point in the format of chr1:pos1>chr2:pos2 gene1:  5-prime gene gene2:  3-prime gene
INFO: input:    []

==> TPR > PKN2  chr1:186337017>chr1:89251786 (- +)
NM_003292      CTTAATTAGAACCAATGAGAGACTATCTCAAGAACTTGAATACTTAACAG

NM_006256      ATGATGTCTGTGCTGTTTTGAAGCTCGATAATACTGTGGTTGGCCAAACT
INFO: output:   []
INFO: Workflow RNA (ID=4b7504c974f4e249) is executed successfully.
```

You can use options `--lead` to define length of sequences, and `--filename` to output to specified file.

```
$ sos run Fusion_sequences RNA --break-point 'chr1:186337017>chr1:89251786' --gene1 TPR --gene2 PKN2 --lead 100 --filename output.txt
$ cat output.txt

==> TPR > PKN2  chr1:186337017>chr1:89251786 (- +)
NM_003292      AGCCAATTTACAAGAACAAAGGAAGAATTAGAAGCTGAGAAAAGAGACTTAATTAGAACCAATGAGAGACTATCTCAAGAACTTGAATACTTAACAG

NM_006256      ATGATGTCTGTGCTGTTTTGAAGCTCGATAATACTGTGGTTGGCCAAACTAGCTGGAAACCCATTTCCAATCAGTCATGGGACCAGAAGTTTACACTGGA
```

Another workflow `RNA-all` get fusions from `fusions.xls` (actually a tab-delimited text file) for all samples in the current directory. They are written for a 
particular workflow that filters fusions using oncofuse on tophat generated fusion candidates. It is kept as examples of how to use input loop and
how to call nested workflows.
