all: code/02_analyse.html output/figure_1.pdf

clean:
	rm -f data/data_clean/*.* ouputt/*.*\
	code/*.html code/*.md output/*.*
	rm -r code/02_analyse_files
	
data/clean/mpg_data_clean.csv: code/01_import-and-clean.R data/raw/mpg_data.csv
		Rscript -e 'rmarkdown::render("$<")'

code/02_analyse.html output/figure_1.pdf: code/02_analyse.Rmd data/clean/mpg_data_clean.csv
		Rscript -e 'rmarkdown::render("$<")'