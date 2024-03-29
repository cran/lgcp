% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lgcpMethods.R
\name{lgcpgrid.matrix}
\alias{lgcpgrid.matrix}
\title{lgcpgrid.matrix function}
\usage{
\method{lgcpgrid}{matrix}(grid, xvals = 1:nrow(grid), yvals = 1:ncol(grid), ...)
}
\arguments{
\item{grid}{a three dimensional array object}

\item{xvals}{optional vector of x-coordinates associated to grid. By default, this is the cell index in the x direction.}

\item{yvals}{optional vector of y-coordinates associated to grid. By default, this is the cell index in the y direction.}

\item{...}{other arguments}
}
\value{
an object of class lgcpgrid
}
\description{
Creates an lgcp grid object from an 2-dimensional matrix.
}
\seealso{
\link{lgcpgrid.list}, \link{as.list.lgcpgrid}, \link{print.lgcpgrid},
\link{summary.lgcpgrid}, \link{quantile.lgcpgrid}, \link{image.lgcpgrid}, \link{plot.lgcpgrid}
}
