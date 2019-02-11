# Functions to create plots for the parameter sweep of the iquitos paper analysis 
# For project: Dengue Sim Iquitos PLOS COMP BIO 2016
plot_4_foi = function(human.foi.in, data.foi.dengue.in, time.years.in, filename.in = NULL){
  if(!is.null(filename.in)){
    print(filename.in)
    pdf(filename.in,width=10,height=8)
  }
  par(mfrow = c(4,1),mar=c(4,0,0,2),oma=c(0.5,4,2.5,2.5))
  ymax = 0.002; ymin = 0.0; xmin = time.years.in[1]; xmax = time.years.in[length(time.years.in)]
  
  plot(time.years.in,human.foi.in$Denv1, type = "l", col = 'orange',xlim = c(xmin,xmax), ylim = c(ymin, ymax), ylab = "FOI", xlab = "", axes = FALSE)
  legend('topleft', c('Denv1', 'Susceptibles', 'data'), col = c('orange', 'gray', 'black'), lwd = 2,bty = 'n')
  ticks = seq(from = xmin, by = 1, to = xmax)
  abline(v = ticks,col = "gray", lty = 5)
  lines(data.foi.dengue.in$denv1$x, data.foi.dengue.in$denv1$y, col = 'black',lwd = 3)
  yticks = seq(from = 0, by = 0.001, to = 0.005)
  abline(v = ticks,col = "gray", lty = 5)
  abline(h = yticks,col = "gray", lty = 5)
  axis(1, at = ticks);axis(2);box()
  par(new = T) #Susceptibles
  plot(human.foi.in$Susceptible_1 / 200225,col = "gray", type = "l", axes = F, xlim = c(0,4800), ylim = c(0,1), ylab = "", xlab = "")
  axis(side = 4)
  
  plot(time.years.in, human.foi.in$Denv2, type = "l", col = "green",xlim = c(xmin,xmax), ylim = c(ymin, ymax), ylab = "FOI", xlab = "", axes = FALSE)
  legend('topleft', c('Denv2'), col = c('green'), lwd = 2,bty = 'n')
  ticks = seq(from = xmin, by = 1, to = xmax)
  lines(data.foi.dengue.in$denv2$x, data.foi.dengue.in$denv2$y, col = 'black',lwd = 3)
  abline(h = yticks,col = "gray", lty = 5)
  abline(v = ticks,col = "gray", lty = 5)
  axis(1, at = ticks);axis(2);box()
  par(new = T) #Susceptibles 
  plot(human.foi.in$Susceptible_2 / 200225,col = "gray", type = "l", axes = F, xlim = c(0,4800), ylim = c(0,1), ylab = "", xlab = "")
  axis(side = 4)
  
  
  plot(time.years.in, human.foi.in$Denv3, type = "l", col = "blue",xlim = c(xmin,xmax), ylim = c(ymin, ymax), ylab = "FOI", xlab = "", axes = FALSE)
  legend('topleft', c('Denv3'), col = c('blue'), lwd = 2,bty = 'n')
  ticks = seq(from = xmin, by = 1, to = xmax)
  lines(data.foi.dengue.in$denv3$x, data.foi.dengue.in$denv3$y, col = 'black',lwd = 3)
  abline(v = ticks,col = "gray", lty = 5)
  abline(h = yticks,col = "gray", lty = 5)
  axis(1, at = ticks);axis(2);box()
  par(new = T) #Susceptibles 
  plot(human.foi.in$Susceptible_3 / 200225,col = "gray", type = "l", axes = F, xlim = c(0,4800), ylim = c(0,1), ylab = "", xlab = "")
  axis(side = 4)
  
  plot(time.years.in, human.foi.in$Denv4, type = "l", col = "purple",xlim = c(xmin,xmax), ylim = c(ymin, ymax), ylab = "FOI", xlab = "", axes = FALSE)
  legend('topleft', c('Denv4'), col = c( 'purple'), lwd = 2,bty = 'n')
  ticks = seq(from = xmin, by = 1, to = xmax)
  lines(data.foi.dengue.in$denv4$x, data.foi.dengue.in$denv4$y, col = 'black',lwd = 3)
  abline(h = yticks,col = "gray", lty = 5)
  abline(v = ticks,col = "gray", lty = 5)
  axis(1, at = ticks);axis(2);box()
  par(new = T) #Susceptibles 
  plot(human.foi.in$Susceptible_4 / 200225,col = "gray", type = "l", axes = F, xlim = c(0,4800), ylim = c(0,1), ylab = "", xlab = "")
  axis(side = 4)
  
  if(!is.null(filename.in)){
   dev.off()
  }
}



plot_4_foi_sampled = function(human.foi.sus.in, human.foi.den.in, data.foi.in, low.foi.in, high.foi.in, 
                              time.years.in, sample.in = 7,  title.in = "FOI", filename.in = NULL){
  if(!is.null(filename.in)){
    # print(filename.in)
    png(filename.in,width=960,height=480)
  }
  par(mfrow = c(4,1),mar=c(4,0,0,2),oma=c(0.5,4,2.5,2.5))
  ymax = 0.002 * sample.in; ymin = 0.0; xmin = time.years.in[1]; xmax = time.years.in[length(time.years.in)]
  color_array = c('orange', 'green', 'blue', 'purple')
  ci_color = c(rgb(1,128/255,0,1/4), rgb(128/255,1,0,1/4), rgb(0,128/255,1,1/4), rgb(178/255,102/255,1,1/4))
  for(ss in 1:4){
    plot(time.years.in,human.foi.den.in[ss, ], type = "l", col = color_array[ss],xlim = c(xmin,xmax), 
         ylim = c(ymin, ymax), ylab = "FOI", xlab = "", axes = T, lwd = 2)
     polygon(c(time.years.in,rev(time.years.in)), c(high.foi.in[ss,], rev(low.foi.in[ss,])), col = ci_color[ss], border = NA)
    legend('topleft', c(sprintf("Denv%d",ss), 'data'), col = c(color_array[ss], 'black'), lwd = 2,bty = 'n')
    # ticks = seq(from = xmin, by = 1, to = xmax)
    lines(time.years.in, data.foi.in[ss, ], col = 'black',lwd = 3)
    yticks = seq(from = 0, by = 0.001, to = 0.005)
    # axis(1, at = ticks);axis(2);box()
    
    # par(new = T) #Susceptibles
    # plot(human.foi.sus.in[ss, ] / 200225,col = "gray", type = "l", axes = F, xlim = c(0,4800), ylim = c(0,1), ylab = "", xlab = "")
    # axis(side = 4)
  }
  
  mtext(text = title.in,side = 3, line = 0.5, outer = TRUE)
  if(!is.null(filename.in)){
    dev.off()
  }
}


plot_foi_CI = function(
  low.human.foi.in, high.human.foi.in, low.foi.in, high.foi.in, 
  time.years.in, sample.in = 7,  title.in = "FOI", filename.in = NULL){
  if(!is.null(filename.in)){
    pdf(filename.in,width=10,height=8)
  }
  par(mfrow = c(4,1),mar=c(4,0,0,2),oma=c(0.5,4,2.5,2.5))
  ymax = 1.3*max(high.human.foi.in); ymin = 0.0; xmin = time.years.in[1]; xmax = time.years.in[length(time.years.in)]
  color_array = c('orange', 'green', 'blue', 'purple')
  color_data_array = c('#FFCC9940', '#CCFF9940', '#99CCFF40', '#CC99FF40')
  ci_color = c(rgb(1,128/255,0,1/2), rgb(128/255,1,0,1/2), rgb(0,128/255,1,1/2), rgb(178/255,102/255,1,1/2))
  for(ss in 1:4){
    plot(time.years.in,rep(-1.0,length(time.years.in)),
         type = "l", col = color_array[ss],xlim = c(xmin,xmax),
         ylim = c(ymin, ymax), ylab = "", xlab = "", axes = F, lwd = 0)
    polygon(c(time.years.in,rev(time.years.in)), c(high.foi.in[ss,], rev(low.foi.in[ss,])), col = ci_color[ss], border = 1)
    polygon(c(time.years.in,rev(time.years.in)), c(high.human.foi.in[ss,], rev(low.human.foi.in[ss,])), col = rgb(0,0,0,1/2), border = 1)
    legend('topleft', c(sprintf("Empirically estimated DENV-%d FoI",ss),sprintf("Simulated DENV-%d FoI",ss)), col = c(color_array[ss],rgb(0,0,0,1/4)), pch = 15, pt.cex = 2, bty = 'n')
    # lines(time.years.in, high.human.foi.in[ss, ], col = color_array[ss],lwd = 3)
    yticks = seq(from = 0, by = 0.001, to = 0.005)
    axis(2)
    axis(1,at=as.Date(paste(2000:2011,'-01-01',sep='')),labels=as.character(2000:2011))
    if(ss==2){
      mtext('Monthly force of infection (FoI)',2,line=2.5,at=-.015)
    }
  }
  mtext('Year',1,line=2.8)
  
  if(!is.null(filename.in)){
    dev.off()
  }
}


plot_cases_mean = function(
  mean.human.foi.in, mean.foi.in, time.years.in, sample.in = 7, filename.in = NULL){
  if(!is.null(filename.in)){
    pdf(filename.in,width=10,height=8)
  }
  par(mfrow = c(4,1),mar=c(4,0,0,2),oma=c(0.5,4.5,2.5,2.5))
  color_array = c('orange', 'green', 'blue', 'purple')
  color_data_array = c('#FFCC9940', '#CCFF9940', '#99CCFF40', '#CC99FF40')
  ci_color = c(rgb(1,128/255,0,1/2), rgb(128/255,1,0,1/2), rgb(0,128/255,1,1/2), rgb(178/255,102/255,1,1/2))
  for(ss in 1:4){
    ymax = max(max(mean.human.foi.in[ss,]), mean.foi.in[ss,])
    plot(time.years.in,mean.human.foi.in[ss,], type = "l", col = color_array[ss], ylab = "Imported Cases", xlab = "", ylim = c(0,ymax),axes = F, lwd = 0)
    polygon(c(time.years.in,rev(time.years.in)), c(rep(0,length(mean.foi.in[ss,])), rev(mean.foi.in[ss,])), col = rgb(0,0,0,1/4), border = 1)
    polygon(c(time.years.in,rev(time.years.in)), c(mean.foi.in[ss,], rev(mean.human.foi.in[ss,])), col = ci_color[ss], border = 1)
    legend('topleft', c(sprintf("Autochthonous DENV-%d",ss),sprintf("Imported DENV-%d",ss)), col = c(color_array[ss],rgb(0,0,0,1/4)), pch = 15, pt.cex = 2, bty = 'n')
    yticks = seq(from = 0, by = 0.001, to = 0.005)
    axis(2)
    axis(1,at=as.Date(paste(2000:2011,'-01-01',sep='')),labels=as.character(2000:2011))
    if(ss==2){
      mtext('Monthly infections',2,line=3,at=-120)
    }
  }
  mtext('Year',1,line=2.8)
  
  if(!is.null(filename.in)){
    dev.off()
  }
}


plot_cases_CI = function(low.human.foi.in, high.human.foi.in, low.foi.in, high.foi.in, 
                       time.years.in, sample.in = 7, filename.in = NULL){
  if(!is.null(filename.in)){
    pdf(filename.in,width=10,height=8)
      # png(filename.in,width=960,height=480)
  }
  par(mfrow = c(4,1),mar=c(4,0,0,2),oma=c(0.5,4.5,2.5,2.5))
  # ymax = 0.002 * sample.in; ymin = 0.0; xmin = time.years.in[1]; xmax = time.years.in[length(time.years.in)]
  color_array = c('orange', 'green', 'blue', 'purple')
  color_data_array = c('#FFCC9940', '#CCFF9940', '#99CCFF40', '#CC99FF40')
  ci_color = c(rgb(1,128/255,0,1/2), rgb(128/255,1,0,1/2), rgb(0,128/255,1,1/2), rgb(178/255,102/255,1,1/2))
  for(ss in 1:4){
    plot(time.years.in,high.human.foi.in[ss,], type = "l", col = color_array[ss], ylab = "Imported Cases", xlab = "", axes = F, lwd = 0)
    polygon(c(time.years.in,rev(time.years.in)), c(high.human.foi.in[ss,], rev(low.human.foi.in[ss,])), col = ci_color[ss], border = 1)
    polygon(c(time.years.in,rev(time.years.in)), c(high.foi.in[ss,], rev(low.foi.in[ss,])), col = rgb(0,0,0,1/2), border = 1)
    legend('topleft', c(sprintf("DENV-%d",ss)), col = c(color_array[ss]), lwd = 2,bty = 'n')
    # lines(time.years.in, high.human.foi.in[ss, ], col = color_array[ss],lwd = 3)
    yticks = seq(from = 0, by = 0.001, to = 0.005)
    axis(2)
    axis(1,at=as.Date(paste(2000:2011,'-01-01',sep='')),labels=as.character(2000:2011))
  }
  
  if(!is.null(filename.in)){
    dev.off()
  }
}


plot_cases_sampled = function(low.human.foi.in, high.human.foi.in, time.years.in, sample.in = 7,  title.in = "FOI", filename.in = NULL){
  if(!is.null(filename.in)){
    png(filename.in,width=960,height=480)
  }
  par(mfrow = c(4,1),mar=c(4,0,0,2),oma=c(0.5,4,2.5,2.5))
  color_array = c('#FFCC9940', '#CCFF9940', '#99CCFF40', '#CC99FF40')
  for(ss in 1:4){
    # rep(-1.0,length(time.years.in))
    plot(time.years.in,high.human.foi.in[ss,], type = "l", col = color_array[ss], ylab = "Imported Cases", xlab = "", axes = T, lwd = 0)
    polygon(c(time.years.in,rev(time.years.in)), c(high.human.foi.in[ss,], rev(low.human.foi.in[ss,])), col = color_array[ss], border = color_array[ss])
    legend('topleft', c(sprintf("Denv%d",ss)), col = c(color_array[ss]), lwd = 2,bty = 'n')
  }
  
  mtext(text = title.in,side = 3, line = 0.5, outer = TRUE)
  if(!is.null(filename.in)){
    dev.off()
  }
}
