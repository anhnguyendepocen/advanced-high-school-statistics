require(openintro)
data(COL)
data(possum)

myPDF('scattHeadLTotalLResidualPlot.pdf', 6, 4,
      mar = c(3, 3, 0.5, 1),
      mgp = c(1.8, 0.6, 0))
these <- c(48, 42, 3)
plot(possum$total_l[-these],
     possum$head_l[-these] - (41 + 0.59 * possum$total_l[-these]),
     pch = 19,
     col = COL[1, 2],
     axes=TRUE,
     frame.plot = FALSE,
     xlab = 'Total Length (cm)',
     ylab = 'Residuals',
     ylim = c(-7, 9))
y.extra <- 0.59 * possum$total_l[these] + rnorm(1,0,0.01)
axis(1,seq(70,100,5))
axis(2,seq(-15,15,5))
rect(par("usr")[1],par("usr")[3],par("usr")[2],par("usr")[4],col = COL[5,9], border=NA)

points(possum$total_l[these] + rnorm(1, 0, 0.01),
       possum$head_l[these] - (41 + y.extra),
       pch = c(3, 4, 2),
       col = COL[4],
       cex = 1.3,
       lwd = 2.5)
abline(h = 0, lty = 2)
dev.off()
