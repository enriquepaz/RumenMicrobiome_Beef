# Create an environment and install dependencies
# Install software and dependencies to create reproducible environment
# used in this study

# ensure pwd is the cloned repository
result=${PWD##*/}
if [ "$result" != "RumenMicrobiome_FeedEfficiency_Beef" ]
then
	printf "\nCurrent directory is not the cloned repository.\nSee https://github.com/enriquepaz/rumen_microbiome_feed_efficiency_beef for details.\n\n"
	exit 1
fi

# ensure provided link to usearch download
if [ "$1" = "" ]; then
    printf "\nProvide a link for USEARCH download (from email) as argument.\nGet a license from http://www.drive5.com/usearch/download.html\nSee https://github.com/enriquepaz/rumen_microbiome_feed_efficiency_beef for details.\n\n"
    exit 1
fi

cd ..
 
# anaconda 
wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.3.0-Linux-x86_64.sh
bash Anaconda*.sh
anaconda/bin/conda create -n microbiomeBeef python=2.7 qiime
source anaconda/bin/activate microbiomeBeef
rm Anaconda-2.3.0-Linux-x86_64.sh

# r
conda install -c r rpy2=2.5.6 r-devtools=1.9.1 r-curl=0.9.4 
conda install -c r r=3.2.2

# pandoc
conda install -c https://conda.binstar.org/asmeurer pandoc

# R packages
printf "\nInstallation of R packages will take some time, be patient. No interaction needed\n"
R CMD BATCH RumenMicrobiome_FeedEfficiency_Beef/scripts/install_pack.R

# mothur
wget https://github.com/mothur/mothur/releases/download/v1.36.1/Mothur.mac_64.OSX-10.9.zip
unzip Mothur.mac_64.OSX-10.9.zip
mv mothur/mothur anaconda/envs/microbiomeBeef/bin/
rm -r mothur
rm -r __MACOSX
rm -r Mothur.mac_64.OSX-10.9.zip

# usearch
wget -O anaconda/envs/microbiomeBeef/bin/usearch7.0.1090 $1
chmod 775 anaconda/envs/microbiomeBeef/bin/usearch7.0.1090
#mv usearch7.0.10 anaconda/envs/microbiomeBeef/bin/













