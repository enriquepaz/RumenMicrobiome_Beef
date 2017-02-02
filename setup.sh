# Create a reproducible environment as the one used in this study
# Install software and dependencies

# ensure pwd is the cloned repository
result=${PWD##*/}
if [ "$result" != "RumenMicrobiome_Beef" ]
then
	printf "\nCurrent directory is not the cloned repository.\nSee https://github.com/enriquepaz/RumenMicrobiome_Beef for details.\n\n"
	exit 1
fi

# ensure provided link to usearch download
if [ "$1" = "" ]
then
    printf "\nProvide a link for USEARCH download (from email) as argument.\nGet a license from http://www.drive5.com/usearch/download.html\nSee https://github.com/enriquepaz/rumen_microbiome_feed_efficiency_beef for details.\n\n"
    exit 1
fi

# anaconda 
cd ..
wget https://repo.continuum.io/archive/Anaconda2-4.3.0-Linux-x86_64.sh
bash Anaconda2-4.3.0-Linux-x86_64.sh
anaconda2/bin/conda create -n microbiomeBeef python=2.7
source anaconda2/bin/activate microbiomeBeef
pip install --upgrade setuptools
pip install https://github.com/biocore/qiime/archive/1.9.1.tar.gz
rm Anaconda2-4.3.0-Linux-x86_64.sh

# r
conda install -c r rpy2=2.5.6 r-devtools=1.9.1 r-curl=0.9.4 
conda install -c r r=3.2.2

# pandoc
conda install -c https://conda.binstar.org/asmeurer pandoc

# R packages
printf "\nInstallation of R packages will take some time, be patient. No interaction needed.\n\n"
R CMD BATCH RumenMicrobiome_Beef/scripts/install_pack.R
rm install_pack.Rout

# mothur
wget https://github.com/mothur/mothur/releases/download/v1.39.0/Mothur.linux_64.zip
unzip Mothur.linux_64.zip
mv mothur/mothur anaconda2/envs/microbiomeBeef/bin/
rm -r mothur
rm -r __MACOSX
rm -r Mothur.linux_64.zip

# usearch
wget -O anaconda2/envs/microbiomeBeef/bin/usearch7.0.1090 $1
chmod 775 anaconda2/envs/microbiomeBeef/bin/usearch7.0.1090

#sra 
wget ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-centos_linux64.tar.gz
tar -xzf sratoolkit.current-centos_linux64.tar.gz
rm sratoolkit.current-centos_linux64.tar.gz










