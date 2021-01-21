library(lpSolve)

# Modelo 3 produtos com lucros de 3, 5 e 8 respectivamente
# max = 3a + 5b + 8c

# 8a + 2B + 3c <= 5000 (espaco fisico)
# 2a + 8b + 3c <= 8000 (tecido em m)
# 2a + 3b + 8c <= 7000 (horas maquina)

# Desenhando o Modelo
funcao_objetivo <- c(3, 5, 8)
restricoes <- matrix(c(8, 2, 3,
                       2, 8, 3,
                       2, 3, 8), ncol = 3, byrow = T)
restricoes_dir <- c("<=", "<=", "<=")
restricoes_rhs <- c(5000, 8000, 7000)

# Rodando o modelo usando LP com os argimentos Max ou Mix, Obj, Restri, Direcao, Restri_rhs
model <- lp("max", funcao_objetivo, restricoes, restricoes_dir, restricoes_rhs,
            compute.sens = T, all.int = T)

# Verificando a quantidade sugerida pelo modelo
model$solution

# Status do modelo
model$status # 0 = otimo

# Forcando o R a nao usar numeros exponenciais
options("scipen"=100, digits = 4)

# resultado do modelo
model
