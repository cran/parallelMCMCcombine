\name{consensusMCindep}

\alias{consensusMCindep}

\title{ Consensus Monte Carlo Algorithm (for independent parameters)}
\description{The function uses the Consensus Monte Carlo algorithm introduced by Scott et al. (see References) to combine the independent subset posterior samples subchains into the set of samples that estimate the posterior density given the full data set. The Consensus Monte Carlo algorithm uses a weighted average of the subset posterior samples to produce the combined posterior samples, where the weights are based on the inverse variance-covariance matrix of the subset posterior samples. Here, the model parameters are assumed to be independent, so that the covariance between model parameters is equal to zero.}
\usage{
consensusMCindep(subchain, shuff = FALSE)
}

\arguments{
  \item{subchain}{
array of subset posterior samples of the dimension \option{c(d,sampT,M).} Here \option{d} is the dimension of the parameter space, \option{sampT} is the number of samples, and \option{M} is the number of subposterior datasets.
}
  \item{shuff}{shuff: logical; if TRUE, each of the \option{M} subsets of \option{d} dimensional parameters  in \option{subchain} is shuffled.}
}

\details{ The array \option{subchain} must have dimension \option{c(d,sampT,M)}. Here \option{d} is the dimension of the parameter space, \option{sampT} is the number of samples, and \option{M} is the number of subposterior datasets.
}

\value{Returns an array of samples of dimension dim=c(d,sampT)
representing an estimated (combined) full posterior density.}

\references{
Scott, S.L., Blocker, A. W., Bonassi (2013) {Bayes and Big Data: The consensus Monte Carlo Algorithm}. \emph{Bayes 250 day}.
}

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

full.theta <- consensusMCindep(subchain=theta, shuff=FALSE)
}
\keyword{combine}
\keyword{consensus}
\keyword{subposterior}
\keyword{posterior}
\keyword{parallel}