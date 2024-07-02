#Configs
#---------
user_n=$(whoami)
RefGenome="/home/$user_n/DataSets/CustomChrs/chr21NoN.fna"
OutputLoc="/home/$user_n/Outputs/wgsim_out/"
OutputFname="chr21reads"

r1Len=150
r2Len=150
#This can require some manual configuration to acheive the coverage you want
#coverage = totalReads * readLength * 2(or r1Len+r2Len if they are different) / length of genome
#alternatively if not using paired end reads scrap the '* 2' part
#this is setup for chromosome 21 (length ~48mil) 10x coverage (10 = )
TotalReads=1600000
BaseErr=0.01
IndelFrac=0.10

MutRate=0.0
#---------

./wgsim -R $IndelFrac -e $BaseErr -1 $r1Len -2 $r2Len -N $TotalReads $RefGenome "${OutputLoc}${OutputFname}_R1_L${r1Len}.fastq" "${OutputLoc}${OutputFname}_R2_L${r2Len}.fastq" "${OutputLoc}${OutputFname}_R1_L${r1Len}_TRUE.fastq" "${OutputLoc}${OutputFname}_R2_L${r1Len}_TRUE.fastq" 1>"${OutputLoc}${OutputFname}_logfile.txt" 2>"${OutputLoc}${OutputFname}_err.txt"