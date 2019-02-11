#======================================================================================#
# Author: Guido España
# analyze output of parameter sweep of vaccine properties
# project: PLOS COMP BIO paper 2019 Iquitos
# Year: 2019
#
#======================================================================================#
# User's input--------
#======================================================================================#
library(mgcv)
rm(list = ls())

#======================================================================================#
# match simulations pairs of vax and no vax --------
#======================================================================================#
scenarios_list = c('immunity_exp_686', 'immunity_exp_180', 
                   'immunity_fixed_686')

current_scenario = scenarios_list[1]
datadir = sprintf('../../vaccine_sweep/data/sweep_normdev_%s', current_scenario)
parameters_out = read.csv(paste(datadir, '/parameters_out.csv', sep =""))

df = readRDS(sprintf('%s/simulations_cases_averted.RDS',datadir))
df$inf_averted = (df$cum_inf - df$cum_inf_vax) / df$cum_inf
df$dis_averted = (df$cum_dis - df$cum_dis_vax) / df$cum_dis
df$p = df$vaccine_prop_inf_1
df$q = 1 - df$vaccine_normdev_pos_1
gam.inf = gam(inf_averted ~ s(p) + s(q), data = df)
gam.dis = gam(dis_averted ~ s(p) + s(q), data = df)

#======================================================================================#
# Create a 2x2 figure of infections and cases averted --------
#======================================================================================#

pdf(sprintf('../output/figure_08_PLOS_CMP_BIO_3_manuscript_infections_averted_normdev_%s.pdf',current_scenario),width=7.5,height=7.5)
par(mfrow = c(2,2),oma=c(3,4.5,0,0),mar=c(0.5,0.5,0.5,.5))

# cumulative infections averted vs prop_inf  
p = predict(gam.inf,type='response',se.fit=T,newdata=data.frame(p=seq(0,1,0.001),q=0.5))
plot(df$p,df$inf_averted,col = 'gray',pch=19,cex=0.3,xaxt='n',yaxs='i',xlab='',ylab='',las=1,ylim = c(-0.1,0.25))
polygon(
  c(seq(0,1,0.001),rev(seq(0,1,0.001))),
  c(p$fit-1.96*p$se.fit,rev(p$fit+1.96*p$se.fit)),
  col=rgb(0,0,0,0.4),border=NA)
lines(seq(0,1,0.001),p$fit)
abline(h=0,lty=2)
mtext('Proportion of infections averted',2,line=3.5)

# cumulative infections averted vs normdev
p = predict(gam.inf,type='response',se.fit=T,newdata=data.frame(q=seq(0,1,0.001),p=0.5))
plot(df$q,df$inf_averted,col = 'gray',pch=19,cex=0.3,xaxt='n',yaxt='n',yaxs='i',xlab='',ylab='',las=1,ylim = c(-0.1,0.25))
polygon(
  c(seq(0,1,0.001),rev(seq(0,1,0.001))),
  c(p$fit-1.96*p$se.fit,rev(p$fit+1.96*p$se.fit)),
  col=rgb(0,0,0,0.4),border=NA)
lines(seq(0,1,0.001),p$fit)
abline(h=0,lty=2)

# cumulative disease averted vs prop_inf
p = predict(gam.dis,type='response',se.fit=T,newdata=data.frame(p=seq(0,1,0.001),q=0.5))
plot(df$p,df$dis_averted,col = 'gray',pch=19,cex=0.3,yaxs='i',xlab='',ylab='',las=1,ylim = c(-0.1,0.25))
polygon(
  c(seq(0,1,0.001),rev(seq(0,1,0.001))),
  c(p$fit-1.96*p$se.fit,rev(p$fit+1.96*p$se.fit)),
  col=rgb(0,0,0,0.4),border=NA)
lines(seq(0,1,0.001),p$fit)
abline(h=0,lty=2)
mtext('Proportion of disease episodes averted',2,line=3.5)
mtext('Proportion of protection due to infection, p',1,line=2.25)

# cumulative disease averted vs normdev
p = predict(gam.dis,type='response',se.fit=T,newdata=data.frame(q=seq(0,1,0.001),p=0.5))
plot(df$q,df$dis_averted,col = 'gray',pch=19,cex=0.3,yaxt='n',yaxs='i',xlab='',ylab='',las=1,ylim = c(-0.1,0.25))
polygon(
  c(seq(0,1,0.001),rev(seq(0,1,0.001))),
  c(p$fit-1.96*p$se.fit,rev(p$fit+1.96*p$se.fit)),
  col=rgb(0,0,0,0.4),border=NA)
lines(seq(0,1,0.001),p$fit)
abline(h=0,lty=2)
mtext('Quantile of vaccine efficacy estimate, q',1,line=2.25)

dev.off()
