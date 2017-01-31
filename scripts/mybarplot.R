mybarplot <- function(tab, desfecho = NULL, preditor = NULL) {
  par(mar = c(7, 5, 4, 2) + 0.1) #add room for the rotated labels
  main <- paste(desfecho, "por", preditor)
  col <- rev(rainbow(length((rownames(tab))), .6, .6))
  barplot(tab,
          beside = T,
          col = col,
          cex.axis = 1.2,
          cex.lab = 1.6,
          cex.names = 1.5,
          cex.sub = 1.2,
          ylim = c(0, 1.2*max(tab)),
          xlab = desfecho,
          ylab = "Número de pacientes")
  if ( is.matrix(tab) ) {
    mtext( paste("p-valor:",
                 format.pval(fisher.test(tab, workspace = 2e+6)$p.value,
                             eps = .001,
                             digits = 2)
    ), cex = 1.3)
    legend("topright",
           rownames(tab),
           title = preditor,
           fill = col
    )
  }
  else
    main <- desfecho
  title(
    main = main,
    cex.main = 2,
  )
}
