library(checker)
library(dplyr)
pak <- read.csv(
  text = "package, recommended, minimum, message
        tidyverse, \"2.0\", \"1.3\", NA
        usethis, 2.2, NA, NA
        quarto, 1.3, 1.0, NA
        lme4, NA, NA, NA
        DHARMa, NA, NA, NA
        performance, NA, NA, NA",
  strip.white = TRUE
) |> mutate(across(c(recommended, minimum), as.character))

prog <- read.csv(text = "program, recommended, minimum, message
             rstudio, 2022.12.0.353, NA, NA
             R, 4.3, 4.2, NA
             git, 2.9, NA, NA
             quarto, 1.3, 1.0, NA",
             strip.white = TRUE)
opt <- read.csv(text = 'option, value, message
             "save_workspace", "never", NA
             "load_workspace", "FALSE", "For reproducibility"',
             strip.white = TRUE)

f  <- "checker/bio302.yaml"
(chk_make(path = f, programs = prog, packages = pak, options = opt))
chk_requirements(f)

