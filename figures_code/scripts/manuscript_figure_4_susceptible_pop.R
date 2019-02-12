#======================================================================================#
# Author: Guido España
# analyze output of parameter sweep of vaccine properties
# project: PLOS COMP BIO paper 2019 Iquitos
# Year: 2019
#
#======================================================================================#
# User's input--------
#======================================================================================#

#======================================================================================#
# Load outputdata and parameters with *_pop.csv --------
#======================================================================================#
load('figure_4_susceptible_pop.RData')

pdf('../output/figure_4_susceptibles.pdf',width=6.5,height=6.5)
colors = c('#FFCC99', '#CCFF99', '#99CCFF', '#CC99FF')
par(mfrow = c(4,1),mar=c(1.5,0,0,2),oma=c(3,5,1,0.5))

plot(-100,-100,xlim=c(1,vday),ylim=c(0,1),xaxs='i',yaxs='i',xaxt='n',las=1,xlab='',ylab='')
polygon(c(1:vday,vday:1),c(rep(0,vday),sus_temporary_1[1,vday:1]),col=colors[1])
polygon(c(1:vday,vday:1),c(sus_temporary_1[1,1:vday],sus_permanent_1[1,vday:1]),col=rgb(0,0,0,0.25),border=NA)
polygon(c(1:vday,vday:1),c(sus_permanent_1[1,1:vday],rep(1,vday)),col=rgb(0,0,0,0.5))
mtext('DENV-1',4,line=1)

plot(-100,-100,xlim=c(1,vday),ylim=c(0,1),xaxs='i',yaxs='i',xaxt='n',las=1,xlab='',ylab='')
polygon(c(1:vday,vday:1),c(rep(0,vday),sus_temporary_2[1,vday:1]),col=colors[2])
polygon(c(1:vday,vday:1),c(sus_temporary_2[1,1:vday],sus_permanent_2[1,vday:1]),col=rgb(0,0,0,0.25),border=NA)
polygon(c(1:vday,vday:1),c(sus_permanent_2[1,1:vday],rep(1,vday)),col=rgb(0,0,0,0.5))
mtext('DENV-2',4,line=1)

plot(-100,-100,xlim=c(1,vday),ylim=c(0,1),xaxs='i',yaxs='i',xaxt='n',las=1,xlab='',ylab='')
polygon(c(1:vday,vday:1),c(rep(0,vday),sus_temporary_3[1,vday:1]),col=colors[3])
polygon(c(1:vday,vday:1),c(sus_temporary_3[1,1:vday],sus_permanent_3[1,vday:1]),col=rgb(0,0,0,0.25),border=NA)
polygon(c(1:vday,vday:1),c(sus_permanent_3[1,1:vday],rep(1,vday)),col=rgb(0,0,0,0.5))
mtext('DENV-3',4,line=1)

plot(-100,-100,xlim=c(1,vday),ylim=c(0,1),xaxs='i',yaxs='i',xaxt='n',las=1,xlab='',ylab='')
polygon(c(1:vday,vday:1),c(rep(0,vday),sus_temporary_4[1,vday:1]),col=colors[4])
polygon(c(1:vday,vday:1),c(sus_temporary_4[1,1:vday],sus_permanent_4[1,vday:1]),col=rgb(0,0,0,0.25),border=NA)
polygon(c(1:vday,vday:1),c(sus_permanent_4[1,1:vday],rep(1,vday)),col=rgb(0,0,0,0.5))
mtext('DENV-4',4,line=1)
axis(1,at=which((as.Date('1999-12-31') + 1:vday) %in% as.Date(paste(2000:2010,'-01-01',sep=''))),labels=as.character(2000:2010))

mtext('Proportion of the population by immune status',2,line=3.25,outer=T)
mtext('Year',1,line=3)

dev.off()

