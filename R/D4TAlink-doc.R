#' \code{D4TAlinkTask} Documentation of the D4TAlinkTask class
#'
#' @description The \code{D4TAlinkTask} object is created by the \code{\link{initTask}} function.
#' This object is a list containing the task properties:
#' \itemize{
#' \item{task: }{task name}
#' \item{package: }{package name}
#' \item{project: }{project name}
#' \item{sponsor: }{sponsor name}
#' \item{author: }{author name}
#' \item{copyright: }{copyright, by default 'Copyright (c) [sponsor] [year]'}
#' \item{'date': }{date of the task initialization,
#' formatted as 'year-month-day'}
#' \item{'footer': }{footer for the task, e.g.,
#' 'Copyright (c) [sponsor] [year] - CONFIDENTIAL'}
#' \item{'version': }{string with task version,
#' '0.0' at the initialization}
#' \item{dependencies: }{information on R versions and names
#' of loaded/attached dependencies and corresponding versions}
#' \item{paths: }{list with paths of folder structures}
#' }
#'
#' There are different functions dedicated for this \code{D4TAlinkTask} object:
#' \itemize{
#' \item \code{\link{taskID}}: Get ID
#' }
#'
#' @examples
#' # set D4TAlink's global parameters
#' setTaskAuthor("Doe Johns")
#' setTaskSponsor("mySponsor")
#'
#' # Create data repository
#' setTaskRoot(file.path(tempdir(),"D4TAlink_example001"),dirCreate=TRUE)
#'
#' # Create a task
#' task <- initTask(project="myProject",
#'                  package="myPackage",
#'                  taskname=sprintf("%s_myTask",format(Sys.time(),"%Y%m%d")))
#'
#' # Output a plot to a PDF file
#' file <- pdfReport(task,c("plots",1),dim=c(100,100))
#' opa <- par()$ask
#' par(ask=FALSE)
#' hist(rnorm(100))
#' par(ask=opa)
#' dev.off()
#' # To view the plot:
#' #   openPDF(file)
#'
#' # Output tables to an Excel file
#' d <- list(letters=data.frame(a=LETTERS,b=letters,c=1:length(letters)),
#'           other=data.frame(a=1:3,b=11:13))
#' file <- saveReportXls(d,task,"table")
#'
#' # Save an R object to a binary file
#' saveBinary(d,task,"data")
#' e <- readBinary(task,"data")
#' if(!all(names(e)%in%names(d))) stop("error [1]")
#'
#' # Create a standard R markdown file from template to further complete
#' initTaskRmd(task)
#'
#' # Render the markdown file to pdf
#' file <- renderTaskRmd(task) # requires having run 'tinytex::install_tinytex()'
#' # To view the report:
#' #   openPDF(file)
#'
#' # create a zip archive with the task files
#' file <- tempfile(fileext=".zip")
#' archiveTask(task,file)
#'
#' # Delete the data repository
#' unlink(getTaskRoot(),recursive=TRUE)
#'
#' # Create new repository and restore task from archive
#' setTaskRoot(file.path(tempdir(),"D4TAlink_example002"),dirCreate=TRUE)
#' l <- restoreTask(file)
#' print(list.files(getTaskRoot(),recursive=TRUE,full.names=TRUE))
#'
#' # Delete new data repository
#' unlink(getTaskRoot(),recursive=TRUE)
#' @name D4TAlinkTask
#' @return Not relevant
NULL
