## Pie charts and bar charts for the Palmer Penguin data set in Base R

# inspired by Equitable Equations https://www.youtube.com/watch?v=ueLozxgEnDc&t=72s

# load package
library(palmerpenguins)

# read help file
help(palmerpenguins)

# read citation
citation("palmerpenguins")

# print citation in text style
print(citation("palmerpenguins"), style = "text")
Horst AM, Hill AP, Gorman KB (2020). _palmerpenguins: Palmer
Archipelago (Antarctica) penguin data_. doi:10.5281/zenodo.3960218
<https://doi.org/10.5281/zenodo.3960218>, R package version 0.1.0,
<https://allisonhorst.github.io/palmerpenguins/>.

# load up the path to the data file
path_to_file("penguins_raw.csv")
[1] "/usr/lib/R/site-library/palmerpenguins/extdata/penguins_raw.csv"

# look at the first 6 rows of dataframe
head(read.csv(path_to_file("penguins.csv")))
  species    island bill_length_mm bill_depth_mm flipper_length_mm body_mass_g
1  Adelie Torgersen           39.1          18.7               181        3750
2  Adelie Torgersen           39.5          17.4               186        3800
3  Adelie Torgersen           40.3          18.0               195        3250
4  Adelie Torgersen             NA            NA                NA          NA
5  Adelie Torgersen           36.7          19.3               193        3450
6  Adelie Torgersen           39.3          20.6               190        3650
     sex year
1   male 2007
2 female 2007
3 female 2007
4   <NA> 2007
5 female 2007
6   male 2007

# check the structure of the dataframe

str(read.csv(path_to_file("penguins.csv")))
'data.frame':	344 obs. of  8 variables:
 $ species          : chr  "Adelie" "Adelie" "Adelie" "Adelie" ...
 $ island           : chr  "Torgersen" "Torgersen" "Torgersen" "Torgersen" ...
 $ bill_length_mm   : num  39.1 39.5 40.3 NA 36.7 39.3 38.9 39.2 34.1 42 ...
 $ bill_depth_mm    : num  18.7 17.4 18 NA 19.3 20.6 17.8 19.6 18.1 20.2 ...
 $ flipper_length_mm: int  181 186 195 NA 193 190 181 195 193 190 ...
 $ body_mass_g      : int  3750 3800 3250 NA 3450 3650 3625 4675 3475 4250 ...
 $ sex              : chr  "male" "female" "female" NA ...
 $ year             : int  2007 2007 2007 2007 2007 2007 2007 2007 2007 2007 ...

# load R color brewer library for Dark2 palette
library(RColorBrewer)

# I plan to use the first 3 colours of the Dark Accent palette
brewer.pal(3,"Dark2")
[1] "#1B9E77" "#D95F02" "#7570B3"

# Okay being serious now here are my data preparation steps
penguins <- read.csv(path_to_file("penguins.csv"))
pen_sum <- as.numeric(table(penguins[["species"]]))
labels <- names(table(penguins[["species"]]))
labels <- paste(labels, pen_sum)

# print pen_sum
pen_sum
[1] 152  68 124
# print labels
labels
[1] "Adelie 152"   "Chinstrap 68" "Gentoo 124"

# Here is my Base R pie chart script
pie(pen_sum,radius=0.99,init.angle =90, col = brewer.pal(3,"Dark2"), labels=labels, main = expression(paste("Palmer Penguins pie chart")), sub =expression(paste("https://allisonhorst.github.io/palmerpenguins/")))

# Here is my Base R barplot script
barplot(pen_sum,las =1, names=labels,col = brewer.pal(3,"Dark2"),main = expression(paste("Palmer Penguins bar chart"))) +
mtext(side=1,cex=1,line=3,"Palmer Penguins https://allisonhorst.github.io/palmerpenguins/")

# create .svg format barplot
svg(filename="barplot-720by540.svg", width = 8, height = 6, pointsize = 14, onefile = FALSE, family = "sans", bg = "white", antialias = c("default", "none", "gray", "subpixel"))
barplot(pen_sum,las =1, names=labels,col = brewer.pal(3,"Dark2"),main = expression(paste("Palmer Penguins bar chart"))) +
mtext(side=1,cex=1,line=3,"Palmer Penguins https://allisonhorst.github.io/palmerpenguins/")
dev.off()
![](barplot-720by540.svg)

# create .svg format pie chart
svg(filename="piechart-720by540.svg", width = 8, height = 8, pointsize = 14, onefile = FALSE, family = "sans", bg = "white", antialias = c("default", "none", "gray", "subpixel"))
pie(pen_sum,radius=0.99,init.angle =90, col = brewer.pal(3,"Dark2"), labels=labels, main = expression(paste("Palmer Penguins pie chart")), sub =expression(paste("https://allisonhorst.github.io/palmerpenguins/")))
dev.off()
![](piechart-720by540.svg)

# load knitr package
library(knitr)

knitr::spin(hair = "Readme.r",
          knit=TRUE,        # knit doc
          format = "Rmd",
          precious = TRUE,  # keep intermediate files
          )
