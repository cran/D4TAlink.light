% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pathGenerators.R
\name{pathsDefault}
\alias{pathsDefault}
\title{Task paths generator.}
\usage{
pathsDefault(project, package, taskname, sponsor)
}
\arguments{
\item{project}{Project name.}

\item{package}{Package name.}

\item{taskname}{Task name.}

\item{sponsor}{Sponsor name, default set by \code{\link{setTaskSponsor}}.}
}
\value{
a list of file paths
}
\description{
The paths are:
datasrc: [ROOT]/[sponsor]/[project]/[package]/raw/datasource
data:    [ROOT]/[sponsor]/[project]/[package]/output/[taskname]
bin:     [ROOT]/[sponsor]/[project]/[package]/output/[taskname]/bin
code:    [ROOT]/[sponsor]/[project]/[package]/progs
doc:     [ROOT]/[sponsor]/[project]/[package]/docs
log:     [ROOT]/[sponsor]/[project]/[package]/output/log
}
