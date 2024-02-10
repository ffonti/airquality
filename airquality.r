data("airquality")
?airquality
data <- data.frame(airquality)

coeff_corr <- cor(data$Temp, data$Ozone, use = "complete.obs")

mod <- lm(Ozone ~ Temp, data = data)

summary(mod)

plot(data$Ozone ~ data$Temp)

abline(mod, col = "black", lwd = 2)