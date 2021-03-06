#======================================================================================#
# Author: Guido España, Alex Perkins
# analyze output of parameter sweep of vaccine properties
# project: PLOS COMP BIO paper 2019 Iquitos
# Year: 2019
#
#======================================================================================#
# User's input--------
#======================================================================================#
rm(list = ls())
library(mgcv)
library(randomForest)

datadir = '../../vaccine_sweep/data/sweep_vaccine_simple_immunity_exp_686'
parameters_out = read.csv(paste(datadir, '/parameters_out.csv', sep =""))

case_data = readRDS(sprintf('%s/simulations_cases_averted.RDS',datadir))
case_data$inf_averted = (case_data$cum_inf - case_data$cum_inf_vax) / case_data$cum_inf
case_data$dis_averted = (case_data$cum_dis - case_data$cum_dis_vax) / case_data$cum_dis

gam.inf = gam(inf_averted ~
                 s(vaccine_prop_inf_4) + s(vaccine_efficacy_mean) +
                 s(vaccine_efficacy_serotype) + s(vaccine_efficacy_serostatus), data = case_data)
gam.dis = gam(dis_averted ~
                s(vaccine_prop_inf_4) + s(vaccine_efficacy_mean) +
                s(vaccine_efficacy_serotype) + s(vaccine_efficacy_serostatus), data = case_data)

#======================================================================================#
# Create a heatmap from the random forest --------
#======================================================================================#
 p = seq(from = 0.1, by = 0.1, to = 1.0)
 ve_mean = seq(from = 0.15, by = 0.05, to = 0.85)
 ve_serostatus = 0.075
 ve_serotype = 0.075
 
#======================================================================================#
# Create two figures of cases averted: p,VEmean, and VEserostatus, VEserotype --------
#======================================================================================#
 pdf('../output/figure_09_PLOS_CMP_BIO_3_manuscript_simple_vac_infections_averted_p_VEmean.pdf',width=7.5,height=7.5)
  layout(matrix(1:4,2,2,byrow = T))
  par(oma=c(3,4.5,0,0),mar=c(0.5,0.5,0.5,.5))
  
  # cumulative infections vs prop_inf
  p  = predict(gam.inf, type = 'response', se.fit=T,newdata=
                 data.frame(vaccine_efficacy_mean = 0.5, vaccine_prop_inf_4 = seq(from=0,by = 0.01, to = 1.0),
                            vaccine_efficacy_serotype = 0.075, vaccine_efficacy_serostatus = 0.075 ))
  plot(case_data$vaccine_prop_inf_4,case_data$inf_averted,col = 'gray',pch=19,cex=0.3,xaxt='n',yaxs = 'i',xlab='',ylab='',las=1, ylim = c(-0.1,0.25))
  polygon(
    c(seq(from=0,by = 0.01, to = 1.0),rev(seq(from=0,by = 0.01, to = 1.0))),
    c(p$fit-1.96*p$se.fit,rev(p$fit+1.96*p$se.fit)),
    col=rgb(0,0,0,0.4),border=NA)
  lines(seq(from=0,by = 0.01, to = 1.0), p$fit)  
  abline(h=0,lty=2)
  mtext('Proportion of infections averted',2,line=3.5)
  
  # cumulative infections averted vs VE_mean
  p  = predict(gam.inf, type = 'response', se.fit=T,newdata=
                 data.frame(vaccine_efficacy_mean = seq(from=0,by = 0.01, to = 1.0), vaccine_prop_inf_4 = 0.5,
                            vaccine_efficacy_serotype = 0.075, vaccine_efficacy_serostatus = 0.075 ))
  plot(case_data$vaccine_efficacy_mean,case_data$inf_averted,col = 'gray',pch=19,cex=0.3,xaxt='n',yaxt='n',xlab='',ylab='',las=1, ylim = c(-0.1,0.25))
  polygon(
    c(seq(from=0,by = 0.01, to = 1.0),rev(seq(from=0,by = 0.01, to = 1.0))),
    c(p$fit-1.96*p$se.fit,rev(p$fit+1.96*p$se.fit)),
    col=rgb(0,0,0,0.4),border=NA)
  lines(seq(from=0,by = 0.01, to = 1.0), p$fit)  
  abline(h=0,lty=2)

  
  # cumulative  disease episodes vs prop_inf
  p  = predict(gam.dis, type = 'response', se.fit=T,newdata=
                 data.frame(vaccine_efficacy_mean = 0.5, vaccine_prop_inf_4 = seq(from=0,by = 0.01, to = 1.0),
                            vaccine_efficacy_serotype = 0.075, vaccine_efficacy_serostatus = 0.075 ))
  plot(case_data$vaccine_prop_inf_4,case_data$dis_averted,col = 'gray',pch=19,cex=0.3,xaxs='i',yaxs = 'i',xlab='',ylab='',las=1, ylim = c(-0.1,0.25)) 
  polygon(
    c(seq(from=0,by = 0.01, to = 1.0),rev(seq(from=0,by = 0.01, to = 1.0))),
    c(p$fit-1.96*p$se.fit,rev(p$fit+1.96*p$se.fit)),
    col=rgb(0,0,0,0.4),border=NA)
  lines(seq(from=0,by = 0.01, to = 1.0), p$fit)  
  abline(h=0,lty=2)
  mtext('Proportion of  disease episodes averted',2,line=3.5)
  mtext('Proportion of protection due to infection,p',1,line=2.5)
  
  # cumulative  disease episodes averted vs VE_mean
  p  = predict(gam.dis, type = 'response', se.fit=T,newdata=
                 data.frame(vaccine_efficacy_mean = seq(from=0,by = 0.01, to = 1.0), vaccine_prop_inf_4 = 0.5,
                            vaccine_efficacy_serotype = 0.075, vaccine_efficacy_serostatus = 0.075 ))
  plot(case_data$vaccine_efficacy_mean,case_data$dis_averted,col = 'gray',pch=19,cex=0.3,xaxs='i',yaxt='n',xlab='',ylab='',las=1, ylim = c(-0.1,0.25))
  polygon(
    c(seq(from=0,by = 0.01, to = 1.0),rev(seq(from=0,by = 0.01, to = 1.0))),
    c(p$fit-1.96*p$se.fit,rev(p$fit+1.96*p$se.fit)),
    col=rgb(0,0,0,0.4),border=NA)
  lines(seq(from=0,by = 0.01, to = 1.0), p$fit)  
  abline(h=0,lty=2)
  mtext(expression(VE[Mean]),1,line=2.5, cex = 1)
dev.off()
