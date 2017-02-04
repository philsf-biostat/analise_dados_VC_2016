source("scripts/mybarplot.R")

# locale BR ---------------------------------------------------------------
suppressWarnings(Sys.setlocale("LC_NUMERIC", "pt_BR.UTF-8"))

png("graficos/comorbidades-genero.png", 700, 1400)
par(mfrow = c(4,2))
mybarplot(ar.genero, "AR", "Gênero")
mybarplot(avc.genero, "AVC", "Gênero")
mybarplot(cardio.genero, "Cardiopatia", "Gênero")
mybarplot(dm.genero, "DM", "Gênero")
mybarplot(dr.genero, "DR", "Gênero")
mybarplot(has.genero, "HAS", "Gênero")
mybarplot(obesidade.genero, "Obesidade", "Gênero")
mybarplot(numcomorb.genero, "Número de comorbidades", "Gênero")
dev.off()

png("graficos/comorbidades-idade.png", 700, 1400)
par(mfrow = c(4,2))
mybarplot(ar.idade, "AR", "Faixa etária")
mybarplot(avc.idade, "AVC", "Faixa etária")
mybarplot(cardio.idade, "Cardiopatia", "Faixa etária")
mybarplot(dm.idade, "DM", "Faixa etária")
mybarplot(dr.idade, "DR", "Faixa etária")
mybarplot(has.idade, "HAS", "Faixa etária")
mybarplot(obesidade.idade, "Obesidade", "Faixa etária")
mybarplot(numcomorb.idade, "Número de comorbidades", "Faixa etária")
dev.off()

png("graficos/nummeds-genero.png", 700, 700)
mybarplot(nummeds.genero, "Número de medicamentos", "Gênero")
dev.off()

png("graficos/nummeds-idade.png", 700, 700)
mybarplot(nummeds.idade, "Número de medicamentos", "Faixa etária")
dev.off()

png("graficos/centros.png", 700, 700)
par(mar = c(7, 4, 4, 2) + 0.2) #add room for the rotated labels
cp <- barplot(CAE.tab, axes = FALSE, axisnames = FALSE, ylab = "Quantidade", col = rainbow(length((rownames(CAE.alfa))), .6, .6), ylim = c(0 , 1.3*max(CAE.tab)))
text(cp, par("usr")[3]-5, labels = rownames(CAE.tab), srt = 60, adj = c(1,1), xpd = TRUE)
axis(2)
title("Casos por Centro de Atenção Especializada")
dev.off()

png("graficos/centros_o_alfabetica.png", 700, 700)
par(mar = c(7, 4, 4, 2) + 0.2) #add room for the rotated labels
cp <- barplot(CAE.alfa, axes = FALSE, axisnames = FALSE, ylab = "Quantidade", col = rev(rainbow(length((rownames(CAE.alfa))), .6, .6)), ylim = c(0 , 1.3*max(CAE.alfa)))
text(cp, par("usr")[3]-5, labels = rownames(CAE.alfa), srt = 60, adj = c(1,1), xpd = TRUE)
axis(2)
title("Casos por Centro de Atenção Especializada")
dev.off()

# locale padrão -----------------------------------------------------------
Sys.setlocale("LC_NUMERIC", "C")
