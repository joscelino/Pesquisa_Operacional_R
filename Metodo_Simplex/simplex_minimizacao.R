library(lpSolve)

# Goal function
f_obj <- c(23, 58, 15, 30, 60, 16)

# Constrains (Matrix)
constrains <- matrix(c(1, 1, 0, 0, 0, 0,
                       0, 0, 1, 1, 0, 0,
                       0, 0, 0, 0, 1, 1,
                       45, 0, 22, 0, 16, 0,
                       0, 45, 0, 22, 0, 16), nrow = 5, byrow = T)

constrains_dir <- c("<=", "<=", "<=", ">=", ">=")
constrais_rhs <- c(3, 3, 5, 150, 100)

# Model
model <- lp("min", f_obj, constrains, constrains_dir, constrais_rhs,
            compute.sens = T, all.int = T)

# Solution
model$solution

# Status
model$status

# Result
model

