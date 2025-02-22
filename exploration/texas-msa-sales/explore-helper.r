library(MASS)
library(mgcv)
options(na.action = "na.exclude")

# Helper functions ----------------------------------------------------------
index <- function(x) x / x[1]


deseas <- function(var, month) {
  # var - ave(var, month, mean, na.rm = TRUE) + mean(var, na.rm = TRUE)
  resid(rlm(var ~ factor(month))) + mean(var, na.rm = TRUE)
}
smooth <- function(var, date) {
  predict(gam(var ~ s(date)))
}