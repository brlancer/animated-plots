# Animated Charts

# This script generates data and plots that data and 
# strings together the plots to make animated gifs

# PLOT 1 - Distribution elevator

# Process
# Initiate parameters
      # Mean
      # Variance
# Loop
      # Generate random data (pnorm)
            # Increment mean
            # Increment variance?
      # Generate plots
            # Marginal distribution
            # Violin plot?

library(ggplot2)

sd1 <- 5
sd2 <- 5
n1 <- 0
n2 <- 0

for(i in 1:100)
{
      if(i < 50)
      {
            n1 <- n1 + 1800
            sd1 <- sd1 + 0.1
      } else
      {
            n1 <- n1 + 1800
            sd1 <- sd1 + 0.1
            n2 <- n2 + 1800
            sd2 <- sd2 + 0.1
      }
      
      dat <- data.frame(x = c(rnorm(n1, sd = sd1), rnorm(n2, sd = sd2)), y = c(rep(c("a","b"), times = c(n1,n2))))
      
      p <- ggplot(dat,aes(x=x)) + 
            geom_histogram(data=subset(dat, y == 'a'), fill = "black", binwidth = 0.5) +
            geom_histogram(data=subset(dat, y == 'b'), fill = "white", binwidth = 0.5) +
            coord_cartesian(xlim = c(-10, 10), ylim = c(0, 1000)) + 
            theme_minimal() + 
            theme(
                  line = element_line(colour = "white", 
                                      size = 0, 
                                      linetype = 1),
                  
                  axis.line = element_blank(),
                  axis.text = element_blank(),
                  axis.title = element_blank(),
                  axis.ticks = element_blank(),
                  
                  panel.background = element_rect(fill = "white", size = 0),
                  panel.border = element_blank(),
                  panel.grid.major = element_blank(),
                  panel.grid.minor = element_blank()
            )
      
      name <- "FourthTry"
      frame <- i
      
      ggsave(paste0("fig/",name,frame,".png"))
}

