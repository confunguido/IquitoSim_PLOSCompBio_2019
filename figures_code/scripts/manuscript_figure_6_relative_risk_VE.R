# 1 – AR_v / AR_p
# 1 – (Pr_dis|inf_v * Pr_inf|exp_v * Pr_exp_v) / (Pr_dis|inf_p * Pr_inf|exp_p * Pr_exp_p)
# 1 – (Pr_dis|inf_v * Pr_inf|exp_v) / (Pr_dis|inf_p * Pr_inf|exp_p)
# 1 – (Pr_dis|inf_v * Pr_inf|exp_v) / (Pr_dis|inf_p)
# 1 – (Pr_dis|inf_v / Pr_dis|inf_p) * Pr_inf|exp_v
# 1 - RR_dis|inf * RR_inf|exp
#======================================================================================#
# User's input--------
#======================================================================================#
rm(list = ls())

#======================================================================================#
# Create figure--------
#======================================================================================#
FoI <- 0.05 #Force of infection per year

# "Tuneing parameter"... related to sample size
Yi <- 2000


# vaccine efficacy at a given age
VE.age = function(a, b, c, age){
  1 - a / (1 + exp(b * (age - c)))
}

# calculate mean protection within a given age range
# assuming equal distribution within age range
VE = function(a, b, c, ages){
  mean(sapply(ages,function(aa) VE.age(a, b, c, aa)))
}

# specify age ranges from trial data
ages.young = seq(2, 9, .01)
ages.old = seq(9, 16, .01)

# VE estimates from trial data
VE.data = c(.701, .144, .819, .525)
CIlow.data = c(.323,-1.11,.672,.059)
CIhigh.data = c(.873,.635,.9,.761)

# function to calculate goodness of fit between trial data and model
gof = function(a.pos, b.pos, c.pos, a.neg, b.neg, c.neg){
  (VE(a.pos,b.pos,c.pos,ages.young) - VE.data[1]) ^ 2 +
  (VE(a.neg,b.neg,c.neg,ages.young) - VE.data[2]) ^ 2 +
  (VE(a.pos,b.pos,c.pos,ages.old) - VE.data[3]) ^ 2 +
  (VE(a.neg,b.neg,c.neg,ages.old) - VE.data[4]) ^ 2
}

# find best-fit parameter values for age relationships
VE.fit = optim(par=c(1,0,9,1,0,9),fn=function(par){
  gof(par[1],par[2],par[3],par[4],par[5],par[6])})

	
	
	
	
# plot probability of protection against disease as a function of age
# for seronegative and seropositive individuals
ages.all = seq(0,40,.01)
# plot(
#   ages.all,
#   VE.age(VE.fit$par[1], VE.fit$par[2], VE.fit$par[3], ages.all),
#   type='l', ylim=c(0,1), col = 2, lwd = 3, las=1,
#   xlab = 'Age', ylab = 'Vaccine efficacy against virus-confirmed disease')
# lines(
#   ages.all,
#   VE.age(VE.fit$par[4], VE.fit$par[5], VE.fit$par[6], ages.all),
#   col = 4, lwd = 3)
# segments(c(2,2,9,9),VE.data,c(9,9,16,16),VE.data,col=c(2,4,2,4),lwd=2)
# abline(v=c(2,9,16),lty=3)


VE.SeroPos <- VE.age(VE.fit$par[1], VE.fit$par[2], VE.fit$par[3], ages.all)
VE.SeroNeg <- VE.age(VE.fit$par[4], VE.fit$par[5], VE.fit$par[6], ages.all)


# Assuming wholy susceptible population



zstar = 1.96

RR.SeroPos <- 1-VE.SeroPos
c0Pos <- rep(FoI * Yi,length(RR.SeroPos))+.5
c1Pos <- FoI*RR.SeroPos* Yi+.5
RR.SeroPos.UB <- exp(log(RR.SeroPos)+zstar*sqrt(1/c1Pos+1/c0Pos))
RR.SeroPos.LB <- exp(log(RR.SeroPos)-zstar*sqrt(1/c1Pos+1/c0Pos))

VE.SeroPos.LB <- 1-RR.SeroPos.UB
VE.SeroPos.UB <- 1-RR.SeroPos.LB

RR.SeroNeg <- 1-VE.SeroNeg
c0Neg <- rep(FoI * Yi,length(RR.SeroNeg))+.5
c1Neg <- FoI*RR.SeroNeg* Yi+.5
RR.SeroNeg.UB <- exp(log(RR.SeroNeg)+zstar*sqrt(1/c1Neg+1/c0Neg))
RR.SeroNeg.LB <- exp(log(RR.SeroNeg)-zstar*sqrt(1/c1Neg+1/c0Neg))
VE.SeroNeg.LB <- 1-RR.SeroNeg.UB
VE.SeroNeg.UB <- 1-RR.SeroNeg.LB

# polygon(c(ages.all,rev(ages.all)),c(VE.SeroPos.UB,rev(VE.SeroPos.LB)),col=rgb(1,0,0,.1))
# polygon(c(ages.all,rev(ages.all)),c(VE.SeroNeg.UB,rev(VE.SeroNeg.LB)),col=rgb(0,0,1,.1))


### This assumes that there is a single random effect 
### for BOTH seronegative and seropositive. Hopefully
### it is clear where to change if desired
Draws <- 500
Realizations <- array(0,dim=c(2,Draws,length(ages.all)))
for (i in 1:Draws){
	z <- rnorm(1)
	Realizations[1,i,] <- 1-exp(log(RR.SeroPos)+z*sqrt(1/c1Pos+1/c0Pos))
	Realizations[2,i,] <- 1-exp(log(RR.SeroNeg)+z*sqrt(1/c1Neg+1/c0Neg))
}

#-----	
# plot probability of protection against disease as a function of age
# for seronegative and seropositive individuals
pdf('../output/VE_overall.pdf',width=3.25,height=3.25)
par(oma=rep(0,4),mar=c(3.7,4.1,.4,1))

ages.all = seq(0,40,.01)
plot(
  ages.all,
  1- VE.age(VE.fit$par[1], VE.fit$par[2], VE.fit$par[3], ages.all),
  type='l', ylim=c(0,2.2), col = 2, las=1, xaxs='i', yaxs='i',
  xlab = '', ylab = expression('Relative risk of disease, '*RR[dis]))
mtext('Age',side=1,line=2.5)
abline(h=1)
lines(
  ages.all,
  1 - VE.age(VE.fit$par[4], VE.fit$par[5], VE.fit$par[6], ages.all),
  col = 4)

for (i in 1:500){
	lines(ages.all,1 - Realizations[1,i,],col=rgb(1,0,0,.1))
	lines(ages.all,1 - Realizations[2,i,],col=rgb(0,0,1,.1))
}


arrows(4, 1 - CIhigh.data[1], 4, 1 - CIlow.data[1], length=0.1, angle=90, code=3, col = "#000000", lwd = 1)
points(4,1 - VE.data[1], pch = 20, col = "#000000")
points(4,1 - VE.data[1], pch = 19, col = '#FF0000', cex = 0.4)


arrows(7, 1 - CIhigh.data[2], 7, 1 - CIlow.data[2], length=0.1, angle=90, code=3,col = "#000000", lwd = 1)
points(7,1 - VE.data[2],  pch = 20, col = "#000000")
points(7,1 - VE.data[2], pch = 19, col = 'blue', cex = 0.4)


arrows(11, 1 - CIhigh.data[3], 11, 1 - CIlow.data[3], length=0.1, angle=90, code=3, col = "#000000", lwd = 1)
points(11,1 - VE.data[3],  pch = 20, col = "#000000")
points(11,1 - VE.data[3], pch = 19, col = 'red', cex = 0.4)

arrows(14, 1 - CIhigh.data[4], 14, 1 - CIlow.data[4], length=0.1, angle=90, code=3, col = "#000000", lwd = 1)
points(14,1 - VE.data[4], pch = 20, col = "#000000")
points(14,1 - VE.data[4], pch = 19, col = 'blue', cex = 0.4)


legend("topright",  c('Seropositive', 'Seronegative'), col = c('red', 'blue'), lwd = 2, bty = "n", cex = 0.7)
abline(v=c(2,9,16),lty=3)
dev.off()

# segments(c(2),1 - VE.data[1],c(9),1 - VE.data[1],col="#000000",lwd=2)
# segments(c(2),1 - VE.data[2],c(9),1 - VE.data[2],col="#A0A0A0",lwd=2)
# segments(c(9),1 - VE.data[3],c(16),1 - VE.data[3],col="#000000",lwd=2)
# segments(c(9),1 - VE.data[4],c(16),1 - VE.data[4],col="#A0A0A0",lwd=2)



# plot 3 different scenarios about the relative proportion of risk reduction
# attributable to reduction in risk or disease versus reduction in risk of infection
pdf(file='../output/figure_06_VE_inf_dis.pdf',width=6.5,heigh=3.2)
par(oma=c(4,4.5,.5,.5),mar=rep(.5,4))
layout(matrix(1:3,1,3))

prop.inf = .1
RR_dis.pos = (1 - VE.age(VE.fit$par[1], VE.fit$par[2], VE.fit$par[3], ages.all)) ^ (1 - prop.inf)
RR_inf.pos = (1 - VE.age(VE.fit$par[1], VE.fit$par[2], VE.fit$par[3], ages.all)) ^ prop.inf
RR_dis.neg = (1 - VE.age(VE.fit$par[4], VE.fit$par[5], VE.fit$par[6], ages.all)) ^ (1 - prop.inf)
RR_inf.neg = (1 - VE.age(VE.fit$par[4], VE.fit$par[5], VE.fit$par[6], ages.all)) ^ prop.inf

ages.all = seq(0,40,.01)
plot(
  ages.all,
  RR_dis.pos,
  type='l', ylim=c(0,1.1), col = 2, lwd = 2, las=1, xaxs='i', yaxs='i',
  xlab = '', ylab = '')
mtext('Relative risk of infection or disease', side = 2, line = 3.25)
lines(
  ages.all,
  RR_dis.neg,
  col = 4, lwd = 2)
lines(
  ages.all,
  RR_inf.pos,
  col = 2, lwd = 2, lty = 3)
lines(
  ages.all,
  RR_inf.neg,
  col = 4, lwd = 2, lty = 3)
text(x=33.5,y=1.05,cex=1.3,labels='p = 0.10')
abline(h=1,lty=3)


prop.inf = .49
RR_dis.pos = (1 - VE.age(VE.fit$par[1], VE.fit$par[2], VE.fit$par[3], ages.all)) ^ (1 - prop.inf)
RR_inf.pos = (1 - VE.age(VE.fit$par[1], VE.fit$par[2], VE.fit$par[3], ages.all)) ^ prop.inf
RR_dis.neg = (1 - VE.age(VE.fit$par[4], VE.fit$par[5], VE.fit$par[6], ages.all)) ^ (1 - prop.inf)
RR_inf.neg = (1 - VE.age(VE.fit$par[4], VE.fit$par[5], VE.fit$par[6], ages.all)) ^ prop.inf

ages.all = seq(0,40,.01)
plot(
  ages.all,
  RR_dis.pos,
  type='l', ylim=c(0,1.1), col = 2, lwd = 2, las=1, xaxs='i', yaxs='i', yaxt='n',
  xlab = '', ylab = '')
mtext('Age', side = 1, line = 3)
lines(
  ages.all,
  RR_dis.neg,
  col = 4, lwd = 2)
lines(
  ages.all,
  RR_inf.pos,
  col = 2, lwd = 2, lty = 3)
lines(
  ages.all,
  RR_inf.neg,
  col = 4, lwd = 2, lty = 3)
text(x=33.5,y=1.05,cex=1.3,labels='p = 0.49')
abline(h=1,lty=3)
legend(x=15.5, y=1.0, c(expression(RR['inf | exp']*' (sero-)'), expression(RR['inf | exp']*' (sero+)'),expression(RR['dis | inf']*' (sero-)'), expression(RR['dis | inf']*' (sero+)')), col = c(4,2,4,2), lty=c(3,3,1,1), lwd = 2, bty = "n", cex = 0.9)



prop.inf = .9
RR_dis.pos = (1 - VE.age(VE.fit$par[1], VE.fit$par[2], VE.fit$par[3], ages.all)) ^ (1 - prop.inf)
RR_inf.pos = (1 - VE.age(VE.fit$par[1], VE.fit$par[2], VE.fit$par[3], ages.all)) ^ prop.inf
RR_dis.neg = (1 - VE.age(VE.fit$par[4], VE.fit$par[5], VE.fit$par[6], ages.all)) ^ (1 - prop.inf)
RR_inf.neg = (1 - VE.age(VE.fit$par[4], VE.fit$par[5], VE.fit$par[6], ages.all)) ^ prop.inf

ages.all = seq(0,40,.01)
plot(
  ages.all,
  RR_dis.pos,
  type='l', ylim=c(0,1.1), col = 2, lwd = 2, las=1, xaxs='i', yaxs='i', yaxt='n',
  xlab = '', ylab = '')
lines(
  ages.all,
  RR_dis.neg,
  col = 4, lwd = 2)
lines(
  ages.all,
  RR_inf.pos,
  col = 2, lwd = 2, lty = 3)
lines(
  ages.all,
  RR_inf.neg,
  col = 4, lwd = 2, lty = 3)
text(x=33.5,y=1.05,cex=1.3,labels='p = 0.90')
abline(h=1,lty=3)

dev.off()
