% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lgcpMethods.R
\name{quantile.lgcpgrid}
\alias{quantile.lgcpgrid}
\title{quantile.lgcpgrid function}
\usage{
\method{quantile}{lgcpgrid}(x, ...)
}
\arguments{
\item{x}{an object of class lgcpgrid}

\item{...}{other arguments}
}
\value{
Quantiles per grid, see ?quantile for further options
}
\description{
Quantile method for lgcp objects. This just applies the quantile function to each of
the elements of x$grid
}
\seealso{
\link{lgcpgrid.list}, \link{lgcpgrid.array}, \link{as.list.lgcpgrid}, \link{print.lgcpgrid},
\link{summary.lgcpgrid}, \link{image.lgcpgrid}, \link{plot.lgcpgrid}
}
