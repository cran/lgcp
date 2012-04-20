\name{extendspatialAtRisk}
\alias{extendspatialAtRisk}
\title{extendspatialAtRisk function}
\usage{
extendspatialAtRisk(spatial)
}
\arguments{
  \item{spatial}{a spatialAtRisk object inheriting class
  'fromXYZ'}
}
\value{
the spatialAtRisk object on a slightly larger grid, with
zeros appearing outside the original extent.
}
\description{
A function to extend a spatialAtRisk object, used in
interpolating the fft grid NOTE THIS DOES NOT RETURN A
PROPER spatialAtRisk OBJECT SINCE THE NORMALISING CONSTANT
IS PUT BACK IN.
}
