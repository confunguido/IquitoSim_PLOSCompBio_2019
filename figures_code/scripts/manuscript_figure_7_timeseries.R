#======================================================================================#
# Author: Guido España
# analyze output of parameter sweep of vaccine properties
# project: PLOS COMP BIO paper 2019 Iquitos
# Year: 2019
#
#======================================================================================#
# User's input--------
#======================================================================================#
rm(list = ls())

library(stats)
library(graphics)

resample_incidence_array = function(x.in, sample.in){
  t.temp = 1:length(x.in)
  t.sample = ceiling(t.temp / sample.in)
  x.sample = array(data = 0, dim = max(t.sample))
  for(i in 1:length(x.sample)){
    x.sample[i] = sum(x.in[which(t.sample == i)],na.rm = T)
  }
  return(x.sample)
}

load('./data_figure_7_timeseries.RData')
#======================================================================================#
# Make some plots --------
#======================================================================================#
pdf('../output/figure_07_PLOS_COMP_BIO_vaccine_timeseries.pdf',width=6.5,height=6.5)
layout(
    rbind(
      cbind(matrix(c(1,2,3),3,1,byrow = T), matrix(c(1,2,3),3,1,byrow = T) + 3),
      cbind(matrix(c(1,2,3),3,1,byrow = T) + 6, matrix(c(1,2,3),3,1,byrow = T) + 9)
      )
)

par(oma = c(3,4,2,1), mar = c(0.5,0.5,0,0.5))

xtic_array = seq(from = 1, by = 130, to = 400)
Dates = seq(as.Date("2000-01-01"), by = "1 month", length.out = 378)
Dates = substring(Dates,1,4)
Dates = c("-10", "0","10", "20")
# first plot p > 0.95
for(ii in 1:3){
  if(ii == 2){
    par(mar = c(0.5,0.5,0,0.5))
  }
  a = filtered_high_p_foi_data[['novax']][[ii]]
  b = filtered_high_p_foi_data[['vax']][[ii]] 
  a = resample_incidence_array(a$Infectious_1 + a$Infectious_2 + a$Infectious_3 + a$Infectious_4,30)
  b = resample_incidence_array(b$Infectious_1 + b$Infectious_2 + b$Infectious_3 + b$Infectious_4,30)
  plot(a, type = "l", ylab = "", xlab = "", xaxs='i', xaxt = 'n', ylim = c(0,1200*30))
  polygon(c(0,130,130,0),c(0,0,1200*30,1200*30),col = rgb(0,0,0,0.15), border = 0)
  lines(130:length(b),b[130:length(b)], col = "green")
  if(ii == 2){
    mtext("Monthly incidence of infection", 2, line = 2.5, outer = F)
  }
  if(ii== 1){
    mtext('VE from protection against infection', side = 3, line = 0.5)
  }
  if(ii == 1){
    text(0,0.92*1200*30,'(a)',pos=4)
  }else if(ii == 2){
    text(0,0.92*1200*30,'(b)',pos=4)
  }else{
    text(0,0.92*1200*30,'(c)',pos=4)
  }
}

par(mar = c(0.5,1,0,0))

# Then plot p < 0.05
for(ii in 1:3){
  if(ii == 2){
    par(mar = c(0.5,1,0,0))
  }
  a = filtered_low_p_foi_data[['novax']][[ii]]
  b = filtered_low_p_foi_data[['vax']][[ii]]
  a = resample_incidence_array(a$Infectious_1 + a$Infectious_2 + a$Infectious_3 + a$Infectious_4,30)
  b = resample_incidence_array(b$Infectious_1 + b$Infectious_2 + b$Infectious_3 + b$Infectious_4,30)
  plot(a, type = "l", ylab = "", xlab = "", xaxs='i', xaxt = 'n', yaxt = 'n',ylim = c(0,1200*30))
  polygon(c(0,130,130,0),c(0,0,1200*30,1200*30),col = rgb(0,0,0,0.15), border = 0)
  lines(130:length(b),b[130:length(b)], col = "green")

  if(ii== 1){
    # axis(side = 4)
    mtext('VE from protection against disease', side = 3, line = 0.5)
  }
  if(ii == 1){
    text(0,0.92*1200*30,'(g)',pos=4)
  }else if(ii == 2){
    text(0,0.92*1200*30,'(h)',pos=4)
  }else{
    text(0,0.92*1200*30,'(i)',pos=4)
  }
}

par(mar = c(0.5,0.5,1,0.5))

# first plot disease for p > 0.95
for(ii in 1:3){
  if(ii == 2){
    par(mar = c(0.5,0.5,0,0.5))
  }
  a = filtered_high_p_pop_data[['novax']][[ii]]
  b = filtered_high_p_pop_data[['vax']][[ii]]
  a = resample_incidence_array(a$all_dis,30)
  b = resample_incidence_array(b$all_dis,30)
  plot(a, type = "l", ylab = "", xlab = "", xaxs='i', xaxt = 'n', ylim = c(0,300*30))
  polygon(c(0,130,130,0),c(0,0,300*30,300*30),col = rgb(0,0,0,0.15), border = 0)
  lines(130:length(b),b[130:length(b)], col = "green")
  if(ii == 2){
    mtext("Monthly incidence of disease", 2, line = 2.5, outer = F)    
  }
  if(ii ==3){
    axis(side = 1, at = xtic_array, labels = Dates)
  }
  if(ii == 1){
    text(0,0.92*300*30,'(d)',pos=4)
  }else if(ii == 2){
    text(0,0.92*300*30,'(e)',pos=4)
  }else{
    text(0,0.92*300*30,'(f)',pos=4)
  }
}

par(mar = c(0.5,1,1,0))

# last plot disease for p < 0.05
for(ii in 1:3){
  if(ii == 2){
    par(mar = c(0.5,1,0,0))
  }
  a = filtered_low_p_pop_data[['novax']][[ii]]
  b = filtered_low_p_pop_data[['vax']][[ii]]
  a = resample_incidence_array(a$all_dis,30)
  b = resample_incidence_array(b$all_dis,30)
  
  plot(a, type = "l", ylab = "", xlab = "", xaxs='i', xaxt = 'n', yaxt = 'n', ylim = c(0,300*30))
  polygon(c(0,130,130,0),c(0,0,300*30,300*30),col = rgb(0,0,0,0.15), border = 0)
  lines(130:length(b),b[130:length(b)], col = "green")
  if(ii == 3){
    axis(side = 1, at = xtic_array, labels = Dates)
  }
  if(ii == 1){
    text(0,0.92*300*30,'(j)',pos=4)
  }else if(ii == 2){
    text(0,0.92*300*30,'(k)',pos=4)
  }else{
    text(0,0.92*300*30,'(l)',pos=4)
  }
}
mtext("Years since vaccination", side = 1, line = 2, outer = T)
dev.off()
