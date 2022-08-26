#' Create an archive containing the files of a given task.
#' @param file full name of the output zip file
#' @inheritParams D4TAlink-common-args
#' @inheritParams utils::zip
#' @inheritDotParams utils::zip
#' @importFrom utils zip
#' @return the archive file name invisibly.
#' @export
archiveTask <- function(task,file,...) {
  owd <- getwd()
  ort <- getTaskRoot()
  on.exit({ setwd(owd) ; setTaskRoot(ort)})
  setwd(getTaskRoot())
  setTaskRoot(".")

  pz <- getTaskPaths(task)
  fl <- c()
  fl <- unique(c(fl,list.files(pz[["bin" ]],recursive=TRUE,full.names=TRUE)))
  fl <- unique(c(fl,list.files(pz[["data"]],recursive=TRUE,full.names=TRUE)))
  fl <- unique(c(fl,list.files(pz[["log" ]],recursive=TRUE,full.names=TRUE)))
  fl <- unique(c(fl,list.files(pz[["code"]],recursive=TRUE,full.names=TRUE,
                               pattern=sprintf("^%s[._-]",task$task))))
  fl <- unique(c(fl,list.files(pz[["doc" ]],recursive=TRUE,full.names=TRUE,
                               pattern=sprintf("^%s[._-]",task$task))))
  utils::zip(file,fl,extra=c(sprintf("-b %s",shQuote(getTaskRoot()))),...)
  invisible(file)
}

#' Restore an archive containing the files of a given task.
#' @param file full name of the input zip file
#' @inheritParams D4TAlink-common-args
#' @inheritParams utils::unzip
#' @inheritDotParams utils::unzip
#' @importFrom utils unzip
#' @return if list FALSE, the task imported, otherwise the list .
#' @export
restoreTask <- function(file,overwrite=FALSE,list=FALSE,...) {
  #owd <- getwd()
  #on.exit(setwd(owd))
  #setwd(getTaskRoot())
  ls <- utils::unzip(file,overwrite=overwrite,list=list,exdir=getTaskRoot(),...)
  if(list) return(ls)
  invisible(ls)
}

