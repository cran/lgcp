% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lgcpMethods.R
\name{plotExceed.lgcpPredict}
\alias{plotExceed.lgcpPredict}
\title{plotExceed.lgcpPredict function}
\usage{
\method{plotExceed}{lgcpPredict}(
  obj,
  fun,
  nlevel = 64,
  ask = TRUE,
  plotcases = FALSE,
  mapunderlay = NULL,
  alpha = 1,
  ...
)
}
\arguments{
\item{obj}{an object}

\item{fun}{the name of the function used to compute exceedances (character vector of length 1). Note that the named function must be in memory.}

\item{nlevel}{number of colour levels to use in plot, default is 64}

\item{ask}{whether or not to ask for a new plot between plotting exceedances at different thresholds.}

\item{plotcases}{whether or not to plot the cases on the map}

\item{mapunderlay}{optional underlay to plot underneath maps of exceedance probabilities. Use in conjunction with rainbow parameter 'alpha' (eg alpha=0.3) to set transparency of exceedance layer.}

\item{alpha}{graphical parameter takign values in [0,1] controlling transparency of exceedance layer. Default is 1.}

\item{...}{additional arguments passed to image.plot}
}
\value{
plot of exceedances
}
\description{
Function for plotting exceedance probabilities stored in \code{lgcpPredict} ojects.
}
\examples{
\dontrun{exceedfun <- exceedProbs(c(1.5,2,4))}
\dontrun{
    plot(lg,"exceedfun") # lg is an object of class lgcpPredict
                         # in which the Monte Carlo mean of
                         # "exceedfun" was computed
                         # see ?MonteCarloAverage and ?setoutput
}
}
\seealso{
\link{lgcpPredict}, \link{MonteCarloAverage}, \link{setoutput}
}
