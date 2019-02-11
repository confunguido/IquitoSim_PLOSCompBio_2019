# goodness of fit measure for fitting theta
theta.gof = function(theta){
  abs(VE.in - 1 + sum((1-(1-theta)^(1:100))*dpois(1:100,foidt.in)) / sum(dpois(1:100,foidt.in)))
}

# range of values of VE and foidt
VE.vec = seq(0,1,length.out=100)
foidt.vec = seq(0.1,0.3,0.1)

# calculate theta for all values of VE and foidt
theta.mat = matrix(0,length(VE.vec),length(foidt.vec))
for(vv in 1:length(VE.vec)){
  for(ff in 1:length(foidt.vec)){
    VE.in = VE.vec[vv]
    foidt.in = foidt.vec[ff]
    theta.mat[vv,ff] = optimize(theta.gof,c(0,1))$minimum
  }
}

# plot the results
pdf('../output/supplement_figure_S40_Theta_vs_FOI.pdf',width=3.25,height=3.25)

par(mar=c(4,4,1,1))

col.lines=col=rgb(seq(1,0,length.out=length(foidt.vec)),0,seq(0,1,length.out=length(foidt.vec)))
matplot(VE.vec,theta.mat,col=col.lines,type='l',lty=1,las=1,xaxs='i',yaxs='i',xlab='',ylab='',ylim=c(0,1))
abline(1,-1,lty=2)
mtext('VE',1,line=2.5)
mtext(expression(theta),2,line=3,las=1)
legend(.73,.9,legend=foidt.vec,col=col.lines,lty=1,bty='n',cex=.7)
text(.875,.92,expression('FOI' * Delta * 't'))

dev.off()