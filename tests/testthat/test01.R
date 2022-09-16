test_that("typical workflow",{
  library(D4TAlink.light)
  ## ----------------------------
  setTaskRoot(tempfile(),dirCreate=TRUE)
  #setTaskRoot("~/dtest1",dirCreate=TRUE)
  setTaskAuthor("Doe Johns")
  setTaskSponsor("MySponsor")
  setTaskStructure(pathsDefault)
  ## ----------------------------
  tn <- sprintf("%s_myTask",format(Sys.time(),"%Y%m%d"))
  task <- initTask("myProject","myPackage",tn)
  ## ----------------------------
  file <- pdfReport(task,c("plots",1),dim=c(100,100))
  plot(pi)
  dev.off()
  if(FALSE) openPDF(file)
  ## ----------------------------
  d <- list(letters=data.frame(a=LETTERS,b=letters,c=1:length(letters)),
            other=data.frame(a=1:3,b=11:13))
  file <- saveReportXls(d,task,"table")
  ## ----------------------------
  saveBinary(d,task,"data")
  e <- readBinary(task,"data")
  if(!all(names(e)%in%names(d))) stop("error [1]")
  ## ----------------------------
  file <- initTaskRscript(task,overwrite=TRUE)
  ## ----------------------------
  initTaskRmd(task,overwrite=TRUE)
  file <- renderTaskRmd(task) # requires having run 'tinytex::install_tinytex()'
  if(FALSE) openPDF(file)
  ## ----------------------------
  setTaskRmdTemplate("SQU4RE")
  initTaskRmd(task,overwrite=TRUE)
  file <- renderTaskRmd(task) # requires having run 'tinytex::install_tinytex()'
  if(FALSE) openPDF(file)
  ## ----------------------------
  newtask <- initTask("myProject","myPackage","20220202_otherTask")
  expect_equal(length(listTaskFiles(newtask)$bin),2)
  expect_equal(nrow(listTasks()),2)
  ## ----------------------------
  file <- tempfile()
  file.copy(getTaskRmdTemplate(),file)
  setTaskRmdTemplate(file)
  initTaskRmd(task,overwrite=TRUE)
  file <- renderTaskRmd(task) # requires having run 'tinytex::install_tinytex()'
  if(FALSE) openPDF(file)
  ## ----------------------------
  file <- tempfile(fileext=".zip")
  archiveTask(task,file)
  unlink(getTaskRoot(),recursive=TRUE)
  ## ----------------------------
  setTaskRoot(tempfile(),dirCreate=TRUE)
  #setTaskRoot("~/dtest2",dirCreate=TRUE)
  retask <- restoreTask(file)
  print(list.files(getTaskRoot(),recursive=TRUE,full.names=TRUE))
  unlink(getTaskRoot(),recursive=TRUE)
  ## ----------------------------
  expect_equal(retask$task,tn)
})
