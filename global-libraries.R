####################################
# global libraries used everywhere #
####################################
mran.date <- "2023-11-01"

get_os <- function(){
  sysinf <- Sys.info()
  if (!is.null(sysinf)){
    os <- sysinf['sysname']
    if (os == 'Darwin')
      os <- "osx"
  } else { ## mystery machine
    os <- .Platform$OS.type
    if (grepl("^darwin", R.version$os))
      os <- "osx"
    if (grepl("linux-gnu", R.version$os))
      os <- "linux"
  }
  tolower(os)
}

if (get_os()=="linux") {
## Rstudio Package Manager
  #if (getOption("repos")["CRAN"]=="@CRAN@") {
  options(repos = c(REPO_NAME = paste0("https://packagemanager.posit.co/cran/__linux__/jammy/",mran.date)))
  #} else {
  #message("Repo for CRAN already set")
  #}
} else {
## MRAN
  options(repos=paste0("https://packagemanager.posit.co/cran/",mran.date))
}

getOption("repos")["CRAN"]

pkgTest <- function(x)
{
	if (!require(x,character.only = TRUE))
	{
		install.packages(x,dep=TRUE)
		if(!require(x,character.only = TRUE)) stop("Package not found")
	}
	return("OK")
}

global.libraries <- c("devtools","rprojroot","tictoc",
                "dplyr","rcrossref","readr","data.table","readxl",
                "rjson","ggplot2","stringr","skimr","tidyr")


results <- sapply(as.list(global.libraries), pkgTest)


# Rcpp and magick are dependencies of summarytools
# there are some weird things going on in Linux world, so this is the workaround
# libraries3 <- c("magick","summarytools")

# pkgTestSrc <- function(x) {
#         if (!require(x,character.only = TRUE))
# 	    {
#     # updated, not tested.
# 		install.packages(x,repos=paste0("https://packagemanager.posit.co/cran/all/",mran.date))
# 		if(!require(x,character.only = TRUE)) stop("Package not found")
# 	    }
# 	return("OK")
# }

# if ( get_os() == "linux" ) {

#     libraries2 <- c("Rcpp")
#     results2 <- sapply(as.list(libraries2),pkgTest)

#     # now install magick and summary tools from source
#     #sapply(as.list(libraries3),pkgTestSrc)
#     #sapply(as.list(libraries3),pkgTest)
# } else {
#     sapply(as.list(libraries3),pkgTest)
# }

# installing an additional package, latest version

remotes::install_github("ropensci/openalexR")
