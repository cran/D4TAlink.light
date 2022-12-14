% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/taskFiles.R
\name{pdfReport}
\alias{pdfReport}
\title{Graphics devices for \code{pdf} format bitmap files.}
\usage{
pdfReport(
  task,
  type,
  ext = "pdf",
  subdir = NULL,
  dirCreate = TRUE,
  title = NA,
  file = NA,
  dim = c(297, 210),
  height = NULL,
  width = NULL,
  landscape = NULL,
  ...
)
}
\arguments{
\item{task}{Object of class \code{\link{D4TAlinkTask}}, as created by \code{\link{initTask}}.}

\item{type}{Filename type. If the type is an array, the cocatenation of the elements is used with separator"-". Filenames have the form [task name]_[type].[ext]}

\item{ext}{Filename extension.}

\item{subdir}{(optional) Subdirectory.}

\item{dirCreate}{Logical, if TRUE (by default) the directory is created.}

\item{title}{title string to embed as the \samp{/Title} field in the
    file.  Defaults to \code{"R Graphics Output"}.}

\item{file}{a character string giving the file path.
    If it is of the form \code{"|cmd"}, the output is piped to the
    command given by \command{cmd}.  If it is \code{NULL},
    then no external file is created (effectively, no drawing occurs),
    but the device may still be queried (e.g., for size of text).

    For use with \code{onefile = FALSE} give a C integer format such
    as \code{"Rplot\%03d.pdf"} (the default in that case).
    (See \code{\link[grDevices]{postscript}} for further details.)

    Tilde expansion (see \code{\link{path.expand}}) is done. An input with
    a marked encoding is converted to the native encoding or an error is
    given.
  }

\item{dim}{device height and width in \code{mm}.}

\item{height}{device height in \code{mm}.}

\item{width}{device height in \code{mm}.}

\item{landscape}{if defined, orientation of the document.}

\item{...}{
  Arguments passed on to \code{\link[grDevices:pdf]{grDevices::pdf}}
  \describe{
    \item{\code{width,height}}{the width and height of the graphics region in
    inches.  The default values are \code{7}.}
    \item{\code{onefile}}{logical: if true (the default) allow multiple figures
    in one file.  If false, generate a file with name containing the page
    number for each page.  Defaults to \code{TRUE}, and forced to true
    if \code{file} is a pipe.}
    \item{\code{family}}{the font family to be used, see
    \code{\link[grDevices]{postscript}}.  Defaults to \code{"Helvetica"}.}
    \item{\code{fonts}}{a character vector specifying \R graphics font family
    names for additional fonts which will be included in the PDF file.
    Defaults to \code{NULL}.}
    \item{\code{version}}{a string describing the PDF version that will be
    required to view the output.  This is a minimum, and will be
    increased (with a warning) if necessary.  Defaults to \code{"1.4"},
    but see \sQuote{Details}.}
    \item{\code{paper}}{the target paper size.  The choices are
    \code{"a4"}, \code{"letter"}, \code{"legal"} (or \code{"us"}) and
    \code{"executive"} (and these can be capitalized), or \code{"a4r"}
    and \code{"USr"} for rotated (\sQuote{landscape}).
    The default is \code{"special"}, which means that the \code{width}
    and \code{height} specify the paper size.  A further choice is
    \code{"default"}; if this is selected, the
    papersize is taken from the option \code{"papersize"}
    if that is set and as \code{"a4"} if it is unset or empty.
    Defaults to \code{"special"}.
  }
    \item{\code{encoding}}{the name of an encoding file.  See
    \code{\link[grDevices]{postscript}} for details.  Defaults to \code{"default"}.}
    \item{\code{bg}}{the initial background color to be used.  Defaults to
    \code{"transparent"}.}
    \item{\code{fg}}{the initial foreground color to be used.  Defaults to
   \code{"black"}.}
    \item{\code{pointsize}}{the default point size to be used.  Strictly
    speaking, in bp, that is 1/72 of an inch, but approximately in
    points.  Defaults to \code{12}.}
    \item{\code{pagecentre}}{logical: should the device region be centred on the
    page? -- is only relevant for \code{paper != "special"}.
    Defaults to \code{TRUE}.}
    \item{\code{colormodel}}{a character string describing the color model:
    currently allowed values are \code{"srgb"}, \code{"gray"} (or
    \code{"grey"}) and \code{"cmyk"}.  Defaults to \code{"srgb"}.  See section
    \sQuote{Color models}.}
    \item{\code{useDingbats}}{logical.  Should small circles be rendered
    \emph{via} the Dingbats font?  Defaults to \code{FALSE}.
    If \code{TRUE}, this can produce smaller and better output, but
    there can font display problems in broken PDF viewers: although this
    font is one of the 14 guaranteed to be available in all PDF viewers,
    that guarantee is not always honoured.

    For Unix-alikes (including macOS) see the \sQuote{Note} for a
    possible fix for some viewers.}
    \item{\code{useKerning}}{logical.  Should kerning corrections be included in
    setting text and calculating string widths?  Defaults to \code{TRUE}.}
    \item{\code{fillOddEven}}{logical controlling the polygon fill mode:  see
    \code{\link{polygon}} for details.  Defaults to \code{FALSE}.}
    \item{\code{compress}}{logical.  Should PDF streams be generated with Flate
    compression?  Defaults to \code{TRUE}.}
  }}
}
\value{
the file name invisibly.
}
\description{
Graphics devices for \code{pdf} format bitmap files.
}
