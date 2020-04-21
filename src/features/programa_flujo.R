#PRUEBAS DE TRABAJO CON BUCLES PARA CÁLCULO DE FLUJOS

library(dplyr)
library(plyr)
od<-ORIGEN_DESTINO

# Con la librería dplyr podemos hacer el conteo de registros iguales, es decir, de todos los movimientos iguales
# tenemos el flujo general de un destino a un origen

od2<-ddply(od,.(ORIGEN,DESTINO),nrow)
names(od2)[3]<-'FLUJO' # Esta es la variable resumen del contador de flujos
od2
sum(od2$FLUJO)
save(od2,file="D:/ESTUDIOS/MASTER ANALISIS DATOS/PRACTICAS/Repositorio modelo GIT Data Analysis/R/modelo/data/processed/flujo.RData")

# Ahora el reto es definir los saldos para ver el flujo dominante. Se parte de una noción condicional que es:
# la diferencia entre aquellos casos en los que "ORIGEN_i==DESTINO_j & ORIGEN_j==DESTINO_i"
# Se interpreta que la mejor forma de llegar a esto es a través de un bucle con otro anidado

ifelse(od2$ORIGEN[1]==od2$DESTINO[2] & od2$DESTINO[1]==od2$ORIGEN[2],od2$FLUJO[1]-od2$FLUJO[2],0)
ifelse(od2$ORIGEN[1]==od2$DESTINO[2] & od2$DESTINO[1]==od2$ORIGEN[2],od2$FLUJO[1]-od2$FLUJO[2],0)

# La cadena condicional funciona correctamente con el dataframe creado

for(i in length(od2$ORIGEN)){
  for(j in length(od2$DESTINO)){
    if(od2$ORIGEN[i]==od2$DESTINO[j] & od2$DESTINO[i]==od2$ORIGEN[j],od2$FLUJO[i]-od2$FLUJO[j])}
  }

