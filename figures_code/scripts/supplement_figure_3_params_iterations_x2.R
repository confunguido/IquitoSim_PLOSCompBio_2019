#======================================================================================#
# Author: Guido España, Alex Perkins
# analyze output of parameter sweep of vaccine properties
# project: PLOS COMP BIO paper 2019 Iquitos
# Year: 2019
#
#======================================================================================#
library(vioplot)
pdf('../output/FigureS03_param_iterations_x_2.pdf',width=6.5,height=9.5)

layout(matrix(1:11))
par(oma=c(4,4,0.25,0.1),mar=rep(0,4))

p = readRDS('./particles_01.RDS')
e = data.frame(y2000=p$x_2_01)
p = readRDS('./particles_02.RDS')
e$y2001 = p$x_2_01
p = readRDS('./particles_03.RDS')
e$y2002 = p$x_2_01
p = readRDS('./particles_04.RDS')
e$y2003 = p$x_2_01
p = readRDS('./particles_05.RDS')
e$y2004 = p$x_2_01
p = readRDS('./particles_06.RDS')
e$y2005 = p$x_2_01
p = readRDS('./particles_07.RDS')
e$y2006 = p$x_2_01
p = readRDS('./particles_08.RDS')
e$y2007 = p$x_2_01
p = readRDS('./particles_09.RDS')
e$y2008 = p$x_2_01
p = readRDS('./particles_10.RDS')
e$y2009 = p$x_2_01
p = readRDS('./particles_11.RDS')
e$y2010 = p$x_2_01
p = readRDS('./particles_final_11_0.RDS')
e$y2011a = p$x_2_01
p = readRDS('./particles_final_11_1.RDS')
e$y2011b = p$x_2_01
p = readRDS('./particles_final_11_2.RDS')
e$y2011c = p$x_2_01
plot(-1e3,-1e3,xlim=c(1,14),ylim=range(e),las=1,xaxt='n',xlab='',ylab='')
vioplot(
  e$y2000,e$y2001,e$y2002,e$y2003,e$y2004,e$y2005,e$y2006,
  e$y2007,e$y2008,e$y2009,e$y2010,e$y2011a,e$y2011b,e$y2011c,
  drawRect=F,col=rgb(0,0,1,0.4),add=T)
mtext('x_2_01',2,line=2.5)

p = readRDS('./particles_02.RDS')
e = data.frame(y2000=p$x_2_02)
p = readRDS('./particles_03.RDS')
e$y2002 = p$x_2_02
p = readRDS('./particles_04.RDS')
e$y2003 = p$x_2_02
p = readRDS('./particles_05.RDS')
e$y2004 = p$x_2_02
p = readRDS('./particles_06.RDS')
e$y2005 = p$x_2_02
p = readRDS('./particles_07.RDS')
e$y2006 = p$x_2_02
p = readRDS('./particles_08.RDS')
e$y2007 = p$x_2_02
p = readRDS('./particles_09.RDS')
e$y2008 = p$x_2_02
p = readRDS('./particles_10.RDS')
e$y2009 = p$x_2_02
p = readRDS('./particles_11.RDS')
e$y2010 = p$x_2_02
p = readRDS('./particles_final_11_0.RDS')
e$y2011a = p$x_2_02
p = readRDS('./particles_final_11_1.RDS')
e$y2011b = p$x_2_02
p = readRDS('./particles_final_11_2.RDS')
e$y2011c = p$x_2_02
plot(-1e3,-1e3,xlim=c(0,13),ylim=range(e),las=1,xaxt='n',xlab='',ylab='')
vioplot(
  e$y2000,e$y2002,e$y2003,e$y2004,e$y2005,e$y2006,
  e$y2007,e$y2008,e$y2009,e$y2010,e$y2011a,e$y2011b,e$y2011c,
  drawRect=F,col=rgb(0,0,1,0.4),add=T)
mtext('x_2_02',2,line=2.5)

p = readRDS('./particles_03.RDS')
e = data.frame(y2000=p$x_2_03)
p = readRDS('./particles_04.RDS')
e$y2003 = p$x_2_03
p = readRDS('./particles_05.RDS')
e$y2004 = p$x_2_03
p = readRDS('./particles_06.RDS')
e$y2005 = p$x_2_03
p = readRDS('./particles_07.RDS')
e$y2006 = p$x_2_03
p = readRDS('./particles_08.RDS')
e$y2007 = p$x_2_03
p = readRDS('./particles_09.RDS')
e$y2008 = p$x_2_03
p = readRDS('./particles_10.RDS')
e$y2009 = p$x_2_03
p = readRDS('./particles_11.RDS')
e$y2010 = p$x_2_03
p = readRDS('./particles_final_11_0.RDS')
e$y2011a = p$x_2_03
p = readRDS('./particles_final_11_1.RDS')
e$y2011b = p$x_2_03
p = readRDS('./particles_final_11_2.RDS')
e$y2011c = p$x_2_03
plot(-1e3,-1e3,xlim=c(-1,12),ylim=range(e),las=1,xaxt='n',xlab='',ylab='')
vioplot(
  e$y2000,e$y2003,e$y2004,e$y2005,e$y2006,
  e$y2007,e$y2008,e$y2009,e$y2010,e$y2011a,e$y2011b,e$y2011c,
  drawRect=F,col=rgb(0,0,1,0.4),add=T)
mtext('x_2_03',2,line=2.5)

p = readRDS('./particles_04.RDS')
e = data.frame(y2000=p$x_2_04)
p = readRDS('./particles_05.RDS')
e$y2004 = p$x_2_04
p = readRDS('./particles_06.RDS')
e$y2005 = p$x_2_04
p = readRDS('./particles_07.RDS')
e$y2006 = p$x_2_04
p = readRDS('./particles_08.RDS')
e$y2007 = p$x_2_04
p = readRDS('./particles_09.RDS')
e$y2008 = p$x_2_04
p = readRDS('./particles_10.RDS')
e$y2009 = p$x_2_04
p = readRDS('./particles_11.RDS')
e$y2010 = p$x_2_04
p = readRDS('./particles_final_11_0.RDS')
e$y2011a = p$x_2_04
p = readRDS('./particles_final_11_1.RDS')
e$y2011b = p$x_2_04
p = readRDS('./particles_final_11_2.RDS')
e$y2011c = p$x_2_04
plot(-1e3,-1e3,xlim=c(-2,11),ylim=range(e),las=1,xaxt='n',xlab='',ylab='')
vioplot(
  e$y2000,e$y2004,e$y2005,e$y2006,
  e$y2007,e$y2008,e$y2009,e$y2010,e$y2011a,e$y2011b,e$y2011c,
  drawRect=F,col=rgb(0,0,1,0.4),add=T)
mtext('x_2_04',2,line=2.5)

p = readRDS('./particles_05.RDS')
e = data.frame(y2000=p$x_2_05)
p = readRDS('./particles_06.RDS')
e$y2005 = p$x_2_05
p = readRDS('./particles_07.RDS')
e$y2006 = p$x_2_05
p = readRDS('./particles_08.RDS')
e$y2007 = p$x_2_05
p = readRDS('./particles_09.RDS')
e$y2008 = p$x_2_05
p = readRDS('./particles_10.RDS')
e$y2009 = p$x_2_05
p = readRDS('./particles_11.RDS')
e$y2010 = p$x_2_05
p = readRDS('./particles_final_11_0.RDS')
e$y2011a = p$x_2_05
p = readRDS('./particles_final_11_1.RDS')
e$y2011b = p$x_2_05
p = readRDS('./particles_final_11_2.RDS')
e$y2011c = p$x_2_05
plot(-1e3,-1e3,xlim=c(-3,10),ylim=range(e),las=1,xaxt='n',xlab='',ylab='')
vioplot(
  e$y2000,e$y2005,e$y2006,
  e$y2007,e$y2008,e$y2009,e$y2010,e$y2011a,e$y2011b,e$y2011c,
  drawRect=F,col=rgb(0,0,1,0.4),add=T)
mtext('x_2_05',2,line=2.5)

p = readRDS('./particles_06.RDS')
e = data.frame(y2000=p$x_2_06)
p = readRDS('./particles_07.RDS')
e$y2006 = p$x_2_06
p = readRDS('./particles_08.RDS')
e$y2007 = p$x_2_06
p = readRDS('./particles_09.RDS')
e$y2008 = p$x_2_06
p = readRDS('./particles_10.RDS')
e$y2009 = p$x_2_06
p = readRDS('./particles_11.RDS')
e$y2010 = p$x_2_06
p = readRDS('./particles_final_11_0.RDS')
e$y2011a = p$x_2_06
p = readRDS('./particles_final_11_1.RDS')
e$y2011b = p$x_2_06
p = readRDS('./particles_final_11_2.RDS')
e$y2011c = p$x_2_06
plot(-1e3,-1e3,xlim=c(-4,9),ylim=range(e),las=1,xaxt='n',xlab='',ylab='')
vioplot(
  e$y2000,e$y2006,
  e$y2007,e$y2008,e$y2009,e$y2010,e$y2011a,e$y2011b,e$y2011c,
  drawRect=F,col=rgb(0,0,1,0.4),add=T)
mtext('x_2_06',2,line=2.5)

p = readRDS('./particles_07.RDS')
e = data.frame(y2000=p$x_2_07)
p = readRDS('./particles_08.RDS')
e$y2007 = p$x_2_07
p = readRDS('./particles_09.RDS')
e$y2008 = p$x_2_07
p = readRDS('./particles_10.RDS')
e$y2009 = p$x_2_07
p = readRDS('./particles_11.RDS')
e$y2010 = p$x_2_07
p = readRDS('./particles_final_11_0.RDS')
e$y2011a = p$x_2_07
p = readRDS('./particles_final_11_1.RDS')
e$y2011b = p$x_2_07
p = readRDS('./particles_final_11_2.RDS')
e$y2011c = p$x_2_07
plot(-1e3,-1e3,xlim=c(-5,8),ylim=range(e),las=1,xaxt='n',xlab='',ylab='')
vioplot(
  e$y2000,
  e$y2007,e$y2008,e$y2009,e$y2010,e$y2011a,e$y2011b,e$y2011c,
  drawRect=F,col=rgb(0,0,1,0.4),add=T)
mtext('x_2_07',2,line=2.5)

p = readRDS('./particles_08.RDS')
e = data.frame(y2000=p$x_2_08)
p = readRDS('./particles_09.RDS')
e$y2008 = p$x_2_08
p = readRDS('./particles_10.RDS')
e$y2009 = p$x_2_08
p = readRDS('./particles_11.RDS')
e$y2010 = p$x_2_08
p = readRDS('./particles_final_11_0.RDS')
e$y2011a = p$x_2_08
p = readRDS('./particles_final_11_1.RDS')
e$y2011b = p$x_2_08
p = readRDS('./particles_final_11_2.RDS')
e$y2011c = p$x_2_08
plot(-1e3,-1e3,xlim=c(-6,7),ylim=range(e),las=1,xaxt='n',xlab='',ylab='')
vioplot(
  e$y2000,e$y2008,e$y2009,e$y2010,e$y2011a,e$y2011b,e$y2011c,
  drawRect=F,col=rgb(0,0,1,0.4),add=T)
mtext('x_2_08',2,line=2.5)

p = readRDS('./particles_09.RDS')
e = data.frame(y2000=p$x_2_09)
p = readRDS('./particles_10.RDS')
e$y2009 = p$x_2_09
p = readRDS('./particles_11.RDS')
e$y2010 = p$x_2_09
p = readRDS('./particles_final_11_0.RDS')
e$y2011a = p$x_2_09
p = readRDS('./particles_final_11_1.RDS')
e$y2011b = p$x_2_09
p = readRDS('./particles_final_11_2.RDS')
e$y2011c = p$x_2_09
plot(-1e3,-1e3,xlim=c(-7,6),ylim=range(e),las=1,xaxt='n',xlab='',ylab='')
vioplot(
  e$y2000,e$y2009,e$y2010,e$y2011a,e$y2011b,e$y2011c,
  drawRect=F,col=rgb(0,0,1,0.4),add=T)
mtext('x_2_09',2,line=2.5)

p = readRDS('./particles_10.RDS')
e = data.frame(y2000=p$x_2_10)
p = readRDS('./particles_11.RDS')
e$y2010 = p$x_2_10
p = readRDS('./particles_final_11_0.RDS')
e$y2011a = p$x_2_10
p = readRDS('./particles_final_11_1.RDS')
e$y2011b = p$x_2_10
p = readRDS('./particles_final_11_2.RDS')
e$y2011c = p$x_2_10
plot(-1e3,-1e3,xlim=c(-8,5),ylim=range(e),las=1,xaxt='n',xlab='',ylab='')
vioplot(
  e$y2000,e$y2010,e$y2011a,e$y2011b,e$y2011c,
  drawRect=F,col=rgb(0,0,1,0.4),add=T)
mtext('x_2_10',2,line=2.5)

p = readRDS('./particles_11.RDS')
e = data.frame(y2000=p$x_2_11)
p = readRDS('./particles_final_11_0.RDS')
e$y2011a = p$x_2_11
p = readRDS('./particles_final_11_1.RDS')
e$y2011b = p$x_2_11
p = readRDS('./particles_final_11_2.RDS')
e$y2011c = p$x_2_11
plot(-1e3,-1e3,xlim=c(-9,4),ylim=range(e),las=1,xaxt='n',xlab='',ylab='')
vioplot(
  e$y2000,e$y2011a,e$y2011b,e$y2011c,
  drawRect=F,col=rgb(0,0,1,0.4),add=T)
mtext('x_2_11',2,line=2.5)

axis(1,at=-9:4,labels=c('00','01','02','03','04','05','06','07','08','09','10','11a','11b','11c'))
mtext('Calibration iteration',1,line=2.5)

dev.off()










