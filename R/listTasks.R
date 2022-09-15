#' List details of all tasks stored in the root directory.
#'
#' @inheritParams D4TAlink-common-args
#' @return \code{\link{data.frame}} with the following information for tasks "sponsor", "project", "package", "task".
#' @importFrom stats setNames
#' @export
listTasks <- function(project=NULL,package=NULL,rootpath=getTaskRoot()) {
  fns <- ""
  pa <- NULL
  u <- gsub("%ROOT%",rootpath,getTaskStructure()("%PROJECT%","%PACKAGE%","%TASK%")$bin)
  if(!is.null(project)) u <- gsub("%PROJECT%",project,u)
  if(!is.null(package)) u <- gsub("%PACKAGE%",package,u)
  u <- unlist(strsplit(u,"%[A-Z]+%"))
  for(i in 1:length(u)) {
    d <- u[[i]]
    if(i==length(u)) pa <- "_task[.]json$"
    fnn <- NULL
    for(r in paste0(fns,d)) {
      fnn <- unique(c(fnn,list.files(r,pa,full.names=TRUE)))
    }
    fns <- fnn
  }

  taz <- stats::setNames(lapply(fns,function(fn)jsonlite::fromJSON(readChar(fn,file.size(fn)))),
                  fns)
  ans <- list()
  for(f in c("company", "project", "package", "task","author","date"))
    ans[[f]] <- sapply(taz,`[[`,f)
  ans <- lapply(ans,function(x)unlist(x)[match(fns,names(x))])
  ans <- as.data.frame(ans)
  names(ans) <- gsub("company","sponsor",names(ans))
  rownames(ans) <- NULL
  ans
}


#' List the files associated to a task.
##' @inheritParams base::list.files
#' @inheritParams D4TAlink-common-args
#' @return array of file names.
#' @export
listTaskFiles <- function(task,full.names=FALSE) {
  pz <- getTaskPaths(task)
  fns <- list()
  for(ty in c("bin","data")) {
    fns[[ty]] <- fz <- setdiff(list.files(pz[[ty ]],recursive=FALSE,full.names=TRUE,include.dirs=TRUE),pz)
    if(!full.names) fns[[ty]] <- basename(fns[[ty]])
    for(f in fz)
      fns[[ty]] <- c(fns[[ty]],list.files(f,recursive=TRUE,full.names=full.names))
  }
  ## =====
  for(ty in c("doc","code")) {
    fns[[ty]] <- list.files(pz[[ty ]],recursive=TRUE,full.names=full.names,
                            pattern=sprintf("^%s[._-].*[^#~]$",task$task))
  }
  ## =====
  fns
}

