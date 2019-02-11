#======================================================================================#
# Author: Guido España, Alex Perkins
# analyze output of parameter sweep of vaccine properties
# project: PLOS COMP BIO paper 2019 Iquitos
# Year: 2019
#
#======================================================================================#
cors = array(0,dim=c(64,64,13))
p = readRDS('./particles_01.RDS')
cors[1:ncol(p),1:ncol(p),1] = cor(p)
p = readRDS('./particles_02.RDS')
cors[1:ncol(p),1:ncol(p),2] = cor(p)
p = readRDS('./particles_03.RDS')
cors[1:ncol(p),1:ncol(p),3] = cor(p)
p = readRDS('./particles_04.RDS')
cors[1:ncol(p),1:ncol(p),4] = cor(p)
p = readRDS('./particles_05.RDS')
cors[1:ncol(p),1:ncol(p),5] = cor(p)
p = readRDS('./particles_06.RDS')
cors[1:ncol(p),1:ncol(p),6] = cor(p)
p = readRDS('./particles_07.RDS')
cors[1:ncol(p),1:ncol(p),7] = cor(p)
p = readRDS('./particles_08.RDS')
cors[1:ncol(p),1:ncol(p),8] = cor(p)
p = readRDS('./particles_09.RDS')
cors[1:ncol(p),1:ncol(p),9] = cor(p)
p = readRDS('./particles_10.RDS')
cors[1:ncol(p),1:ncol(p),10] = cor(p)
p = readRDS('./particles_11.RDS')
cors[1:ncol(p),1:ncol(p),11] = cor(p)
p = readRDS('./particles_final_11_0.RDS')
cors[1:ncol(p),1:ncol(p),12] = cor(p)
p = readRDS('./particles_final_11_1.RDS')
cors[1:ncol(p),1:ncol(p),13] = cor(p)


pdf('../output/FigureS10_params_correlations.pdf',width=6.5,height=3.5)

par(mar=c(3.5,4,0.5,1))

cors.mat = t(apply(cors,3,as.numeric))
cors.mat[cors.mat==1] = 0
matplot(cors.mat,ylim=c(-1,1),type='l',lty=1,col=rgb(0,0,0,0.1),xaxs='i',yaxs='i',xaxt='n',las=1,ylab='Parameter correlation')
axis(1,at=1:13,labels=c('00','01','02','03','04','05','06','07','08','09','10',expression('All'^1),expression('All'^2)))
mtext('Calibration iteration',1,line=2.5)

dev.off()
