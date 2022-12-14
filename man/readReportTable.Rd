% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/taskFiles.R
\name{readReportTable}
\alias{readReportTable}
\title{Read data into vector or list using function \code{\link{scan}}.}
\usage{
readReportTable(task, type, ext = "csv", subdir = NULL, dirCreate = FALSE, ...)
}
\arguments{
\item{task}{Object of class \code{\link{D4TAlinkTask}}, as created by \code{\link{initTask}}.}

\item{type}{Filename type. If the type is an array, the cocatenation of the elements is used with separator"-". Filenames have the form [task name]_[type].[ext]}

\item{ext}{Filename extension.}

\item{subdir}{(optional) Subdirectory.}

\item{dirCreate}{Logical, if TRUE (by default) the directory is created.}

\item{...}{
  Arguments passed on to \code{\link[utils:read.table]{utils::read.csv}}
  \describe{
    \item{\code{file}}{the name of the file which the data are to be read from.
    Each row of the table appears as one line of the file.  If it does
    not contain an \emph{absolute} path, the file name is
    \emph{relative} to the current working directory,
    \code{\link{getwd}()}. Tilde-expansion is performed where supported.
    This can be a compressed file (see \code{\link{file}}).

    Alternatively, \code{file} can be a readable text-mode
    \link{connection} (which will be opened for reading if
    necessary, and if so \code{\link{close}}d (and hence destroyed) at
    the end of the function call).  (If \code{\link{stdin}()} is used,
    the prompts for lines may be somewhat confusing.  Terminate input
    with a blank line or an EOF signal, \code{Ctrl-D} on Unix and
    \code{Ctrl-Z} on Windows.  Any pushback on \code{stdin()} will be
    cleared before return.)

    \code{file} can also be a complete URL.  (For the supported URL
    schemes, see the \sQuote{URLs} section of the help for
    \code{\link{url}}.)
  }
    \item{\code{header}}{a logical value indicating whether the file contains the
    names of the variables as its first line.  If missing, the value is
    determined from the file format: \code{header} is set to \code{TRUE}
    if and only if the first row contains one fewer field than the
    number of columns.}
    \item{\code{sep}}{the field separator character.  Values on each line of the
    file are separated by this character.  If \code{sep = ""} (the
    default for \code{read.table}) the separator is \sQuote{white space},
    that is one or more spaces, tabs, newlines or carriage returns.}
    \item{\code{quote}}{the set of quoting characters. To disable quoting
    altogether, use \code{quote = ""}.  See \code{\link{scan}} for the
    behaviour on quotes embedded in quotes.  Quoting is only considered
    for columns read as character, which is all of them unless
    \code{colClasses} is specified.}
    \item{\code{dec}}{the character used in the file for decimal points.}
    \item{\code{fill}}{logical. If \code{TRUE} then in case the rows have unequal
    length, blank fields are implicitly added.  See \sQuote{Details}.}
    \item{\code{comment.char}}{character: a character vector of length one
    containing a single character or an empty string.  Use \code{""} to
    turn off the interpretation of comments altogether.}
  }}
}
\value{
the data read, or \code{NULL} if the file does not exist.
}
\description{
Read data into vector or list using function \code{\link{scan}}.
}
