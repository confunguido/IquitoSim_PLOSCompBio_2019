#======================================================================================#
# Author: Guido España, Alex Perkins
# analyze output of parameter sweep of vaccine properties
# project: PLOS COMP BIO paper 2019 Iquitos
# Year: 2019
#
#======================================================================================#
library(vioplot)
pdf('../output/FigureS01_param_iterations_e.pdf',width=6.5,height=3)

layout(matrix(1:2))
par(oma=c(3.5,3,0.25,0.1),mar=rep(0,4))
p = readRDS('./particles_01.RDS')
e = data.frame(y2000=p$e0)
p = readRDS('./particles_02.RDS')
e$y2001 = p$e0
p = readRDS('./particles_03.RDS')
e$y2002 = p$e0
p = readRDS('./particles_04.RDS')
e$y2003 = p$e0
p = readRDS('./particles_05.RDS')
e$y2004 = p$e0
p = readRDS('./particles_06.RDS')
e$y2005 = p$e0
p = readRDS('./particles_07.RDS')
e$y2006 = p$e0
p = readRDS('./particles_08.RDS')
e$y2007 = p$e0
p = readRDS('./particles_09.RDS')
e$y2008 = p$e0
p = readRDS('./particles_10.RDS')
e$y2009 = p$e0
p = readRDS('./particles_11.RDS')
e$y2010 = p$e0
p = readRDS('./particles_final_11_0.RDS')
e$y2011a = p$e0
p = readRDS('./particles_final_11_1.RDS')
e$y2011b = p$e0
p = readRDS('./particles_final_11_2.RDS')
e$y2011c = p$e0
plot(-1e3,-1e3,xlim=c(1,14),ylim=c(-1.5,5.5),las=1,xaxt='n',xlab='',ylab='')
vioplot(
  e$y2000,e$y2001,e$y2002,e$y2003,e$y2004,e$y2005,e$y2006,
  e$y2007,e$y2008,e$y2009,e$y2010,e$y2011a,e$y2011b,e$y2011c,
  drawRect=F,col=rgb(0,0,1,0.4),add=T)
mtext('e0',2,line=2)

e = data.frame(y2010=p$e1)
p = readRDS('./particles_final_11_0.RDS')
e$y2011a = p$e1
p = readRDS('./particles_final_11_1.RDS')
e$y2011b = p$e1
p = readRDS('./particles_final_11_2.RDS')
e$y2011c = p$e1
plot(-1e3,-1e3,xlim=c(-9,4),ylim=c(-1.5,5.5),las=1,xaxt='n',xlab='',ylab='')
vioplot(
  e$y2010,e$y2011a,e$y2011b,e$y2011c,
  drawRect=F,col=rgb(0,0,1,0.4),add=T)
mtext('e1',2,line=2)

axis(1,at=-9:4,labels=c('00','01','02','03','04','05','06','07','08','09','10','11a','11b','11c'))
mtext('Calibration iteration',1,line=2.25)

dev.off()










