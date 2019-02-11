
data_psa = readRDS('PSA_table_normdev_vaccine.RDS')

#    lo hi range
# VE_mean
# VE_serostatus
# VE_serotype
# vaccine_prop_inf_1

data1a = subset(
  data_psa,
  scenario%in%c('bite_0.5_immunity_exp_686','immunity_exp_686','bite_2.0_immunity_exp_686') &
    parameter=='vaccine_prop_inf_1')[c(1,3,2,4,6,5),]
data2a = subset(
  data_psa,
  scenario%in%c('bite_0.5_immunity_exp_686','immunity_exp_686','bite_2.0_immunity_exp_686') &
    parameter=='vaccine_normdev_pos_1')[c(1,3,2,4,6,5),]

pdf(file='../output/supplement_figure_S28_sens_cyd_biting.pdf',width=6.5,height=4.5)

layout(rbind(matrix(1:4,2,2,byrow=T),c(5,5)),heights=c(1,1,0.4))
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
  matrix(data2a$inf_averted,3,2)[,c(2,1)],ylim=c(0,1.2*max(data2a$inf_averted)),beside=T,
  xlab='q',names.arg=c('0.0','1.0'),las=1)
segments(bp, data2a$inf_averted_low[c(4:6,1:3)], bp, data2a$inf_averted_high[c(4:6,1:3)])
bp = barplot(
  matrix(data2a$dis_averted,3,2)[,c(2,1)],ylim=c(0,1.2*max(data2a$dis_averted)),beside=T,
  xlab='q',names.arg=c('0.0','1.0'),las=1)
segments(bp, data2a$dis_averted_low[c(4:6,1:3)], bp, data2a$dis_averted_high[c(4:6,1:3)])

par(mar=c(1,2.5,0.5,1))

plot(1:3,101:103,xlim=c(0,1),ylim=c(0,1),xaxt='n',yaxt='n',xlab='',ylab='',bty='n')
legend('center',legend=c('lower','default','higher'),title='biting rate scenario: ',col=gray.colors(3),pt.cex=3,pch=15,bty='n',horiz=T)

dev.off()

data1a = subset(
  data_psa,
  scenario%in%c('death_0.5_immunity_exp_686','immunity_exp_686','death_2.0_immunity_exp_686') &
  parameter=='vaccine_prop_inf_1')[c(1,3,2,4,6,5),]
data2a = subset(
  data_psa,
  scenario%in%c('death_0.5_immunity_exp_686','immunity_exp_686','death_2.0_immunity_exp_686') &
  parameter=='vaccine_normdev_pos_1')[c(1,3,2,4,6,5),]

pdf(file='../output/supplement_figure_S29_sens_cyd_death.pdf',width=6.5,height=4.5)

layout(rbind(matrix(1:4,2,2,byrow=T),c(5,5)),heights=c(1,1,0.4))
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
  matrix(data2a$inf_averted,3,2)[,c(2,1)],ylim=c(0,1.2*max(data2a$inf_averted)),beside=T,
  xlab='q',names.arg=c('0.0','1.0'),las=1)
segments(bp, data2a$inf_averted_low[c(4:6,1:3)], bp, data2a$inf_averted_high[c(4:6,1:3)])
bp = barplot(
  matrix(data2a$dis_averted,3,2)[,c(2,1)],ylim=c(0,1.2*max(data2a$dis_averted)),beside=T,
  xlab='q',names.arg=c('0.0','1.0'),las=1)
segments(bp, data2a$dis_averted_low[c(4:6,1:3)], bp, data2a$dis_averted_high[c(4:6,1:3)])

par(mar=c(1,2.5,0.5,1))

plot(1:3,101:103,xlim=c(0,1),ylim=c(0,1),xaxt='n',yaxt='n',xlab='',ylab='',bty='n')
legend('center',legend=c('lower','default','higher'),title='mosquito death rate scenario: ',col=gray.colors(3),pt.cex=3,pch=15,bty='n',horiz=T)

dev.off()



data1a = subset(
  data_psa,
  scenario%in%c('eip_0.5_immunity_exp_686','immunity_exp_686','eip_2.0_immunity_exp_686') &
  parameter=='vaccine_prop_inf_1')[c(1,3,2,4,6,5),]
data2a = subset(
  data_psa,
  scenario%in%c('eip_0.5_immunity_exp_686','immunity_exp_686','eip_2.0_immunity_exp_686') &
  parameter=='vaccine_normdev_pos_1')[c(1,3,2,4,6,5),]

pdf(file='../output/supplement_figure_S30_sens_cyd_eip.pdf',width=6.5,height=4.5)

layout(rbind(matrix(1:4,2,2,byrow=T),c(5,5)),heights=c(1,1,0.4))
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
  matrix(data2a$inf_averted,3,2)[,c(2,1)],ylim=c(0,1.2*max(data2a$inf_averted)),beside=T,
  xlab='q',names.arg=c('0.0','1.0'),las=1)
segments(bp, data2a$inf_averted_low[c(4:6,1:3)], bp, data2a$inf_averted_high[c(4:6,1:3)])
bp = barplot(
  matrix(data2a$dis_averted,3,2)[,c(2,1)],ylim=c(0,1.2*max(data2a$dis_averted)),beside=T,
  xlab='q',names.arg=c('0.0','1.0'),las=1)
segments(bp, data2a$dis_averted_low[c(4:6,1:3)], bp, data2a$dis_averted_high[c(4:6,1:3)])

par(mar=c(1,2.5,0.5,1))

plot(1:3,101:103,xlim=c(0,1),ylim=c(0,1),xaxt='n',yaxt='n',xlab='',ylab='',bty='n')
legend('center',legend=c('shorter','default','longer'),title='extrinsic incubation period scenario: ',col=gray.colors(3),pt.cex=3,pch=15,bty='n',horiz=T)

dev.off()



data1a = subset(
  data_psa,
  scenario%in%c('pmove_0.1_immunity_exp_686','immunity_exp_686','pmove_0.5_immunity_exp_686') &
  parameter=='vaccine_prop_inf_1')[c(1,3,2,4,6,5),]
data2a = subset(
  data_psa,
  scenario%in%c('pmove_0.1_immunity_exp_686','immunity_exp_686','pmove_0.5_immunity_exp_686') &
  parameter=='vaccine_normdev_pos_1')[c(1,3,2,4,6,5),]

pdf(file='../output/supplement_figure_S31_sens_cyd_pmove.pdf',width=6.5,height=4.5)

layout(rbind(matrix(1:4,2,2,byrow=T),c(5,5)),heights=c(1,1,0.4))
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
  matrix(data2a$inf_averted,3,2)[,c(2,1)],ylim=c(0,1.2*max(data2a$inf_averted)),beside=T,
  xlab='q',names.arg=c('0.0','1.0'),las=1)
segments(bp, data2a$inf_averted_low[c(4:6,1:3)], bp, data2a$inf_averted_high[c(4:6,1:3)])
bp = barplot(
  matrix(data2a$dis_averted,3,2)[,c(2,1)],ylim=c(0,1.2*max(data2a$dis_averted)),beside=T,
  xlab='q',names.arg=c('0.0','1.0'),las=1)
segments(bp, data2a$dis_averted_low[c(4:6,1:3)], bp, data2a$dis_averted_high[c(4:6,1:3)])

par(mar=c(1,2.5,0.5,1))

plot(1:3,101:103,xlim=c(0,1),ylim=c(0,1),xaxt='n',yaxt='n',xlab='',ylab='',bty='n')
legend('center',legend=c('lower (0.1)','default (0.3)','higher (0.5)'),title='mosquito movement probability scenario: ',col=gray.colors(3),pt.cex=3,pch=15,bty='n',horiz=T)

dev.off()



data1a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','asymp_0.5_immunity_exp_686') &
  parameter=='vaccine_prop_inf_1')[c(2,1,4,3),]
data2a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','asymp_0.5_immunity_exp_686') &
  parameter=='vaccine_normdev_pos_1')[c(2,1,4,3),]

pdf(file='../output/supplement_figure_S24_sens_cyd_asymp.pdf',width=6.5,height=4.5)

layout(rbind(matrix(1:4,2,2,byrow=T),c(5,5)),heights=c(1,1,0.4))
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
  matrix(data2a$inf_averted,2,2)[,c(2,1)],ylim=c(0,1.2*max(data2a$inf_averted)),beside=T,
  xlab='q',names.arg=c('0.0','1.0'),las=1)
segments(bp, data2a$inf_averted_low[c(3:4,1:2)], bp, data2a$inf_averted_high[c(3:4,1:2)])
bp = barplot(
  matrix(data2a$dis_averted,2,2)[,c(2,1)],ylim=c(0,1.2*max(data2a$dis_averted)),beside=T,
  xlab='q',names.arg=c('0.0','1.0'),las=1)
segments(bp, data2a$dis_averted_low[c(3:4,1:2)], bp, data2a$dis_averted_high[c(3:4,1:2)])

par(mar=c(1,2.5,0.5,1))

plot(1:2,101:102,xlim=c(0,1),ylim=c(0,1),xaxt='n',yaxt='n',xlab='',ylab='',bty='n')
legend('center',legend=c('default (homogeneous)','breakthrough infections lower'),title='human infectiousness scenario: ',col=gray.colors(2),pt.cex=3,pch=15,bty='n',horiz=T)

dev.off()



data1a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','p_0.5_immunity_exp_686') &
  parameter=='vaccine_prop_inf_1')[c(2,1,4,3),]
data2a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','p_0.5_immunity_exp_686') &
  parameter=='vaccine_normdev_pos_1')[c(2,1,4,3),]

pdf(file='../output/supplement_figure_S27_sens_cyd_mozinfec.pdf',width=6.5,height=4.5)

layout(rbind(matrix(1:4,2,2,byrow=T),c(5,5)),heights=c(1,1,0.4))
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
  matrix(data2a$inf_averted,2,2)[,c(2,1)],ylim=c(0,1.2*max(data2a$inf_averted)),beside=T,
  xlab='q',names.arg=c('0.0','1.0'),las=1)
segments(bp, data2a$inf_averted_low[c(3:4,1:2)], bp, data2a$inf_averted_high[c(3:4,1:2)])
bp = barplot(
  matrix(data2a$dis_averted,2,2)[,c(2,1)],ylim=c(0,1.2*max(data2a$dis_averted)),beside=T,
  xlab='q',names.arg=c('0.0','1.0'),las=1)
segments(bp, data2a$dis_averted_low[c(3:4,1:2)], bp, data2a$dis_averted_high[c(3:4,1:2)])

par(mar=c(1,2.5,0.5,1))

plot(1:2,101:102,xlim=c(0,1),ylim=c(0,1),xaxt='n',yaxt='n',xlab='',ylab='',bty='n')
legend('center',legend=c('default (1.0)','lower (0.5)'),title='mosquito infectiousness scenario: ',col=gray.colors(2),pt.cex=3,pch=15,bty='n',horiz=T)

dev.off()



data1a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','immunity_exp_180') &
  parameter=='vaccine_prop_inf_1')[c(2,1,4,3),]
data2a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','immunity_exp_180') &
  parameter=='vaccine_normdev_pos_1')[c(2,1,4,3),]

pdf(file='../output/supplement_figure_S25_sens_cyd_immunity_duration.pdf',width=6.5,height=4.5)

layout(rbind(matrix(1:4,2,2,byrow=T),c(5,5)),heights=c(1,1,0.4))
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
  matrix(data2a$inf_averted,2,2)[,c(2,1)],ylim=c(0,1.2*max(data2a$inf_averted)),beside=T,
  xlab='q',names.arg=c('0.0','1.0'),las=1)
segments(bp, data2a$inf_averted_low[c(3:4,1:2)], bp, data2a$inf_averted_high[c(3:4,1:2)])
bp = barplot(
  matrix(data2a$dis_averted,2,2)[,c(2,1)],ylim=c(0,1.2*max(data2a$dis_averted)),beside=T,
  xlab='q',names.arg=c('0.0','1.0'),las=1)
segments(bp, data2a$dis_averted_low[c(3:4,1:2)], bp, data2a$dis_averted_high[c(3:4,1:2)])

par(mar=c(1,2.5,0.5,1))

plot(1:2,101:102,xlim=c(0,1),ylim=c(0,1),xaxt='n',yaxt='n',xlab='',ylab='',bty='n')
legend('center',legend=c('default (686 days)','shorter (180 days)'),title='cross-immunity duration scenario: ',col=gray.colors(2),pt.cex=3,pch=15,bty='n',horiz=T)

dev.off()

data1a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','immunity_fixed_686') &
    parameter=='vaccine_prop_inf_1')
data2a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686','immunity_fixed_686') &
    parameter=='vaccine_normdev_pos_1')

pdf(file='../output/supplement_figure_S26_sens_cyd_immunity_distribution.pdf',width=6.5,height=4.5)

layout(rbind(matrix(1:4,2,2,byrow=T),c(5,5)),heights=c(1,1,0.4))
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
  matrix(data2a$inf_averted,2,2)[,c(2,1)],ylim=c(0,1.2*max(data2a$inf_averted)),beside=T,
  xlab='q',names.arg=c('0.0','1.0'),las=1)
segments(bp, data2a$inf_averted_low[c(3:4,1:2)], bp, data2a$inf_averted_high[c(3:4,1:2)])
bp = barplot(
  matrix(data2a$dis_averted,2,2)[,c(2,1)],ylim=c(0,1.2*max(data2a$dis_averted)),beside=T,
  xlab='q',names.arg=c('0.0','1.0'),las=1)
segments(bp, data2a$dis_averted_low[c(3:4,1:2)], bp, data2a$dis_averted_high[c(3:4,1:2)])

par(mar=c(1,2.5,0.5,1))

plot(1:2,101:102,xlim=c(0,1),ylim=c(0,1),xaxt='n',yaxt='n',xlab='',ylab='',bty='n')
legend('center',legend=c('default (exponential)','fixed duration'),title='inter-individual variability of cross-immunity duration scenario: ',col=gray.colors(2),pt.cex=3,pch=15,bty='n',horiz=T)

dev.off()






