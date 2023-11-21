# read the CRDCN file

source(file.path(rprojroot::find_rstudio_root_file(),"pathconfig.R"),echo=FALSE)
source(file.path(basepath,"global-libraries.R"),echo=FALSE)
source(file.path(programs,"config.R"), echo=FALSE)

# read the CRDCN CSV file

crdcn.df <- read_csv(file=file.path(crdcnloc,"CRDCN RS-export May 2023.csv"))
skim(crdcn.df)

# now get the DOIs from the CRDCN file

crdcn.df %>%
  filter(!is.na(DOI)) %>%
  select(DOI) %>%
  distinct() -> crdcn.dois

# save the DOIs to file

saveRDS(crdcn.dois,file=doi.file.Rds)