#======================================================================================#
# Author: Guido Espana
# analyze output of parameter sweep for  the calibration 
# project: PLOS COMP BIO paper 2016 Iquitos
# Year: 2016
# 
# requires:
#          ./sweep_plot_functions.R
#          ./sweep_analysis_functions.R
#          ./Iquitos_foi.RData
#======================================================================================#
# User's input--------
#======================================================================================#
rm(list = ls())
library(stats)
library(MCMCpack)
library(MASS)

# source necessary files
source('./sweep_plot_functions.R')
source('./sweep_analysis_functions.R')

load("./Iquitos_foi.RData")# should have time.last
load("../../inputs/Iquitos_inf.RData")# should have time.last
#======================================================================================#
# Read parameters------------
#======================================================================================#
n.years = "final_2"
subdir_list =  c("sir_asymp_0.5_immunity_exp_686", "sir_bite_0.5_immunity_exp_686", 
                 "sir_bite_2.0_immunity_exp_686", "sir_death_0.5_immunity_exp_686", 
                 "sir_death_2.0_immunity_exp_686","sir_eip_0.5_immunity_exp_686", 
                 "sir_eip_2.0_immunity_exp_686","sir_immunity_exp_180",
                 "sir_p_0.5_immunity_exp_686", "sir_pmove_0.1_immunity_exp_686", 
                 "sir_pmove_0.5_immunity_exp_686", "sir_immunity_fixed_686")
subdir_ind = 1
subdir = subdir_list[subdir_ind]

load(sprintf('./data_%s.RData',subdir))
color_array = c('orange', 'green', 'blue', 'purple')
color_data_array = c('#FFCC9940', '#CCFF9940', '#99CCFF40', '#CC99FF40')
color_mean_array = c('#FFCC99', '#CCFF99', '#99CCFF', '#CC99FF')
ci_color = c(rgb(1,128/255,0,1/2), rgb(128/255,1,0,1/2), rgb(0,128/255,1,1/2), rgb(178/255,102/255,1,1/2))
save_fig = T

#======================================================================================#
# Create some plots... PLOT INF dI/dt---------#
#======================================================================================#
filename = sprintf("../output/FigureS11-22_PLOS_CMP_BIO_supplement_PSA_%s.pdf",subdir)
if(save_fig == TRUE){ pdf(filename,width=10,height=8)}
par(mfrow = c(4,1),mar=c(4,0,0,2),oma=c(0.5,5,2.5,1.5))
ymax = 1.3*max(den.foi.high.sampled)
for(ss in 1:4){
  ymax = 1.3*max(max(infprop.high.sampled[ss,]),max(high.inf.sampled[ss,]))
  plot(Dates[time.sampled],rep(-1.0,length(Dates[time.sampled])), type = "l", col = color_array[ss],
       ylim = c(0, ymax),ylab = "", xlab = "", axes = F, lwd = 0)
  polygon(c(Dates[time.sampled],rev(Dates[time.sampled])), c(high.inf.sampled[ss,], rev(low.inf.sampled[ss,])), col = '#00000050', border = 1)
  polygon(c(Dates[time.sampled],rev(Dates[time.sampled])), c(infprop.high.sampled[ss,], rev(infprop.low.sampled[ss,])), col = ci_color[ss], border = 1)
  legend('topleft', c(sprintf("Empirically estimated DENV-%d incidence",ss),sprintf("Simulated DENV-%d incidence",ss)), 
         col = c( '#00000050',color_array[ss]), pch = 15, pt.cex = 2, bty = 'n')
  yticks = seq(from = 0, by = 0.001, to = 0.005)
  axis(2)
  axis(1,at=as.Date(paste(2000:2011,'-01-01',sep='')),labels=as.character(2000:2011))
  mtext('Monthly incidence of DENV infection per capita', side = 2, line = 3, outer = T)
}
mtext('Year',1,line=2.8)
if(save_fig == TRUE){dev.off()}



