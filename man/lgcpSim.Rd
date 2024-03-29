% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lgcpSimSpatioTemporal.R
\name{lgcpSim}
\alias{lgcpSim}
\title{lgcpSim function}
\usage{
lgcpSim(
  owin = NULL,
  tlim = as.integer(c(0, 10)),
  spatial.intensity = NULL,
  temporal.intensity = NULL,
  cellwidth = 0.05,
  model.parameters = lgcppars(sigma = 2, phi = 0.2, theta = 1),
  spatial.covmodel = "exponential",
  covpars = c(),
  returnintensities = FALSE,
  progressbar = TRUE,
  ext = 2,
  plot = FALSE,
  ratepow = 0.25,
  sleeptime = 0,
  inclusion = "touching"
)
}
\arguments{
\item{owin}{polygonal observation window}

\item{tlim}{time interval on which to simulate data}

\item{spatial.intensity}{object that can be coerced into a spatialAtRisk object. if NULL then uniform spatial is chosen}

\item{temporal.intensity}{the fixed temporal component: either a numeric vector, or a function that can be coerced into an object of class temporalAtRisk}

\item{cellwidth}{width of cells  in same units as observation window}

\item{model.parameters}{parameters of model, see ?lgcppars.}

\item{spatial.covmodel}{spatial covariance function, default is exponential, see ?CovarianceFct}

\item{covpars}{vector of additional parameters for spatial covariance function, in order they appear in chosen model in ?CovarianceFct}

\item{returnintensities}{logigal, whether to return the spatial intensities and true field Y at each time. Default FALSE.}

\item{progressbar}{logical, whether to print a progress bar. Default TRUE.}

\item{ext}{how much to extend the parameter space by. Default is 2.}

\item{plot}{logical, whether to plot intensities.}

\item{ratepow}{power that intensity is raised to for plotting purposes (makes the plot more pleasign to the eye), defaul 0.25}

\item{sleeptime}{time in seconds to sleep between plots}

\item{inclusion}{criterion for cells being included into observation window. Either 'touching' or 'centroid'. The former includes all cells that touch the observation window, the latter includes all cells whose centroids are inside the observation window.}
}
\value{
an stppp object containing the data
}
\description{
Approximate simulation from a spatiotemoporal log-Gaussian Cox Process. Returns an stppp object.
}
\details{
The following is a mathematical description of a log-Gaussian Cox Process, it is best viewed in the pdf version of the manual.

Let \eqn{\mathcal Y(s,t)}{\mathcal Y(s,t)} be a spatiotemporal Gaussian process, \eqn{W\subset R^2}{W\subset R^2} be an
observation window in space and \eqn{T\subset R_{\geq 0}}{T\subset R_{\geq 0}} be an interval of time of interest.
Cases occur at spatio-temporal positions \eqn{(x,t) \in W \times T}{(x,t) \in W \times T}
 according to an inhomogeneous spatio-temporal Cox process,
i.e. a Poisson process with a stochastic intensity \eqn{R(x,t)}{R(x,t)},
  The number of cases, \eqn{X_{S,[t_1,t_2]}}{X_{S,[t_1,t_2]}}, arising in
  any \eqn{S \subseteq W}{S \subseteq W} during the interval \eqn{[t_1,t_2]\subseteq T}{[t_1,t_2]\subseteq T} is
  then Poisson distributed conditional on \eqn{R(\cdot)}{R(\cdot)},
\deqn{X_{S,[t_1,t_2]} \sim \mbox{Poisson}\left\{\int_S\int_{t_1}^{t_2} R(s,t)d sd t\right\}}{X_{S,[t_1,t_2]} \sim \mbox{Poisson}\left\{\int_S\int_{t_1}^{t_2} R(s,t)d sd t\right\}.}
Following Brix and Diggle (2001) and Diggle et al (2005), the intensity is decomposed multiplicatively as
\deqn{R(s,t) = \lambda(s)\mu(t)\exp\{\mathcal Y(s,t)\}.}{R(s,t) = \lambda(s)\mu(t)Exp\{\mathcal Y(s,t)\}.}
In the above, the fixed spatial component, \eqn{\lambda:R^2\mapsto R_{\geq 0}}{\lambda:R^2\mapsto R_{\geq 0}},
is a known function, proportional to the population at risk at each point in space and scaled so that
\deqn{\int_W\lambda(s)d s=1,}{\int_W\lambda(s)d s=1,}
whilst the fixed temporal component,
 \eqn{\mu:R_{\geq 0}\mapsto R_{\geq 0}}{\mu:R_{\geq 0}\mapsto R_{\geq 0}}, is also a known function with
\deqn{\mu(t) \delta t = E[X_{W,\delta t}],}{\mu(t) \delta t = E[X_{W,\delta t}],}
for \eqn{t}{t} in a small interval of time, \eqn{\delta t}{\delta t}, over which the rate of the process over \eqn{W}{W} can be considered constant.
}
\examples{
\dontrun{library(spatstat.explore); library(spatstat.utils); xyt <- lgcpSim()}
}
\references{
\enumerate{
    \item Benjamin M. Taylor, Tilman M. Davies, Barry S. Rowlingson, Peter J. Diggle (2013). Journal of Statistical Software, 52(4), 1-40. URL http://www.jstatsoft.org/v52/i04/
    \item Brix A, Diggle PJ (2001). Spatiotemporal Prediction for log-Gaussian Cox processes. Journal of the Royal Statistical Society, Series B, 63(4), 823-841.
    \item Diggle P, Rowlingson B, Su T (2005). Point Process Methodology for On-line Spatio-temporal Disease Surveillance. Environmetrics, 16(5), 423-434.
    \item Wood ATA, Chan G (1994). Simulation of Stationary Gaussian Processes in [0,1]d. Journal of Computational and Graphical Statistics, 3(4), 409-432.
    \item Moller J, Syversveen AR, Waagepetersen RP (1998). Log Gaussian Cox Processes. Scandinavian Journal of Statistics, 25(3), 451-482.
}
}
\seealso{
\link{lgcpPredict}, \link{showGrid.stppp}, \link{stppp}
}
