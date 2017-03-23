# Create a reproducible environment as the one used in this study
# Install software and dependencies

# ensure pwd is the cloned repository
result=${PWD##*/}
if [ "$result" != "RumenMicrobiome_Beef" ]
then
	printf "\nCurrent directory is not the cloned repository.\nSee https://github.com/enriquepaz/RumenMicrobiome_Beef for details.\n\n"
	exit 1
fi

# Miniconda 
wget https://repo.continuum.io/miniconda/Miniconda2-4.3.11-Linux-x86_64.sh
bash Miniconda2-4.3.11-Linux-x86_64.sh -b -p anaconda
rm Miniconda2-4.3.11-Linux-x86_64.sh

#Create environments
anaconda/bin/conda create -y -n qiimemothur --file qiime_mothur_packages.txt -c bioconda -c r -c biobuilds
#source anaconda/bin/activate qiimemothur
#appnope=0.1.0=py27_0 #conda install -c isuruf appnope=0.1.0.p0 
#ipython 5.1.0 py27_1 #conda install -c anaconda ipython=5.3.0
#conda install pandoc

anaconda/bin/conda create -y -n r --file r_packages.txt -c bioconda -c r -c biobuilds
#source anaconda/bin/activate r
#conda install pandoc
#conda install -c bioconda r-vegan=2.3_4
#conda install -c bioconda r-matrixstats=0.51.0
#conda install -c bioconda r-biom=0.3.12

#sra 
wget ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-centos_linux64.tar.gz
tar -xzf sratoolkit.current-centos_linux64.tar.gz
rm sratoolkit.current-centos_linux64.tar.gz

