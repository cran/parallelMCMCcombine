\name{sampleAvg}
\alias{sampleAvg}
\title{ Sample Averaging Method }
\description{The function combines the independent subset posterior samples subchains into  the set of samples that estimate the posterior density given the full data set, by averaging the samples across subsets. Individual model
parameters are assumed to be independent.}
\usage{
sampleAvg(subchain, shuff = FALSE)
}
\arguments{
  \item{subchain}{
array of subset posterior samples of the dimension \option{c(d,sampT,M).} Here \option{d} is the dimension of the parameter space, \option{sampT} is the number of samples, and \option{M} is the number of subposterior datasets.
}

  \item{shuff}{shuff: logical; if TRUE, each of the \option{M} subsets of \option{d} dimensional parameters  in \option{subchain} is shuffled.}
}
\details{ The array \option{subchain} must have dimension \option{c(d,sampT,M)}. Here \option{d} is the dimension of the parameter space, \option{sampT} is the number of samples, and \option{M} is the number of subposterior datasets.
}

\value{Returns an array of samples of dimension dim=c(d,sampT) representing an estimated (combined) full posterior density.}

\examples{d      <- 2     # dimension of the parameter space  
sampT  <- 1000  # number of subset posterior samples
M      <- 3     # total number of subsets

## simulate Gaussian subposterior samples

theta <- array(NA,c(d,sampT,M)) 

norm.mean <- c(1.0, 2.0)
norm.sd   <- c(0.5, 1.0)

for (i in 1:d)
  for (s in 1:M)        
    theta[i,,s] <- rnorm(sampT, mean=norm.mean[i]+runif(1,-0.01,0.01), sd=norm.sd[i])

## combine samples:

full.theta <- sampleAvg(subchain=theta, shuff=FALSE)
}

\keyword{combine}
\keyword{consensus}
\keyword{subposterior}
\keyword{posterior}
\keyword{parallel}
