#' Create task template in Rmd format.
#' @param overwrite overwrite Rmd file if exists, default FALSE
#' @inheritParams D4TAlink-common-args
#' @inheritParams base::readLines
#' @return the file name invisibly.
#' @export
initTaskRmd <- function(task,encoding="unknown",overwrite=FALSE) {
  fn <- file.path(getTaskPaths(task)[["code"]],paste0(task$task,".Rmd"))
  if(file.exists(fn)&&!overwrite) stop("The task R markdown file already exists. Set 'overwrite' to FALSE to overwrite the existing file.")
  fo <- function(x) { for(e in c("%","_")) x<-gsub(e,paste0("\\",e),x,fixed=TRUE) ; x }
  tfn <- getTaskRmdTemplate()
  tin <- readLines(tfn,encoding=encoding,warn=FALSE)
  date <- format(as.Date(gsub("(^[^_]*)_.*", "\\1", task$task),"%Y%m%d"),"%Y-%m-%d")
  tin <- gsub("%DATE%"    ,date,tin,fixed=TRUE)
  tin <- gsub("%TASKID%",taskID(task),tin,fixed=TRUE)
  tin <- gsub("%TASKIDX%",fo(taskID(task)),tin,fixed=TRUE)
  u <- unlist(task)
  for(n in names(u)) {
    tin <- gsub(sprintf("%%%s%%",toupper(n)),u[[n]],tin,fixed=TRUE)
    tin <- gsub(sprintf("%%%sX%%",toupper(n)),fo(u[[n]]),tin,fixed=TRUE)
  }
  for(e in names(task)[sapply(task,is.character)])
    tin <- gsub(paste0("%",toupper(e),"%"),task[[e]],tin,fixed=TRUE)
  tin <- gsub(paste0("%","TYPE","%"),"task report",tin,fixed=TRUE)
  writeLines(enc2utf8(tin),fn,useBytes=TRUE)
  invisible(fn)
}


#' Render the task from the Rmd file
#'
#' The template of the task is rendered towards pdf or html in the documentation directory of the specified task.
#' @param debug if TRUE execute in the global environment.
#' @inheritParams D4TAlink-common-args
#' @inheritParams rmarkdown::render
#' @inheritDotParams rmarkdown::render
#' @importFrom rmarkdown render
#' @return the file name invisibly.
#' @export
renderTaskRmd <- function(task,output_format=NULL,debug=FALSE,clean=TRUE,...){
  ifn <- file.path(getTaskPaths(task)[["code"]],paste0(task$task,".Rmd"))
  if(!file.exists(ifn)) ifn <- file.path(getTaskPaths(task)[["code"]],paste0(task$task,".rmd"))
  if(!file.exists(ifn)) stop("R markdown file not found, create it using 'initTaskRmd'.")
  odr <- getTaskPaths(task)[["doc"]]
  if(debug) fn <- rmarkdown::render(input=ifn,output_dir=odr,
                                    output_format=output_format,clean=clean,...,
                                    envir=globalenv())
  else fn <- rmarkdown::render(input=ifn,output_dir=odr,
                               output_format=output_format,clean=clean,...,
                               envir=new.env())
  if(!clean){
    tfn <- list.files(path=task$paths$code,pattern=paste0(task$task,"[.]knit[.]md"),full.names=TRUE)
    file.copy(from=tfn,to=odr)
    file.remove(tfn)
  }
  if(grepl("docx$",fn)) formatTaskDocx(task)
  invisible(fn)
}

#' Replace default task fields in 'docx' file.
#' @inheritParams D4TAlink-common-args
#' @importFrom utils zip
#' @return the file name invisibly.
formatTaskDocx <- function(task) {
  ifn <- file.path(getTaskPaths(task)[["doc"]],paste0(task$task,".docx"))
  if(!file.exists(ifn)) stop("No word documentation found. Create it using 'renderTaskRmd'.")
  tloc <- tempfile() # paste0(ifn,".xct")
  unlink(tloc,recursive=TRUE)
  dir.create(tloc,showWarnings=FALSE)
  unzip(ifn,exdir=tloc)
  owd <- getwd()
  setwd(tloc)
  on.exit(setwd(owd))
  for(f in list.files(".","[.]xml$",recursive=TRUE,full.names=TRUE)) {
    s <- readChar(f,file.info(f)$size)
    sa <- FALSE
    for(e in names(task)[sapply(task,is.character)]) {
      if(grepl(paste0("%",toupper(e),"%"),s,fixed=TRUE)) {
        sa <- TRUE
        s <- gsub(paste0("%",toupper(e),"%"),task[[e]],s,fixed=TRUE)
      }
    }
    if(grepl('%TYPE%',s,fixed=TRUE)) {
      sa <- TRUE
      s <- gsub('%TYPE%','task report',s,fixed=TRUE)
    }
    if(sa) {
      print(f)
      cat(s,file=f)
      zip(ifn,f,flags="")
    }
  }
  unlink(tloc,recursive=TRUE)
  invisible(ifn)
}





