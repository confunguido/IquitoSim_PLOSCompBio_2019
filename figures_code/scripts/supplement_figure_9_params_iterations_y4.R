#======================================================================================#
# Author: Guido España, Alex Perkins
# analyze output of parameter sweep of vaccine properties
# project: PLOS COMP BIO paper 2019 Iquitos
# Year: 2019
#
#======================================================================================#
library(vioplot)
pdf('../output/FigureS09_param_iterations_y_4.pdf',width=6.5,height=4)

layout(matrix(1:3))
par(oma=c(4,6,0.5,0.1),mar=rep(0,4))

p = readRDS('./particles_09.RDS')
e = data.frame(y2000=p$y_4_09)
p = readRDS('./particles_10.RDS')
e$y2009 = p$y_4_09
p = readRDS('./particles_11.RDS')
e$y2010 = p$y_4_09
p = readRDS('./particles_final_11_0.RDS')
e$y2011a = p$y_4_09
p = readRDS('./particles_final_11_1.RDS')
e$y2011b = p$y_4_09
p = readRDS('./particles_final_11_2.RDS')
e$y2011c = p$y_4_09
plot(-1e3,-1e3,xlim=c(-7,6),ylim=range(e),las=1,xaxt='n',xlab='',ylab='')
vioplot(
  e$y2000,e$y2009,e$y2010,e$y2011a,e$y2011b,e$y2011c,
  drawRect=F,col=rgb(0,0,1,0.4),add=T)
mtext('y_4_09',2,line=4.5)

p = readRDS('./particles_10.RDS')
e = data.frame(y2000=p$y_4_10)
p = readRDS('./particles_11.RDS')
e$y2010 = p$y_4_10
p = readRDS('./particles_final_11_0.RDS')
e$y2011a = p$y_4_10
p = readRDS('./particles_final_11_1.RDS')
e$y2011b = p$y_4_10
p = readRDS('./particles_final_11_2.RDS')
e$y2011c = p$y_4_10
plot(-1e3,-1e3,xlim=c(-8,5),ylim=range(e),las=1,xaxt='n',xlab='',ylab='')
vioplot(
  e$y2000,e$y2010,e$y2011a,e$y2011b,e$y2011c,
  drawRect=F,col=rgb(0,0,1,0.4),add=T)
mtext('y_4_10',2,line=4.5)

p = readRDS('./particles_11.RDS')
e = data.frame(y2000=p$y_4_11)
p = readRDS('./particles_final_11_0.RDS')
e$y2011a = p$y_4_11
p = readRDS('./particles_final_11_1.RDS')
e$y2011b = p$y_4_11
p = readRDS('./particles_final_11_2.RDS')
e$y2011c = p$y_4_11
plot(-1e3,-1e3,xlim=c(-9,4),ylim=range(e),las=1,xaxt='n',xlab='',ylab='')
vioplot(
  e$y2000,e$y2011a,e$y2011b,e$y2011c,
  drawRect=F,col=rgb(0,0,1,0.4),add=T)
mtext('y_4_11',2,line=4.5)

axis(1,at=-9:4,labels=c('00','01','02','03','04','05','06','07','08','09','10','11a','11b','11c'))
mtext('Calibration iteration',1,line=2.5)

dev.off()










