#' Load a task.
#'
#' @inheritParams D4TAlink-common-args
#' @inheritParams readBinary
#' @return Object of class \code{\link{D4TAlinkTask}} or NULL if the \code{task} does not exists.
#' @export
loadTask <- function(project, package, taskname,
                     sponsor=getTaskSponsor(),
                     author=getTaskAuthor(),
                     quiet=FALSE) {
  tabk <- createTask(project,package,taskname,sponsor,author)
  ta <- readBinary(task=tabk,type="task",quiet=quiet)
  ## back-compatibility
  if(!is.null(ta)) {
    ta$paths <- NULL
    #ta$paths <- lapply(ta$paths,gsub,pattern=paste0("^",ta$paths$root),replacement="%ROOT%")
    #ta$paths$root <- "%ROOT%"
  }
  ta
}

