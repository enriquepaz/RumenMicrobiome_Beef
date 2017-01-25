# Create an environment and install dependencies
# This first part of the anlaysis is to install the dependency 
# software and associated packages in the hopes of creating a reproducible 
# environment to work from over time. 

# ensure pwd is the cloned repository
result=${PWD##*/}
if [ "$result" != "rumen_microbiome_feed_efficiency_beef" ]
then
	printf "\nCurrent directory is not the cloned repository.\nSee https://github.com/enriquepaz/rumen_microbiome_feed_efficiency_beef for details.\n\n"
	exit 1
fi