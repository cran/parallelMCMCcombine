\name{semiparamDPE}
\alias{semiparamDPE}

\title{ Semiparametric Density Product Estimator Method}

\description{The function uses the Semiparametric Density Product Estimator method introduced by Neiswanger et al. (see References) to combine the independent subset posterior samples subchains into the set of samples that estimate the posterior density given the full data set. The semiparametric density product estimator method uses kernel smoothing techniques to estimate each subset posterior density; the subposterior densities are then multiplied together to approximate the posterior density based on the full data set.}

\usage{
semiparamDPE(subchain, bandw = rep(1.0, dim(subchain)[1]), anneal = TRUE, shuff = FALSE)
}

\arguments{
  \item{subchain}{
array of subset posterior samples of the dimension \option{c(d,sampT,M).} Here \option{d} is the dimension of the parameter space, \option{sampT} is the number of samples, and \option{M} is the number of subposterior datasets.
}
  \item{bandw}{ bandwidth vector of the length \option{d=dim(subchain)[1]}. It is a vector of tuning parameters used in kernel density approximation employed by the semiparametric method. When \option{anneal=TRUE} then one of the choices for \option{bandw} could be the vector consisting of standard deviations for each of the \option{d} parameters. When \option{anneal=FALSE} then one of the choices for \option{bandw} could be the diagonal of the optimal bandwidth matrix obtained via Silverman's rule of thumb; see Examples. By default \option{bandw=rep(1.0,d)}. }

  \item{anneal}{ logical; if TRUE, the bandwidth \option{bandw} (instead of being fixed) is annealed as \option{bandw*i^(-1/(4+d))}; here \option{i} is the index corresponding to a sample; see References. }

  \item{shuff}{logical; if TRUE, each of the \option{M} subsets of \option{d} dimensional parameters  in \option{subchain} is shuffled.}
}

\value{Returns an array of samples of dimension dim=c(d,sampT)
representing an estimated (combined) full posterior density.}

\references{
Neiswanger, W., Wang, C., Xing E. (2014) Asymptotically exact, embarrassingly parallel MCMC. arXiv:1311.4780v2.

Silverman, B.W. (1986). Density Estimation for Statistics and Data Analysis. \emph{ Chapman & Hall/CRC. pp. 7-11}.
}

\examples{d      <- 2     # dimension of the parameter space
sampT  <- 300   # number of subset posterior samples
M      <- 3     # total number of subsets

## simulate Gaussian subposterior samples

theta <- array(NA,c(d,sampT,M))

norm.mean <- c(1.0, 2.0)
norm.sd   <- c(0.5, 1.0)

for (i in 1:d)
  for (s in 1:M)
    theta[i,,s] <- rnorm(sampT, mean=norm.mean[i]+runif(1,-0.01,0.01), sd=norm.sd[i])

## estimate (mean) standard deviations for each parameter across the subsets

norm.var.est <- rep(0,d)

for(i in 1:d)
  for(s in 1:M)
    norm.var.est[i] <- norm.var.est[i] + var(theta[i,,s])

norm.sd.est <- sqrt(norm.var.est/M)


## Compute the diagonal of the optimal bandwidth
## matrix according to Silverman's rule

h_opt1 = (4/(d+2))^(1/(4+d)) * (sampT^(-1/(4+d))) * norm.sd.est

## Combine samples. The bandwidth matrix is fixed:

full.theta1 <- semiparamDPE( subchain = theta, bandw = h_opt1 * 2, anneal = FALSE)

## Compute the diagonal of the optimal bandwidth
## matrix for the method that uses annealing

h_opt2 = (4/(d+2))^(1/(4+d)) * norm.sd.est

## Combine samples. The bandwidth matrix will be annealed:

full.theta2 <- semiparamDPE(subchain = theta, bandw = h_opt2 * 2, anneal = TRUE)
}
\keyword{combine}
\keyword{consensus}
\keyword{subposterior}
\keyword{posterior}
