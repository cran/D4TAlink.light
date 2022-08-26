## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- init, eval=FALSE--------------------------------------------------------
#  library(D4TAlink.light)
#  
#  setTaskAuthor("Doe Johns")
#  setTaskSponsor("mySponsor")

## ---- setroot, eval=FALSE-----------------------------------------------------
#  setTaskRoot(file.path(tempdir(),"D4TAlink_example001"),dirCreate=TRUE)

## ---- setother, eval=FALSE----------------------------------------------------
#  setTaskRmdTemplate("/SOME/WHERE/my.Rmd")
#  setTaskStructure(pathsDefault)

## ---- mktask1, eval=FALSE-----------------------------------------------------
#  # make sure that the sopnsor was defined
#  setTaskSponsor("mySponsor")
#  
#  # create a task
#  task <- initTask(project="myProject",
#                   package="myPackage",
#                   taskname=sprintf("%s_myTask",format(Sys.time(),"%Y%m%d")))

## ---- mkplot1, eval=FALSE-----------------------------------------------------
#  file <- pdfReport(task,c("plots",1),dim=c(100,100))
#  hist(rnorm(100))
#  dev.off()
#  openPDF(file)

## ---- mkplot2, eval=FALSE-----------------------------------------------------
#  file <- pngReport(task,c("plots",1),dim=c(300,300))
#  hist(rnorm(100))
#  dev.off()
#  print(file)

## ---- mkplot3, eval=FALSE-----------------------------------------------------
#  file <- jpegReport(task,c("plots",1),dim=c(300,300))
#  hist(rnorm(100))
#  dev.off()
#  print(file)

## ---- mkxls, eval=FALSE-------------------------------------------------------
#  d <- list(letters=data.frame(a=LETTERS,b=letters,c=1:length(letters)),
#            other=data.frame(a=1:3,b=11:13))
#  file <- saveReportXls(d,task,"tables")
#  print(file)

## ---- mkcsv, eval=FALSE-------------------------------------------------------
#  file <- saveReportTable(d$letters,task,"tables")
#  print(file)

## ---- trbin, eval=FALSE-------------------------------------------------------
#  d <- list(letters=data.frame(a=LETTERS,b=letters,c=1:length(letters)),
#            other=data.frame(a=1:3,b=11:13))
#  task <- initTask(project="myProject",
#                   package="myPackage",
#                   taskname="20220801_parentTask")
#  file <- saveBinary(d,task,"someData")
#  print(file)

## ---- ldbin, eval=FALSE-------------------------------------------------------
#  task <- initTask(project="myProject",
#                   package="myPackage",
#                   taskname="20220801_childTask")
#  e <- readBinary(loadTask(task$project,task$package,"20220801_parentTask"),"someData")

## ---- indo, eval=FALSE--------------------------------------------------------
#  file <- initTaskRmd(task)
#  print(file)

## ---- redo, eval=FALSE--------------------------------------------------------
#  file <- renderTaskRmd(task) # may require having run 'tinytex::install_tinytex()'
#  openPDF(file)

## ---- arch, eval=FALSE--------------------------------------------------------
#  setTaskRoot(file.path(tempdir(),"D4TAlink_exampleFrom"),dirCreate=TRUE)
#  task <- initTask(project="myProject",
#                   package="myPackage",
#                   taskname="20220501_myTask")
#  file <- tempfile(fileext=".zip")
#  archiveTask(task,file)
#  print(reportDir(task))

## ---- reta, eval=FALSE--------------------------------------------------------
#  setTaskRoot(file.path(tempdir(),"D4TAlink_exampleTo"),dirCreate=TRUE)
#  restoreTask(file)
#  newtask <- loadTask(project="myProject",
#                      package="myPackage",
#                      taskname="20220501_myTask")
#  print(reportDir(newtask))

## ---- srmd, eval=FALSE--------------------------------------------------------
#  setTaskRmdTemplate("/SOME/WHERE/my.Rmd")
#  

## ---- dstr, eval=FALSE--------------------------------------------------------
#  fun <- function(project,package,taskname,sponsor) {
#    basePath <- file.path("%ROOT%",sponsor,project,package)
#    paths <- list(
#      root = "%ROOT%",
#      datasrc = file.path(basePath, "raw", "data_source"),
#      data = file.path(basePath, "output","adhoc",taskname),
#      bin  = file.path(basePath, "output","adhoc",taskname,"bin"),
#      code = file.path(basePath, "progs"),
#      doc  = file.path(basePath, "docs"),
#      log  = file.path(basePath, "output","log")
#    )
#  }
#  
#  setTaskStructure(fun)
