#======================================================================================#
# Author: Guido España, Alex Perkins
# analyze output of parameter sweep of vaccine properties
# project: PLOS COMP BIO paper 2019 Iquitos
# Year: 2019
#
#======================================================================================#
rm(list = ls())
pdf(file='../output/figure_10_sens_summary.pdf',width=6.5,height=4.5)

layout(rbind(matrix(1:4,2,2,byrow=F),c(5,5)),widths=c(1,2),heights=c(1,1,0.25))
par(mar=c(5,6,0.5,0.25),oma=c(0,0,3,0))

data_psa = readRDS('PSA_table_normdev_vaccine.RDS')
data1a = subset(
  data_psa,
  scenario=='immunity_exp_686' &
  parameter=='vaccine_prop_inf_1')
data2a = subset(
  data_psa,
  scenario=='immunity_exp_686' &
  parameter=='vaccine_normdev_pos_1')[c(2,1),]

bp = barplot(
  matrix(c(data1a$inf_averted,data2a$inf_averted),2,2),
  ylim=c(0,1.2*max(c(data1a$inf_averted,data2a$inf_averted))),beside=T,
  names.arg=c('p','q'),las=1)
segments(bp, c(data1a$inf_averted_low,data2a$inf_averted_low),
         bp, c(data1a$inf_averted_high,data2a$inf_averted_high))
mtext('Proportion of infections averted',2,line=3.25,cex=0.7)
mtext('CYD-TDV vaccine profile',3,line=1.5,cex=0.7)

bp = barplot(
  matrix(c(data1a$dis_averted,data2a$dis_averted),2,2),
  ylim=c(0,1.2*max(c(data1a$dis_averted,data2a$dis_averted))),beside=T,
  names.arg=c('p','q'),las=1)
segments(bp, c(data1a$dis_averted_low,data2a$dis_averted_low),
         bp, c(data1a$dis_averted_high,data2a$dis_averted_high))
mtext('Proportion of disease averted',2,line=3.25,cex=0.7)

data_psa = readRDS('PSA_table_simple_vaccine.RDS')
data1a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686') &
    parameter=='vaccine_prop_inf_4')
data2a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686') &
    parameter=='vaccine_efficacy_mean')
data3a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686') &
    parameter=='vaccine_efficacy_serostatus')
data4a = subset(
  data_psa,
  scenario%in%c('immunity_exp_686') &
    parameter=='vaccine_efficacy_serotype')

bp = barplot(
  matrix(c(data1a$inf_averted,data2a$inf_averted,data3a$inf_averted,data4a$inf_averted),2,4),
  ylim=c(0,1.2*max(c(data1a$inf_averted,data2a$inf_averted,data3a$inf_averted,data4a$inf_averted))),beside=T,
  names.arg=c('p',expression(VE['mean']),expression(VE['serostatus']),expression(VE['serotype'])),las=1)
segments(bp, c(data1a$inf_averted_low,data2a$inf_averted_low,data3a$inf_averted_low,data4a$inf_averted_low),
         bp, c(data1a$inf_averted_high,data2a$inf_averted_high,data3a$inf_averted_high,data4a$inf_averted_high))
mtext('Generic dengue vaccine profile',3,line=1.5,cex=0.7)

bp = barplot(
  matrix(c(data1a$dis_averted,data2a$dis_averted,data3a$dis_averted,data4a$dis_averted),2,4),
  ylim=c(0,1.2*max(c(data1a$dis_averted,data2a$dis_averted,data3a$dis_averted,data4a$dis_averted))),beside=T,
  names.arg=c('p',expression(VE['mean']),expression(VE['serostatus']),expression(VE['serotype'])),las=1)
segments(bp, c(data1a$dis_averted_low,data2a$dis_averted_low,data3a$dis_averted_low,data4a$dis_averted_low),
         bp, c(data1a$dis_averted_high,data2a$dis_averted_high,data3a$dis_averted_high,data4a$dis_averted_high))

par(mar=c(1,2.5,0.5,1))

plot(1:2,101:102,xlim=c(0,1),ylim=c(0,1),xaxt='n',yaxt='n',xlab='',ylab='',bty='n')
legend('center',legend=c('low','high'),title='parameter extreme: ',col=gray.colors(2),pt.cex=3,pch=15,bty='n',horiz=T)

dev.off()













