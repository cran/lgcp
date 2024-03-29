% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SpatioTemporalPlusParameters.R
\name{lgcpPredictSpatioTemporalPlusPars}
\alias{lgcpPredictSpatioTemporalPlusPars}
\title{lgcpPredictSpatioTemporalPlusPars function}
\usage{
lgcpPredictSpatioTemporalPlusPars(
  formula,
  xyt,
  T,
  laglength,
  ZmatList = NULL,
  model.priors,
  model.inits = lgcpInits(),
  spatial.covmodel,
  cellwidth = NULL,
  poisson.offset = NULL,
  mcmc.control,
  output.control = setoutput(),
  gradtrunc = Inf,
  ext = 2,
  inclusion = "touching"
)
}
\arguments{
\item{formula}{a formula object of the form X ~ var1 + var2 etc. The name of the dependent variable must be "X". Only accepts 'simple' formulae, such as the example given.}

\item{xyt}{An object of class stppp}

\item{T}{the time point of interest}

\item{laglength}{the number of previous time points to include in the analysis}

\item{ZmatList}{A list of design matrices Z constructed with getZmat and possibly addTemporalCovariates see the details below and Bayesian_lgcp vignette for details on how to construct this.}

\item{model.priors}{model priors, set using lgcpPrior}

\item{model.inits}{model initial values. The default is NULL, in which case lgcp will use the prior mean to initialise eta and beta will be initialised from an oversispersed glm fit to the data. Otherwise use lgcpInits to specify.}

\item{spatial.covmodel}{choice of spatial covariance function. See ?CovFunction}

\item{cellwidth}{the width of computational cells}

\item{poisson.offset}{A list of SpatialAtRisk objects (of length the number of types) defining lambda_k (see below)}

\item{mcmc.control}{MCMC paramters, see ?mcmcpars}

\item{output.control}{output choice, see ?setoutput}

\item{gradtrunc}{truncation for gradient vector equal to H parameter Moller et al 1998 pp 473. Default is Inf, which means no gradient truncation, which seems to work in most settings.}

\item{ext}{integer multiple by which grid should be extended, default is 2. Generally this will not need to be altered, but if the spatial correlation decays slowly, increasing 'ext' may be necessary.}

\item{inclusion}{criterion for cells being included into observation window. Either 'touching' or 'centroid'. The former, the default, includes all cells that touch the observation window, the latter includes all cells whose centroids are inside the observation window.}
}
\value{
an object of class lgcpPredictSpatioTemporalPlusParameters
}
\description{
A function to deliver fully Bayesian inference for the spatiotemporal log-Gaussian Cox process.\cr
}
\details{
See the vignette "Bayesian_lgcp" for examples of this code in use.\cr

The model for the data is as follows:\cr
\cr
X(s) ~ Poisson[R(s,t)]\cr
\cr
R(s) = C_A lambda(s,t) exp[Z(s,t)beta+Y(s,t)]\cr
\cr

Here X(s,t) is the number of events in the cell of the computational grid containing s, R(s,t) is the Poisson rate,
C_A is the cell area, lambda(s,t) is a known offset, Z(s,t) is a vector of measured covariates and Y(s,t) is the
latent Gaussian process on the computational grid. The other parameters in the model are beta, the covariate effects;
and eta=[log(sigma),log(phi),log(theta)], the parameters of the process Y on an appropriately transformed (in this case log) scale.\cr

We recommend the user takes the following steps before running this method:

\enumerate{
   \item Compute approximate values of the parameters, eta, of the process Y using the function minimum.contrast.
       These approximate values are used for two main reasons: (1) to help inform the size of the computational grid, since we
       will need to use a cell width that enables us to capture the dependence properties of Y and (2) to help inform the
       proposal kernel for the MCMC algorithm.
   \item Choose an appropriate grid on which to perform inference using the function chooseCellwidth; this will partly be determined
       by the results of the first stage and partly by the available computational resource available to perform inference.
   \item Using the function getpolyol, construct the computational grid and polygon overlays, as required. As this can be an expensive step,
       we recommend that the user saves this object after it has been
       constructed and in future reference to the data, reloads this object, rather than having to re-compute it (provided the
       computational grid has not changed).
   \item Decide on which covariates are to play a part in the analysis and use the lgcp function getZmat to interpolate these
       onto the computational grid. Note that having saved the results from the previous step, this is a relatively quick operation,
       and allows the user to quickly construct different design matrices, Z, from different candidate models for the data
   \item If required, set up the population offset using SpatialAtRisk functions (see the vignette "Bayesian_lgcp"); specify the priors
       using lgcpPrior; and if desired, the initial values for the MCMC, using the function lgcpInits.
   \item Run the MCMC algorithm and save the output to disk. We recommend dumping information to disk using the dump2dir function
       in the output.control argument because it offers much greater flexibility in terms of MCMC diagnosis and post-processing.
   \item Perform post-processing analyses including MCMC diagnostic checks and produce summaries of the posterior expectations
       we require for presentation. (see the vignette "Bayesian_lgcp" for further details). Functions of use in this step include
       traceplots, autocorr, parautocorr, ltar, parsummary, priorpost, postcov, textsummary, expectation, exceedProbs and lgcp:::expectation.lgcpPredict
}

The user must provide a list of design matrices to use this function. In the interpolation step above, there are three cases to consider

\enumerate{
   \item where Z(s,t) cannot be decomposed, i.e., Z are true spatiotemporal covariates. In this case, each element of the list must
       be constructed separately using the function getZmat on the covariates for each time point.
   \item Z(s,t)beta = Z_1(s)beta_1 + Z_2(t)beta_2: the spatial and temporal effects are separable;
       in this case use the function addTemporalCovariates, to aid in the construction of the list.
   \item Z(s,t)beta = Z(s)beta, in which case the user only needs to perform the interpolation using getZmat
       once, each of the elements of the  list will then be identical.
   \item Z(s,t)beta =  Z(t)beta in this case we follow the procedure for the separable case above.
       For example, if dotw is a temporal covariate we would use formula <- X ~ dotw for the main algorithm, formula.spatial <- X ~ 1 to
       interpolate the spatial covariates using getZmat, followed by temporal.formula <- t ~ dotw - 1 using addTemporalCovariates
       to construct the list of design matrices, Zmat.
}
}
\references{
\enumerate{
    \item Benjamin M. Taylor, Tilman M. Davies, Barry S. Rowlingson, Peter J. Diggle. Bayesian Inference and Data Augmentation Schemes for Spatial, Spatiotemporal and Multivariate Log-Gaussian Cox Processes in R. Submitted.
    \item Benjamin M. Taylor, Tilman M. Davies, Barry S. Rowlingson, Peter J. Diggle (2013). Journal of Statistical Software, 52(4), 1-40. URL http://www.jstatsoft.org/v52/i04/
    \item Brix A, Diggle PJ (2001). Spatiotemporal Prediction for log-Gaussian Cox processes. Journal of the Royal Statistical Society, Series B, 63(4), 823-841.
    \item Diggle P, Rowlingson B, Su T (2005). Point Process Methodology for On-line Spatio-temporal Disease Surveillance. Environmetrics, 16(5), 423-434.
    \item Wood ATA, Chan G (1994). Simulation of Stationary Gaussian Processes in [0,1]d. Journal of Computational and Graphical Statistics, 3(4), 409-432.
    \item Moller J, Syversveen AR, Waagepetersen RP (1998). Log Gaussian Cox Processes. Scandinavian Journal of Statistics, 25(3), 451-482.
}
}
\seealso{
link{chooseCellWidth}, \link{getpolyol}, \link{guessinterp}, \link{getZmat},
\link{addTemporalCovariates}, \link{lgcpPrior}, \link{lgcpInits}, \link{CovFunction}
\link{lgcpPredictSpatialPlusPars}, \link{lgcpPredictAggregateSpatialPlusPars},
\link{lgcpPredictMultitypeSpatialPlusPars},
\link{ltar}, \link{autocorr}, \link{parautocorr}, \link{traceplots}, \link{parsummary}, \link{textsummary},
\link{priorpost}, \link{postcov}, \link{exceedProbs}, \link{betavals}, \link{etavals}
}
