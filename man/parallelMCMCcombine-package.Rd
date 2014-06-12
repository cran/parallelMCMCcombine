\name{parallelMCMCcombine-package}
\alias{parallelMCMCcombine-package}
\docType{package}
\title{parallelMCMCcombine
}
\description{Recent Bayesian Markov chain Monto Carlo (MCMC) methods have been developed for big data sets that are too large to be analyzed using traditional statistical methods. These methods partition the data into non-overlapping subsets, and perform parallel independent Bayesian MCMC analyses on the data subsets, creating independent subposterior samples for each data subset. These independent subposterior samples are combined through four functions in this package, including averaging across subset samples, weighted averaging across subsets samples, and kernel smoothing across subset samples. The four functions assume the user has previously run the Bayesian analysis and has produced the independent subposterior samples outside of the package; the functions use as input the array of subposterior samples. The methods have been demonstrated to be useful for Bayesian MCMC models including Bayesian logistic regression, Bayesian Gaussian mixture models and Bayesian hierarchical Poisson-Gamma models. The methods are appropriate for Bayesian hierarchical models with hyperparameters, as long as data values in a single level of the hierarchy are not split into subsets.}
\details{
\tabular{ll}{
Package: \tab parallelMCMCcombine\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-06-12\cr
License: \tab GPL-2\cr 
}
The package contains the following functions:


\code{\link{consensusMCcov}}   Consensus Monte Carlo Algorithm (for correlated parameters) 

\code{\link{consensusMCindep}} Consensus Monte Carlo Algorithm (for independent parameters)

\code{\link{sampleAvg}}  Sample Averaging Method

\code{\link{semiparamDPE}}  Semiparametric Method

%that combine subset posterior samples into samples with a posterior density given the full data set.
}
\author{
Alexey Miroshnikov, Erin Conlon

Maintainer: Alexey Miroshnikov \email{amiroshn@gmail.com}
}
\references{Scott, S.L., Blocker, A. W., Bonassi (2013) {Bayes and Big Data: The consensus Monte Carlo Algorithm}. \emph{Bayes 250}.

Neiswanger, W., Wang, C., Xing, E. (2014) Asymptotically exact, embarrassingly parallel MCMC. \emph{arXiv:1311.4780v2.}

Silverman, B.W. (1986). Density Estimation for Statistics and Data Analysis. \emph{Chapman & Hall/CRC. pp. 7-11}. 
}

\keyword{combine}
\keyword{consensus}
\keyword{subposterior}
\keyword{posterior}
\keyword{parallel}