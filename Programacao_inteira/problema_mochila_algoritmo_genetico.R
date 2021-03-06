library(GA)

mochila <- data.frame(item = c("canivete", "feijao", "batatas", "lanterna",
                               "saco de dormir", "corda", "bussola"), 
                      pontos = c(10, 20, 15, 2, 30, 10, 30),
                      peso = c(1, 5, 10, 1, 7, 5, 1))

f <- function(x)
{
  pontos = 0
  peso = 0
  for (i in 1:7)
  {
    if (x[i] != 0){
      pontos = pontos + mochila[i, 2]
      peso = peso + mochila[i, 3]
    }
    
  }
  if(peso > 15){
    pontos = 0
  }
return(pontos)
} # Final da funcao

resultado = ga("binary", fitness = f, nBits = 7, popSize = 10, maxiter = 5000,
               names = c("canivete", "feijao", "batatas", "lanterna",
                         "saco de dormir", "corda", "bussola"))

summary(resultado)
