# ###########################
# CONFIG: define paths and filenames for later reference
# ###########################

# Change the basepath depending on your system

basepath <- rprojroot::find_rstudio_root_file()

# Main directories
dataloc     <- file.path(basepath, "data")
interwrk    <- file.path(basepath, "data","interwrk")
crdcnloc    <- file.path(basepath,"data","crdcn")
openalexloc <- file.path(basepath,"data","openalex")
auxilloc    <- file.path(basepath,"data","auxiliary")
outputs	    <- file.path(basepath,"outputs")


programs <- file.path(basepath,"programs")

for ( dir in list(dataloc,interwrk,crdcnloc,openalexloc,outputs)){
	if (file.exists(dir)){
	} else {
	dir.create(file.path(dir))
	}
}
