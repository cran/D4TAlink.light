% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/taskRmarkdown.R
\name{renderTaskRmd}
\alias{renderTaskRmd}
\title{Render the task from the Rmd file}
\usage{
renderTaskRmd(
  task,
  output_format = NULL,
  debug = FALSE,
  clean = TRUE,
  suffix = NA,
  ...
)
}
\arguments{
\item{task}{Object of class \code{\link{D4TAlinkTask}}, as created by \code{\link{initTask}}.}

\item{output_format}{The R Markdown output format to convert to. The option
\code{"all"} will render all formats defined within the file. The option can
be the name of a format (e.g. \code{"html_document"}) and that will render
the document to that single format. One can also use a vector of format
names to render to multiple formats. Alternatively, you can pass an output
format object (e.g. \code{html_document()}). If using \code{NULL} then the
output format is the first one defined in the YAML frontmatter in the input
file (this defaults to HTML if no format is specified there).
If you pass an output format object to \code{output_format}, the options
specified in the YAML header or \code{_output.yml} will be ignored and you
must explicitly set all the options you want when you construct the object.
If you pass a string, the output format will use the output parameters in
the YAML header or \code{_output.yml}.}

\item{debug}{if TRUE execute in the global environment.}

\item{clean}{Using \code{TRUE} will clean intermediate files that are created
during rendering.}

\item{suffix}{Filename suffix, used to develop scripts for sub-analyses for a given task, default NA.}

\item{...}{
  Arguments passed on to \code{\link[rmarkdown:render]{rmarkdown::render}}
  \describe{
    \item{\code{input}}{The input file to be rendered. This can be an R script (.R),
an R Markdown document (.Rmd), or a plain markdown document.}
    \item{\code{output_file}}{The name of the output file. If using \code{NULL} then the
output filename will be based on filename for the input file. If a filename
is provided, a path to the output file can also be provided. Note that the
\code{output_dir} option allows for specifying the output file path as well,
however, if also specifying the path, the directory must exist. If
\code{output_file} is specified but does not have a file extension, an
extension will be automatically added according to the output format. To
avoid the automatic file extension, put the \code{output_file} value in
\code{\link{I}()}, e.g., \code{I('my-output')}.}
    \item{\code{output_dir}}{The output directory for the rendered \code{output_file}.
This allows for a choice of an alternate directory to which the output file
should be written (the default output directory of that of the input file).
If a path is provided with a filename in \code{output_file} the directory
specified here will take precedence. Please note that any directory path
provided will create any necessary directories if they do not exist.}
    \item{\code{output_options}}{List of output options that can override the options
specified in metadata (e.g. could be used to force \code{self_contained} or
\code{mathjax = "local"}). Note that this is only valid when the output
format is read from metadata (i.e. not a custom format object passed to
\code{output_format}).}
    \item{\code{output_yaml}}{Paths to YAML files specifying output formats and their
configurations. The first existing one is used. If none are found, then
the function searches YAML files specified to the \code{output_yaml} top-level
parameter in the YAML front matter, _output.yml or _output.yaml, and then uses
the first existing one.}
    \item{\code{intermediates_dir}}{Intermediate files directory. If a path is specified
then intermediate files will be written to that path. If \code{NULL},
intermediate files are written to the same directory as the input file.}
    \item{\code{knit_root_dir}}{The working directory in which to knit the document;
uses knitr's \code{root.dir} knit option. If \code{NULL} then the behavior
will follow the knitr default, which is to use the parent directory of the
document.}
    \item{\code{runtime}}{The runtime target for rendering. The \code{static} option
produces output intended for static files; \code{shiny} produces output
suitable for use in a Shiny document (see \code{\link[rmarkdown]{run}}). The default,
\code{auto}, allows the \code{runtime} target specified in the YAML metadata
to take precedence, and renders for a \code{static} runtime target otherwise.}
    \item{\code{params}}{A list of named parameters that override custom params
specified within the YAML front-matter (e.g. specifying a dataset to read or
a date range to confine output to). Pass \code{"ask"} to start an
application that helps guide parameter configuration.}
    \item{\code{knit_meta}}{(This option is reserved for expert use.) Metadata
generated by \pkg{knitr}.}
    \item{\code{envir}}{The environment in which the code chunks are to be evaluated
during knitting (can use \code{\link{new.env}()} to guarantee an empty new
environment).}
    \item{\code{run_pandoc}}{An option for whether to run pandoc to convert Markdown
output.}
    \item{\code{quiet}}{An option to suppress printing during rendering from knitr,
pandoc command line and others. To only suppress printing of the last
"Output created: " message, you can set \code{rmarkdown.render.message} to
\code{FALSE}}
    \item{\code{encoding}}{Ignored. The encoding is always assumed to be UTF-8.}
  }}
}
\value{
the file name invisibly.
}
\description{
The template of the task is rendered towards pdf or html in the documentation directory of the specified task.
}
