#' Load a task.
#'
#' @inheritParams D4TAlink-common-args
#' @return Object of class \code{\link{D4TAlinkTask}} or NULL if the \code{task} does not exists.
#' @export
loadTask <- function(project, package, taskname,
                     sponsor=getTaskSponsor(),
                     author=getTaskAuthor()) {
  tabk <- createTask(project,package,taskname,sponsor,author)
  readBinary(task=tabk,type="task")
}

