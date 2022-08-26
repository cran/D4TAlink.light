##### root #####
#' Set the root of the task repository.
#' @inheritParams D4TAlink-common-args
#' @return Path to the current task root.
#' @export
setTaskRoot <- function(rootpath,dirCreate=FALSE){
  if(!dirCreate&&!file.exists(rootpath)) stop("root directory does not exist")
  if( dirCreate&&!file.exists(rootpath)) dir.create(rootpath,recursive=TRUE,showWarnings=FALSE)
  assign(x="rootpath",value=rootpath,pos=.pkgEnv)
  getTaskRoot()
}

#' Get the root of the task repository.
#' @return Path to the current task root.
#' @examples getTaskRoot()
#' @export
getTaskRoot <- function() get(x="rootpath",pos=.pkgEnv)

##### author #####

#' Set the name of the tasks author.
#' @inheritParams D4TAlink-common-args
#' @examples
#' setTaskAuthor("Doe Johns")
#' @return The current name of the tasks author.
#' @export
setTaskAuthor <- function(author){
  assign(x="authorname",value=author,pos=.pkgEnv)
  getTaskAuthor()
}

#' Get the name of the task author.
#' @return The current name of the tasks author.
#' @examples getTaskAuthor()
#' @export
getTaskAuthor <- function() get(x="authorname",pos=.pkgEnv)

##### sponsor #####

#' Set the name of the tasks sponsor.
#' @inheritParams D4TAlink-common-args
#' @examples
#' setTaskSponsor("SQU4RE")
#' @return The current name of the tasks sponsor.
#' @export
setTaskSponsor <- function(sponsor){
  assign(x="sponsorname",value=sponsor,pos=.pkgEnv)
  getTaskSponsor()
}

#' Get the name of the task sponsor.
#' @return The current name of the tasks sponsor.
#' @examples getTaskSponsor()
#' @export
getTaskSponsor <- function() get(x="sponsorname",pos=.pkgEnv)

##### structure #####

#' Set task repository directory structure.
#' @inheritParams D4TAlink-common-args
#' @examples
#' fun <- function(project,package,taskname,sponsor) {
#'   basePath <- file.path("%ROOT%",sponsor,project,package)
#'   paths <- list(
#'     root = "%ROOT%",
#'     datasrc = file.path(basePath, "raw", "data_source"),
#'     data = file.path(basePath, "output","adhoc",taskname),
#'     bin  = file.path(basePath, "output","adhoc",taskname,"bin"),
#'     code = file.path(basePath, "progs"),
#'     doc  = file.path(basePath, "docs"),
#'     log  = file.path(basePath, "output","log")
#'   )
#' }
#' setTaskStructure(fun)
#' @return The task directory structure function invisibly.
#' @export
setTaskStructure <- function(pathgen){
  assign(x="pathgen",value=pathgen,pos=.pkgEnv)
  invisible(getTaskStructure())
}

#' Get repository directory structure.
#' @return The directory structure function.
#' @export
getTaskStructure <- function() get(x="pathgen",pos=.pkgEnv)

##### Rmdtemplate #####

#' Set the path to the Rmd task template.
#' @param file path to the Rmd task template.
#' @return The path to the Rmd task template invisibly.
#' @export
setTaskRmdTemplate <- function(file){
  assign(x="rmdTempl",value=file,pos=.pkgEnv)
  invisible(getTaskRmdTemplate())
}

#' Get the path to the Rmd task template.
#' @return The path to the Rmd task template.
#' @export
getTaskRmdTemplate <- function() get(x="rmdTempl",pos=.pkgEnv)

