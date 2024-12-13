# load knitr package
library(knitr)

knitr::spin(hair = "Readme.r",
          knit=TRUE,        # knit doc
          format = "Rmd",
          precious = TRUE,  # keep intermediate files
          )
