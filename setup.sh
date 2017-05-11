# Create a reproducible environment as the one used in this study
# Install software and dependencies

# ensure pwd is the cloned repository
result=${PWD##*/}
if [ "$result" != "2017_RumenMicrobiome_Beef" ]
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

anaconda/bin/conda create -y -n r --file r_packages.txt -c bioconda -c r -c biobuilds

#sra 
wget ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-centos_linux64.tar.gz
tar -xzf sratoolkit.current-centos_linux64.tar.gz
rm sratoolkit.current-centos_linux64.tar.gz
