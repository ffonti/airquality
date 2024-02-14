data("airquality")
?airquality
data <- data.frame(airquality)

Ozono <- data$Ozone
Temperatura <- data$Temp


coeff_corr <- cor(data$Temp, data$Ozone, use = "complete.obs")

mod <- lm(Ozono ~ Temperatura, data = data)

summary(mod)

plot(Ozono ~ Temperatura, 
     main = "Scatter plot: Livello di Ozono vs. Temperatura", 
     xlab = "Temperatura [°F]", 
     ylab = "Livello di Ozono [ppm]")

abline(mod, col = "red", lwd = 2)

print(shapiro.test(resid(mod)))

residui <- resid(mod)

residui_standardizzati <- resid(mod) / sd(resid(mod))

plot(fitted(mod), residui_standardizzati, 
     main = "Grafico dei residui", 
     xlab = "Valori del predittore X", 
     ylab = "Residui standardizzati")

abline(h = 0, col = "red")
