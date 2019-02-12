#======================================================================================#
# Author: Guido España, Alex Perkins
# analyze output of parameter sweep of vaccine properties
# project: PLOS COMP BIO paper 2019 Iquitos
# Year: 2019
#======================================================================================#
data_psa = readRDS('PSA_table_simple_vaccine.RDS')

#    lo hi range
# VE_mean
# VE_serostatus
# VE_serotype
# vaccine_prop_inf_4



data1a = subset(
  data_psa,
  scenario%in%c('bite_0.5_immunity_exp_686','immunity_exp_686','bite_2.0_immunity_exp_686') &
    parameter=='vaccine_prop_inf_4')[c(1,3,2,4,6,5),]
data2a = subset(
  data_psa,
  scenario%in%c('bite_0.5_immunity_exp_686','immunity_exp_686','bite_2.0_immunity_exp_686') &
    parameter=='vaccine_efficacy_mean')[c(1,3,2,4,6,5),]
data3a = subset(
  data_psa,
  scenario%in%c('bite_0.5_immunity_exp_686','immunity_exp_686','bite_2.0_immunity_exp_686') &
  parameter=='vaccine_efficacy_serostatus')[c(1,3,2,4,6,5),]
data4a = subset(
  data_psa,
  scenario%in%c('bite_0.5_immunity_exp_686','immunity_exp_686','bite_2.0_immunity_exp_686') &
  parameter=='vaccine_efficacy_serotype')[c(1,3,2,4,6,5),]

pdf(file='../output/FigureS36_sens_generic_bite.pdf',width=6.5,height=6.5)

layout(rbind(matrix(1:8,4,2,byrow=T),c(9,9)),heights=c(1,1,1,1,0.4))
par(mar=c(5,2.5,0.5,1),oma=c(0,0.5,3,0))

bp = barplot(
  matrix(data1a$inf_averted,3,2),ylim=c(0,1.2*max(data1a$inf_averted)),beside=T,
  xlab='p',names.arg=c('0.0','1.0'),las=1)
segments(bp, data1a$inf_averted_low, bp, data1a$inf_averted_high)
mtext('Proportion of infections averted',3,cex=0.7,line=1)
bp = barplot(
  matrix(data1a$dis_averted,3,2),ylim=c(0,1.2*max(data1a$dis_averted)),beside=T,
  xlab='p',names.arg=c('0.0','1.0'),las=1)
segments(bp, data1a$dis_averted_low, bp, data1a$dis_averted_high)
mtext('Proportion of disease averted',3,cex=0.7,line=1)

bp = barplot(
  matrix(data2a$inf_averted,3,2),ylim=c(0,1.2*max(data2a$inf_averted)),beside=T,
  xlab=expression(VE['mean']),names.arg=c('0.15','0.85'),las=1)
segments(bp, data2a$inf_averted_low, bp, data2a$inf_averted_high)
bp = barplot(
  matrix(data2a$dis_averted,3,2),ylim=c(0,1.2*max(data2a$dis_averted)),beside=T,
  xlab=expression(VE['mean']),names.arg=c('0.15','0.85'),las=1)
segments(bp, data2a$dis_averted_low, bp, data2a$dis_averted_high)

bp = barplot(
  matrix(data3a$inf_averted,3,2),ylim=c(0,1.2*max(data3a$inf_averted)),beside=T,
  xlab=expression(VE['serostatus']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data3a$inf_averted_low, bp, data3a$inf_averted_high)
bp = barplot(
  matrix(data3a$dis_averted,3,2),ylim=c(0,1.2*max(data3a$dis_averted)),beside=T,
  xlab=expression(VE['serostatus']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data3a$dis_averted_low, bp, data3a$dis_averted_high)

bp = barplot(
  matrix(data4a$inf_averted,3,2),ylim=c(0,1.2*max(data4a$inf_averted)),beside=T,
  xlab=expression(VE['serotype']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data4a$inf_averted_low, bp, data4a$inf_averted_high)
bp = barplot(
  matrix(data4a$dis_averted,3,2),ylim=c(0,1.2*max(data4a$dis_averted)),beside=T,
  xlab=expression(VE['serotype']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data4a$dis_averted_low, bp, data4a$dis_averted_high)

par(mar=c(1,2.5,0.5,1))

plot(1:3,101:103,xlim=c(0,1),ylim=c(0,1),xaxt='n',yaxt='n',xlab='',ylab='',bty='n')
legend('center',legend=c('lower','default','higher'),title='biting rate scenario: ',col=gray.colors(3),pt.cex=3,pch=15,bty='n',horiz=T)

dev.off()



data1a = subset(
  data_psa,
  scenario%in%c('death_0.5_immunity_exp_686','immunity_exp_686','death_2.0_immunity_exp_686') &
  parameter=='vaccine_prop_inf_4')[c(1,3,2,4,6,5),]
data2a = subset(
  data_psa,
  scenario%in%c('death_0.5_immunity_exp_686','immunity_exp_686','death_2.0_immunity_exp_686') &
  parameter=='vaccine_efficacy_mean')[c(1,3,2,4,6,5),]
data3a = subset(
  data_psa,
  scenario%in%c('death_0.5_immunity_exp_686','immunity_exp_686','death_2.0_immunity_exp_686') &
  parameter=='vaccine_efficacy_serostatus')[c(1,3,2,4,6,5),]
data4a = subset(
  data_psa,
  scenario%in%c('death_0.5_immunity_exp_686','immunity_exp_686','death_2.0_immunity_exp_686') &
  parameter=='vaccine_efficacy_serotype')[c(1,3,2,4,6,5),]

pdf(file='../output/FigureS37_sens_generic_death.pdf',width=6.5,height=6.5)

layout(rbind(matrix(1:8,4,2,byrow=T),c(9,9)),heights=c(1,1,1,1,0.4))
par(mar=c(5,2.5,0.5,1),oma=c(0,0.5,3,0))

bp = barplot(
  matrix(data1a$inf_averted,3,2),ylim=c(0,1.2*max(data1a$inf_averted)),beside=T,
  xlab='p',names.arg=c('0.0','1.0'),las=1)
segments(bp, data1a$inf_averted_low, bp, data1a$inf_averted_high)
mtext('Proportion of infections averted',3,cex=0.7,line=1)
bp = barplot(
  matrix(data1a$dis_averted,3,2),ylim=c(0,1.2*max(data1a$dis_averted)),beside=T,
  xlab='p',names.arg=c('0.0','1.0'),las=1)
segments(bp, data1a$dis_averted_low, bp, data1a$dis_averted_high)
mtext('Proportion of disease averted',3,cex=0.7,line=1)

bp = barplot(
  matrix(data2a$inf_averted,3,2),ylim=c(0,1.2*max(data2a$inf_averted)),beside=T,
  xlab=expression(VE['mean']),names.arg=c('0.15','0.85'),las=1)
segments(bp, data2a$inf_averted_low, bp, data2a$inf_averted_high)
bp = barplot(
  matrix(data2a$dis_averted,3,2),ylim=c(0,1.2*max(data2a$dis_averted)),beside=T,
  xlab=expression(VE['mean']),names.arg=c('0.15','0.85'),las=1)
segments(bp, data2a$dis_averted_low, bp, data2a$dis_averted_high)

bp = barplot(
  matrix(data3a$inf_averted,3,2),ylim=c(0,1.2*max(data3a$inf_averted)),beside=T,
  xlab=expression(VE['serostatus']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data3a$inf_averted_low, bp, data3a$inf_averted_high)
bp = barplot(
  matrix(data3a$dis_averted,3,2),ylim=c(0,1.2*max(data3a$dis_averted)),beside=T,
  xlab=expression(VE['serostatus']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data3a$dis_averted_low, bp, data3a$dis_averted_high)

bp = barplot(
  matrix(data4a$inf_averted,3,2),ylim=c(0,1.2*max(data4a$inf_averted)),beside=T,
  xlab=expression(VE['serotype']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data4a$inf_averted_low, bp, data4a$inf_averted_high)
bp = barplot(
  matrix(data4a$dis_averted,3,2),ylim=c(0,1.2*max(data4a$dis_averted)),beside=T,
  xlab=expression(VE['serotype']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data4a$dis_averted_low, bp, data4a$dis_averted_high)

par(mar=c(1,2.5,0.5,1))

plot(1:3,101:103,xlim=c(0,1),ylim=c(0,1),xaxt='n',yaxt='n',xlab='',ylab='',bty='n')
legend('center',legend=c('lower','default','higher'),title='mosquito death rate scenario: ',col=gray.colors(3),pt.cex=3,pch=15,bty='n',horiz=T)

dev.off()




data1a = subset(
  data_psa,
  scenario%in%c('eip_0.5_immunity_exp_686','immunity_exp_686','eip_2.0_immunity_exp_686') &
  parameter=='vaccine_prop_inf_4')[c(1,3,2,4,6,5),]
data2a = subset(
  data_psa,
  scenario%in%c('eip_0.5_immunity_exp_686','immunity_exp_686','eip_2.0_immunity_exp_686') &
  parameter=='vaccine_efficacy_mean')[c(1,3,2,4,6,5),]
data3a = subset(
  data_psa,
  scenario%in%c('eip_0.5_immunity_exp_686','immunity_exp_686','eip_2.0_immunity_exp_686') &
  parameter=='vaccine_efficacy_serostatus')[c(1,3,2,4,6,5),]
data4a = subset(
  data_psa,
  scenario%in%c('eip_0.5_immunity_exp_686','immunity_exp_686','eip_2.0_immunity_exp_686') &
  parameter=='vaccine_efficacy_serotype')[c(1,3,2,4,6,5),]

pdf(file='../output/FigureS38_sens_generic_eip.pdf',width=6.5,height=6.5)

layout(rbind(matrix(1:8,4,2,byrow=T),c(9,9)),heights=c(1,1,1,1,0.4))
par(mar=c(5,2.5,0.5,1),oma=c(0,0.5,3,0))

bp = barplot(
  matrix(data1a$inf_averted,3,2),ylim=c(0,1.2*max(data1a$inf_averted)),beside=T,
  xlab='p',names.arg=c('0.0','1.0'),las=1)
segments(bp, data1a$inf_averted_low, bp, data1a$inf_averted_high)
mtext('Proportion of infections averted',3,cex=0.7,line=1)
bp = barplot(
  matrix(data1a$dis_averted,3,2),ylim=c(0,1.2*max(data1a$dis_averted)),beside=T,
  xlab='p',names.arg=c('0.0','1.0'),las=1)
segments(bp, data1a$dis_averted_low, bp, data1a$dis_averted_high)
mtext('Proportion of disease averted',3,cex=0.7,line=1)

bp = barplot(
  matrix(data2a$inf_averted,3,2),ylim=c(0,1.2*max(data2a$inf_averted)),beside=T,
  xlab=expression(VE['mean']),names.arg=c('0.15','0.85'),las=1)
segments(bp, data2a$inf_averted_low, bp, data2a$inf_averted_high)
bp = barplot(
  matrix(data2a$dis_averted,3,2),ylim=c(0,1.2*max(data2a$dis_averted)),beside=T,
  xlab=expression(VE['mean']),names.arg=c('0.15','0.85'),las=1)
segments(bp, data2a$dis_averted_low, bp, data2a$dis_averted_high)

bp = barplot(
  matrix(data3a$inf_averted,3,2),ylim=c(0,1.2*max(data3a$inf_averted)),beside=T,
  xlab=expression(VE['serostatus']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data3a$inf_averted_low, bp, data3a$inf_averted_high)
bp = barplot(
  matrix(data3a$dis_averted,3,2),ylim=c(0,1.2*max(data3a$dis_averted)),beside=T,
  xlab=expression(VE['serostatus']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data3a$dis_averted_low, bp, data3a$dis_averted_high)

bp = barplot(
  matrix(data4a$inf_averted,3,2),ylim=c(0,1.2*max(data4a$inf_averted)),beside=T,
  xlab=expression(VE['serotype']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data4a$inf_averted_low, bp, data4a$inf_averted_high)
bp = barplot(
  matrix(data4a$dis_averted,3,2),ylim=c(0,1.2*max(data4a$dis_averted)),beside=T,
  xlab=expression(VE['serotype']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data4a$dis_averted_low, bp, data4a$dis_averted_high)

par(mar=c(1,2.5,0.5,1))

plot(1:3,101:103,xlim=c(0,1),ylim=c(0,1),xaxt='n',yaxt='n',xlab='',ylab='',bty='n')
legend('center',legend=c('shorter','default','longer'),title='extrinsic incubation period scenario: ',col=gray.colors(3),pt.cex=3,pch=15,bty='n',horiz=T)

dev.off()




data1a = subset(
  data_psa,
  scenario%in%c('pmove_0.1_immunity_exp_686','immunity_exp_686','pmove_0.5_immunity_exp_686') &
  parameter=='vaccine_prop_inf_4')[c(1,3,2,4,6,5),]
data2a = subset(
  data_psa,
  scenario%in%c('pmove_0.1_immunity_exp_686','immunity_exp_686','pmove_0.5_immunity_exp_686') &
  parameter=='vaccine_efficacy_mean')[c(1,3,2,4,6,5),]
data3a = subset(
  data_psa,
  scenario%in%c('pmove_0.1_immunity_exp_686','immunity_exp_686','pmove_0.5_immunity_exp_686') &
  parameter=='vaccine_efficacy_serostatus')[c(1,3,2,4,6,5),]
data4a = subset(
  data_psa,
  scenario%in%c('pmove_0.1_immunity_exp_686','immunity_exp_686','pmove_0.5_immunity_exp_686') &
  parameter=='vaccine_efficacy_serotype')[c(1,3,2,4,6,5),]

pdf(file='../output/FigureS39_sens_generic_pmove.pdf',width=6.5,height=6.5)

layout(rbind(matrix(1:8,4,2,byrow=T),c(9,9)),heights=c(1,1,1,1,0.4))
par(mar=c(5,2.5,0.5,1),oma=c(0,0.5,3,0))

bp = barplot(
  matrix(data1a$inf_averted,3,2),ylim=c(0,1.2*max(data1a$inf_averted)),beside=T,
  xlab='p',names.arg=c('0.0','1.0'),las=1)
segments(bp, data1a$inf_averted_low, bp, data1a$inf_averted_high)
mtext('Proportion of infections averted',3,cex=0.7,line=1)
bp = barplot(
  matrix(data1a$dis_averted,3,2),ylim=c(0,1.2*max(data1a$dis_averted)),beside=T,
  xlab='p',names.arg=c('0.0','1.0'),las=1)
segments(bp, data1a$dis_averted_low, bp, data1a$dis_averted_high)
mtext('Proportion of disease averted',3,cex=0.7,line=1)

bp = barplot(
  matrix(data2a$inf_averted,3,2),ylim=c(0,1.2*max(data2a$inf_averted)),beside=T,
  xlab=expression(VE['mean']),names.arg=c('0.15','0.85'),las=1)
segments(bp, data2a$inf_averted_low, bp, data2a$inf_averted_high)
bp = barplot(
  matrix(data2a$dis_averted,3,2),ylim=c(0,1.2*max(data2a$dis_averted)),beside=T,
  xlab=expression(VE['mean']),names.arg=c('0.15','0.85'),las=1)
segments(bp, data2a$dis_averted_low, bp, data2a$dis_averted_high)

bp = barplot(
  matrix(data3a$inf_averted,3,2),ylim=c(0,1.2*max(data3a$inf_averted)),beside=T,
  xlab=expression(VE['serostatus']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data3a$inf_averted_low, bp, data3a$inf_averted_high)
bp = barplot(
  matrix(data3a$dis_averted,3,2),ylim=c(0,1.2*max(data3a$dis_averted)),beside=T,
  xlab=expression(VE['serostatus']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data3a$dis_averted_low, bp, data3a$dis_averted_high)

bp = barplot(
  matrix(data4a$inf_averted,3,2),ylim=c(0,1.2*max(data4a$inf_averted)),beside=T,
  xlab=expression(VE['serotype']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data4a$inf_averted_low, bp, data4a$inf_averted_high)
bp = barplot(
  matrix(data4a$dis_averted,3,2),ylim=c(0,1.2*max(data4a$dis_averted)),beside=T,
  xlab=expression(VE['serotype']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data4a$dis_averted_low, bp, data4a$dis_averted_high)

par(mar=c(1,2.5,0.5,1))

plot(1:3,101:103,xlim=c(0,1),ylim=c(0,1),xaxt='n',yaxt='n',xlab='',ylab='',bty='n')
legend('center',legend=c('lower (0.1)','default (0.3)','higher (0.5)'),title='mosquito movement probability scenario: ',col=gray.colors(3),pt.cex=3,pch=15,bty='n',horiz=T)

dev.off()




data1a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','asymp_0.5_immunity_exp_686') &
  parameter=='vaccine_prop_inf_4')[c(2,1,4,3),]
data2a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','asymp_0.5_immunity_exp_686') &
  parameter=='vaccine_efficacy_mean')[c(2,1,4,3),]
data3a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','asymp_0.5_immunity_exp_686') &
  parameter=='vaccine_efficacy_serostatus')[c(2,1,4,3),]
data4a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','asymp_0.5_immunity_exp_686') &
  parameter=='vaccine_efficacy_serotype')[c(2,1,4,3),]

pdf(file='../output/FigureS32_sens_generic_asymp.pdf',width=6.5,height=6.5)

layout(rbind(matrix(1:8,4,2,byrow=T),c(9,9)),heights=c(1,1,1,1,0.4))
par(mar=c(5,2.5,0.5,1),oma=c(0,0.5,3,0))

bp = barplot(
  matrix(data1a$inf_averted,2,2),ylim=c(0,1.2*max(data1a$inf_averted)),beside=T,
  xlab='p',names.arg=c('0.0','1.0'),las=1)
segments(bp, data1a$inf_averted_low, bp, data1a$inf_averted_high)
mtext('Proportion of infections averted',3,cex=0.7,line=1)
bp = barplot(
  matrix(data1a$dis_averted,2,2),ylim=c(0,1.2*max(data1a$dis_averted)),beside=T,
  xlab='p',names.arg=c('0.0','1.0'),las=1)
segments(bp, data1a$dis_averted_low, bp, data1a$dis_averted_high)
mtext('Proportion of disease averted',3,cex=0.7,line=1)

bp = barplot(
  matrix(data2a$inf_averted,2,2),ylim=c(0,1.2*max(data2a$inf_averted)),beside=T,
  xlab=expression(VE['mean']),names.arg=c('0.15','0.85'),las=1)
segments(bp, data2a$inf_averted_low, bp, data2a$inf_averted_high)
bp = barplot(
  matrix(data2a$dis_averted,2,2),ylim=c(0,1.2*max(data2a$dis_averted)),beside=T,
  xlab=expression(VE['mean']),names.arg=c('0.15','0.85'),las=1)
segments(bp, data2a$dis_averted_low, bp, data2a$dis_averted_high)

bp = barplot(
  matrix(data3a$inf_averted,2,2),ylim=c(0,1.2*max(data3a$inf_averted)),beside=T,
  xlab=expression(VE['serostatus']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data3a$inf_averted_low, bp, data3a$inf_averted_high)
bp = barplot(
  matrix(data3a$dis_averted,2,2),ylim=c(0,1.2*max(data3a$dis_averted)),beside=T,
  xlab=expression(VE['serostatus']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data3a$dis_averted_low, bp, data3a$dis_averted_high)

bp = barplot(
  matrix(data4a$inf_averted,2,2),ylim=c(0,1.2*max(data4a$inf_averted)),beside=T,
  xlab=expression(VE['serotype']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data4a$inf_averted_low, bp, data4a$inf_averted_high)
bp = barplot(
  matrix(data4a$dis_averted,2,2),ylim=c(0,1.2*max(data4a$dis_averted)),beside=T,
  xlab=expression(VE['serotype']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data4a$dis_averted_low, bp, data4a$dis_averted_high)

par(mar=c(1,2.5,0.5,1))

plot(1:2,101:102,xlim=c(0,1),ylim=c(0,1),xaxt='n',yaxt='n',xlab='',ylab='',bty='n')
legend('center',legend=c('default (homogeneous)','breakthrough infections lower'),title='human infectiousness scenario: ',col=gray.colors(2),pt.cex=3,pch=15,bty='n',horiz=T)

dev.off()




data1a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','p_0.5_immunity_exp_686') &
  parameter=='vaccine_prop_inf_4')[c(2,1,4,3),]
data2a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','p_0.5_immunity_exp_686') &
  parameter=='vaccine_efficacy_mean')[c(2,1,4,3),]
data3a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','p_0.5_immunity_exp_686') &
  parameter=='vaccine_efficacy_serostatus')[c(2,1,4,3),]
data4a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','p_0.5_immunity_exp_686') &
  parameter=='vaccine_efficacy_serotype')[c(2,1,4,3),]

pdf(file='../output/FigureS35_sens_generic_mozinfec.pdf',width=6.5,height=6.5)

layout(rbind(matrix(1:8,4,2,byrow=T),c(9,9)),heights=c(1,1,1,1,0.4))
par(mar=c(5,2.5,0.5,1),oma=c(0,0.5,3,0))

bp = barplot(
  matrix(data1a$inf_averted,2,2),ylim=c(0,1.2*max(data1a$inf_averted)),beside=T,
  xlab='p',names.arg=c('0.0','1.0'),las=1)
segments(bp, data1a$inf_averted_low, bp, data1a$inf_averted_high)
mtext('Proportion of infections averted',3,cex=0.7,line=1)
bp = barplot(
  matrix(data1a$dis_averted,2,2),ylim=c(0,1.2*max(data1a$dis_averted)),beside=T,
  xlab='p',names.arg=c('0.0','1.0'),las=1)
segments(bp, data1a$dis_averted_low, bp, data1a$dis_averted_high)
mtext('Proportion of disease averted',3,cex=0.7,line=1)

bp = barplot(
  matrix(data2a$inf_averted,2,2),ylim=c(0,1.2*max(data2a$inf_averted)),beside=T,
  xlab=expression(VE['mean']),names.arg=c('0.15','0.85'),las=1)
segments(bp, data2a$inf_averted_low, bp, data2a$inf_averted_high)
bp = barplot(
  matrix(data2a$dis_averted,2,2),ylim=c(0,1.2*max(data2a$dis_averted)),beside=T,
  xlab=expression(VE['mean']),names.arg=c('0.15','0.85'),las=1)
segments(bp, data2a$dis_averted_low, bp, data2a$dis_averted_high)

bp = barplot(
  matrix(data3a$inf_averted,2,2),ylim=c(0,1.2*max(data3a$inf_averted)),beside=T,
  xlab=expression(VE['serostatus']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data3a$inf_averted_low, bp, data3a$inf_averted_high)
bp = barplot(
  matrix(data3a$dis_averted,2,2),ylim=c(0,1.2*max(data3a$dis_averted)),beside=T,
  xlab=expression(VE['serostatus']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data3a$dis_averted_low, bp, data3a$dis_averted_high)

bp = barplot(
  matrix(data4a$inf_averted,2,2),ylim=c(0,1.2*max(data4a$inf_averted)),beside=T,
  xlab=expression(VE['serotype']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data4a$inf_averted_low, bp, data4a$inf_averted_high)
bp = barplot(
  matrix(data4a$dis_averted,2,2),ylim=c(0,1.2*max(data4a$dis_averted)),beside=T,
  xlab=expression(VE['serotype']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data4a$dis_averted_low, bp, data4a$dis_averted_high)

par(mar=c(1,2.5,0.5,1))

plot(1:2,101:102,xlim=c(0,1),ylim=c(0,1),xaxt='n',yaxt='n',xlab='',ylab='',bty='n')
legend('center',legend=c('default (1.0)','lower (0.5)'),title='mosquito infectiousness scenario: ',col=gray.colors(2),pt.cex=3,pch=15,bty='n',horiz=T)

dev.off()




data1a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','immunity_exp_180') &
  parameter=='vaccine_prop_inf_4')[c(2,1,4,3),]
data2a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','immunity_exp_180') &
  parameter=='vaccine_efficacy_mean')[c(2,1,4,3),]
data3a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','immunity_exp_180') &
  parameter=='vaccine_efficacy_serostatus')[c(2,1,4,3),]
data4a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','immunity_exp_180') &
  parameter=='vaccine_efficacy_serotype')[c(2,1,4,3),]

pdf(file='../output/FigureS33_sens_generic_immunity_duration.pdf',width=6.5,height=6.5)

layout(rbind(matrix(1:8,4,2,byrow=T),c(9,9)),heights=c(1,1,1,1,0.4))
par(mar=c(5,2.5,0.5,1),oma=c(0,0.5,3,0))

bp = barplot(
  matrix(data1a$inf_averted,2,2),ylim=c(0,1.2*max(data1a$inf_averted)),beside=T,
  xlab='p',names.arg=c('0.0','1.0'),las=1)
segments(bp, data1a$inf_averted_low, bp, data1a$inf_averted_high)
mtext('Proportion of infections averted',3,cex=0.7,line=1)
bp = barplot(
  matrix(data1a$dis_averted,2,2),ylim=c(0,1.2*max(data1a$dis_averted)),beside=T,
  xlab='p',names.arg=c('0.0','1.0'),las=1)
segments(bp, data1a$dis_averted_low, bp, data1a$dis_averted_high)
mtext('Proportion of disease averted',3,cex=0.7,line=1)

bp = barplot(
  matrix(data2a$inf_averted,2,2),ylim=c(0,1.2*max(data2a$inf_averted)),beside=T,
  xlab=expression(VE['mean']),names.arg=c('0.15','0.85'),las=1)
segments(bp, data2a$inf_averted_low, bp, data2a$inf_averted_high)
bp = barplot(
  matrix(data2a$dis_averted,2,2),ylim=c(0,1.2*max(data2a$dis_averted)),beside=T,
  xlab=expression(VE['mean']),names.arg=c('0.15','0.85'),las=1)
segments(bp, data2a$dis_averted_low, bp, data2a$dis_averted_high)

bp = barplot(
  matrix(data3a$inf_averted,2,2),ylim=c(0,1.2*max(data3a$inf_averted)),beside=T,
  xlab=expression(VE['serostatus']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data3a$inf_averted_low, bp, data3a$inf_averted_high)
bp = barplot(
  matrix(data3a$dis_averted,2,2),ylim=c(0,1.2*max(data3a$dis_averted)),beside=T,
  xlab=expression(VE['serostatus']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data3a$dis_averted_low, bp, data3a$dis_averted_high)

bp = barplot(
  matrix(data4a$inf_averted,2,2),ylim=c(0,1.2*max(data4a$inf_averted)),beside=T,
  xlab=expression(VE['serotype']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data4a$inf_averted_low, bp, data4a$inf_averted_high)
bp = barplot(
  matrix(data4a$dis_averted,2,2),ylim=c(0,1.2*max(data4a$dis_averted)),beside=T,
  xlab=expression(VE['serotype']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data4a$dis_averted_low, bp, data4a$dis_averted_high)

par(mar=c(1,2.5,0.5,1))

plot(1:2,101:102,xlim=c(0,1),ylim=c(0,1),xaxt='n',yaxt='n',xlab='',ylab='',bty='n')
legend('center',legend=c('default (686 days)','shorter (180 days)'),title='cross-immunity duration scenario: ',col=gray.colors(2),pt.cex=3,pch=15,bty='n',horiz=T)

dev.off()



data1a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','immunity_fixed_686') &
    parameter=='vaccine_prop_inf_4')
data2a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','immunity_fixed_686') &
    parameter=='vaccine_efficacy_mean')
data3a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','immunity_fixed_686') &
    parameter=='vaccine_efficacy_serostatus')
data4a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','immunity_fixed_686') &
    parameter=='vaccine_efficacy_serotype')

pdf(file='../output/FigureS34_sens_generic_immunity_distribution.pdf',width=6.5,height=6.5)

layout(rbind(matrix(1:8,4,2,byrow=T),c(9,9)),heights=c(1,1,1,1,0.4))
par(mar=c(5,2.5,0.5,1),oma=c(0,0.5,3,0))

bp = barplot(
  matrix(data1a$inf_averted,2,2),ylim=c(0,1.2*max(data1a$inf_averted)),beside=T,
  xlab='p',names.arg=c('0.0','1.0'),las=1)
segments(bp, data1a$inf_averted_low, bp, data1a$inf_averted_high)
mtext('Proportion of infections averted',3,cex=0.7,line=1)
bp = barplot(
  matrix(data1a$dis_averted,2,2),ylim=c(0,1.2*max(data1a$dis_averted)),beside=T,
  xlab='p',names.arg=c('0.0','1.0'),las=1)
segments(bp, data1a$dis_averted_low, bp, data1a$dis_averted_high)
mtext('Proportion of disease averted',3,cex=0.7,line=1)

bp = barplot(
  matrix(data2a$inf_averted,2,2),ylim=c(0,1.2*max(data2a$inf_averted)),beside=T,
  xlab=expression(VE['mean']),names.arg=c('0.15','0.85'),las=1)
segments(bp, data2a$inf_averted_low, bp, data2a$inf_averted_high)
bp = barplot(
  matrix(data2a$dis_averted,2,2),ylim=c(0,1.2*max(data2a$dis_averted)),beside=T,
  xlab=expression(VE['mean']),names.arg=c('0.15','0.85'),las=1)
segments(bp, data2a$dis_averted_low, bp, data2a$dis_averted_high)

bp = barplot(
  matrix(data3a$inf_averted,2,2),ylim=c(0,1.2*max(data3a$inf_averted)),beside=T,
  xlab=expression(VE['serostatus']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data3a$inf_averted_low, bp, data3a$inf_averted_high)
bp = barplot(
  matrix(data3a$dis_averted,2,2),ylim=c(0,1.2*max(data3a$dis_averted)),beside=T,
  xlab=expression(VE['serostatus']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data3a$dis_averted_low, bp, data3a$dis_averted_high)

bp = barplot(
  matrix(data4a$inf_averted,2,2),ylim=c(0,1.2*max(data4a$inf_averted)),beside=T,
  xlab=expression(VE['serotype']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data4a$inf_averted_low, bp, data4a$inf_averted_high)
bp = barplot(
  matrix(data4a$dis_averted,2,2),ylim=c(0,1.2*max(data4a$dis_averted)),beside=T,
  xlab=expression(VE['serotype']),names.arg=c('0.0','0.15'),las=1)
segments(bp, data4a$dis_averted_low, bp, data4a$dis_averted_high)

par(mar=c(1,2.5,0.5,1))

plot(1:2,101:102,xlim=c(0,1),ylim=c(0,1),xaxt='n',yaxt='n',xlab='',ylab='',bty='n')
legend('center',legend=c('default (exponential)','fixed duration'),title='inter-individual variability of cross-immunity duration scenario: ',col=gray.colors(2),pt.cex=3,pch=15,bty='n',horiz=T)

dev.off()











