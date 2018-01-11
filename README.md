:computer: :bar_chart:
Analyses to recreate the results in the manuscript **"Rumen bacterial community structure impacts feed efficiency in beef cattle"** by Paz et al. 2017 in JAS. The analyses are separated into several R Markdown files.

Follow the instructions below to setup the same environment used to analyze the data and render the R Markdown files. Adhere to the delineated order as succeeding R Markdown files depend on previous results. If working in a server, setup X11 forwarding.

    1. data_curation.Rmd
	2. generate_OTU_table.Rmd
	3. qc_bacterial.Rmd
	4. feed_efficiency_phenotype.Rmd
	5. alpha_diversity.Rmd
	6. beta_diversity.Rmd
	7. differential_OTUs.Rmd
	8. differentially_abundant_families.Rmd
    9. forward_stepwise_regression.Rmd
    10. forward_stepwise_regression_family.Rmd

Due to licensing constraints, USEARCH could not be included in the setup. The current dataset requires more than the 4Gb RAM allowed in the no-charge 32-bit version, thus the paid license Linux [USEARCH 64-bit version](http://drive5.com/usearch/buy64bit.html) was used. USEARCH outputs required in the analyses are provided in the usearch_outputs directory.

**Create the environment**

Clone the github repository and run the setup.sh script

- git clone https://github.com/enriquepaz/RumenMicrobiome_Beef.git
- cd RumenMicrobiome_Beef
- ./setup.sh

**Render R Markdown files**

Within the RumenMicrobiome_Beef directory

- source anaconda/bin/activate qiimemothur
- anaconda/envs/r/bin/Rscript -e "rmarkdown::render('file[1-8].Rmd')"








