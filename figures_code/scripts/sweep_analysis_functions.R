square_error = function(x,y){
  rmse = sum((x - y)^2)
}

square_error_ci = function(x,y,y.low,y.high){
  rmse.total = 0
  for(n in 1:length(x)){
    if(!is.na(x) && !is.na(y[n]) && !is.na(y.high[n]) && !is.na(y.low[n])){
      rmse = (x[n] - y[n])^2
      rmse.low = (x[n] - y.low[n])^2
      rmse.high = (x[n] - y.high[n])^2
      rmse.total = rmse.total + min(c(rmse,rmse.low,rmse.high))
    }
  }
  return(rmse.total)
}


get_log2_lik = function(x.in, prob_gam.in, sample_in, mean_in, print.time = FALSE){
  LL = 0
  if(print.time){ptm = proc.time()}
  if(length(x.in) > 1){
    for(i in 1:length(x.in)){
      # print(i)
      p = 3.25918e-07 * sample_in
      if(x.in[i] > 0){
        p = x.in[i]
      }
      p_v = floor(p / prob_gam.in[i, 3]) * prob_gam.in[i, 3] 
      if(p_v == 0){p_v = p}
      tmpLL = log(diff(exp(pgamma(c(p_v - prob_gam.in[i, 3], p_v + prob_gam.in[i, 3]),prob_gam.in[i, 1],prob_gam.in[i, 2], log = T))))
      if(tmpLL == -Inf){tmpLL = -11}
      LL = LL + tmpLL 
    }
  }else{
    p = 3.25918e-07 * sample_in
    if(x.in > 0){
      p = x.in
    }
    p_v = floor(p/prob_gam.in[3]) * prob_gam.in[3] 
    if(p_v == 0){p_v = p}
    tmpLL = log(diff(exp(pgamma(c(p_v - prob_gam.in[i, 3], p_v + prob_gam.in[i, 3]),prob_gam.in[1],prob_gam.in[2],log = T))))
    if(tmpLL == -Inf){tmpLL = -11}
    LL = LL + tmpLL
  }
  if(print.time){print(proc.time() - ptm)}
  return(LL)
}


get_loglik_prop = function(x.in, prop.in, params.in){
  if(length(x.in) > 1){
    prop.in[which(is.na(prop.in))] = 0.0
    prop.in[which(rowSums(prop.in) == 0),] = 0.25
    LL =  sum(sapply(1:length(x.in), function(x) {
      dnorm(x.in[x],params.in$mu[x],params.in$sd[x],log = T) 
      }))
    LLp = sum(sapply(1:length(x.in), function(x) {
      if(x.in[x] > 0.005){
        log(ddirichlet(prop.in[x,] * 0.68 + 0.08,as.numeric(params.in[x,sprintf('alpha%d',1:4)])))  
      }else{
        0
      }
      
    }))
    # print(sprintf("%.2f,%.2f",LL,LLp))
    return(LL*1 + LLp*1)
  }else{
    return(0)  
  }
}

get_loglik_prop_anual = function(x.in, prop.in, params.in,x.anual,params.anual){
  if(length(x.in) > 1){
    prop.in[which(is.na(prop.in))] = 0.0
    prop.in[which(rowSums(prop.in) == 0),] = 0.25
    LL =  sum(sapply(1:length(x.in), function(x) {
      dnorm(x.in[x],params.in$mu[x],params.in$sd[x],log = T) 
    }))
    LLp = sum(sapply(1:length(x.anual), function(x) {
      if(x.anual[x] > 0.03){
        log(ddirichlet(prop.in[x,] * 0.96 + 0.01,as.numeric(params.anual[x,sprintf('alpha%d',1:4)])))  
      }else{
        0
      }
      
    }))
    # print(sprintf("%.2f,%.2f",LL,LLp))
    return(LL*0.8 + LLp*0.2)
  }else{
    return(0)  
  }
}


get_log_lik_R0 = function(x.in, r_median_in, sample_in){
  LL = 0
  if(length(x.in) > 1){
    for(i in 1:length(x.in)){
      p = x.in[i]
      tmpLL = log(diff(exp(pnorm(c(p - 0.01,p + 0.01),mean = r_median_in[i],sd = 0.5,log = T))))
      if(tmpLL == -Inf){tmpLL = -11}
      LL = LL + tmpLL
    }
  }else{
    p = x.in
    tmpLL = log(diff(exp(pnorm(c(p - 0.01,p + 0.01),mean = r_median_in,sd = 0.5,log = T))))
    if(tmpLL == -Inf){tmpLL = -11}
    LL = LL + tmpLL
  }
  return(LL)
}

get_foi_theo = function(posterior.in){
  temp.ci_low = array(NA, dim(posterior.in)[1])
  temp.ci_high = array(NA, dim(posterior.in)[1])
  temp.median = array(NA, dim(posterior.in)[1])
  
  for(i in 1:length(temp.ci_low)){
    temp.sort = sort(posterior.in[i, ])
    if(ncol(temp.sort)){
      temp.ci_low[i] = temp.sort[[ceiling(length(temp.sort) * 0.025)]]
      temp.ci_high[i] = temp.sort[[ceiling(length(temp.sort) * 0.975)]]
      temp.median[i] = median(as.matrix(posterior.in[i,]))
    }
  }
  return(list(median = temp.median, low = temp.ci_low, high = temp.ci_high))
}

get_foi_CI = function(posterior.in){
  # dimensions: 1->time, 2-> posterior
  temp.ci_low = array(NA, dim(posterior.in)[1])
  temp.ci_high = array(NA, dim(posterior.in)[1])
  temp.median = array(NA, dim(posterior.in)[1])
  temp.mean = array(NA, dim(posterior.in)[1])
  
  for(i in 1:length(temp.ci_low)){
    temp.sort = sort(posterior.in[i, ])
    if(length(temp.sort) == dim(posterior.in)[2]){
      temp.ci_low[i] = temp.sort[[ceiling(length(temp.sort) * 0.025)]]
      temp.ci_high[i] = temp.sort[[ceiling(length(temp.sort) * 0.975)]]
      temp.median[i] = median(as.matrix(posterior.in[i,]))
      temp.mean[i] = mean(as.matrix(posterior.in[i,]))
    }
  }
  return(list(median = temp.median,mean = temp.mean, low = temp.ci_low, high = temp.ci_high))
}

resample_incidence_array = function(x.in, sample.in){
  t.temp = 1:length(x.in)
  t.sample = ceiling(t.temp / sample.in)
  x.sample = array(data = 0, dim = max(t.sample))
  for(i in 1:length(x.sample)){
    x.sample[i] = sum(x.in[which(t.sample == i)],na.rm = T)
  }
  return(x.sample)
}

resample_avg_array = function(x.in, sample.in){
  t.temp = 1:length(x.in)
  t.sample = ceiling(t.temp / sample.in)
  x.sample = array(data = 0, dim = max(t.sample))
  for(i in 1:length(x.sample)){
    x.sample[i] = sum(x.in[which(t.sample == i)],na.rm = T) / length(which(t.sample == i))
  }
  return(x.sample)
}

resample_array = function(t.in, sample.in){
  t.sampled = t.in[seq(from = 1, by = sample.in, to = length(t.in))]
}

