### Anything after a hash tag is treated as a comment
# Demo taken loosely from: https://en.wikipedia.org/wiki/R_(programming_language)


2+2  # R is an interpreted language: It does things as soon as told

2+2 /3 *18 - 243.123 
(2+2 /3 )*18 - 243.123           # R handles routine math, parentheses provide clarity

x <- c(1,2,3,4,5,6)   # Create ordered collection (vector)
x
sum(x)                # R hav a large number of built-in functions and commands
?sum                  # Help files are available for commands
y <- x^2              # Square the elements of x
print(y)              # print (vector) y
y                      # or just enter the variable name
edit(y)             # variables can be viewed/edited in a spreadsheet-like format

mean(y)               # Calculate average (arithmetic mean) of (vector) y; result is scalar

var(y)                # Calculate sample variance

my.table<- cbind( x,y)      # arange variables into columns
my.table
edit(my.table)
lm_1 <- lm(y ~ x)     # Fit a linear regression model "y = f(x)" or "y = B0 + (B1 * x)"
                        # store the results as lm_1
summary(lm_1)          # Compute and print statistics for the fit
                         # of the (linear model object) lm_1

plot(x,y)
lines(x,y)

par(mfrow=c(2, 2))     # Request 2x2 plot layout
 plot(lm_1)             # Diagnostic plot of regression model

lm_2<- lm(log(y) ~ log(x))
summary(lm_2)


library(caTools)         # external package providing write.gif function
jet.colors <- colorRampPalette(c("#00007F", "blue", "#007FFF", "cyan", "#7FFF7F",
                                 "yellow", "#FF7F00", "red", "#7F0000"))
m <- 1000                # define size
C <- complex( real=rep(seq(-1.8,0.6, length.out=m), each=m ),
              imag=rep(seq(-1.2,1.2, length.out=m), m ) )
C <- matrix(C,m,m)       # reshape as square matrix of complex numbers
Z <- 0                   # initialize Z to zero
X <- array(0, c(m,m,20)) # initialize output 3D array
for (k in 1:20) {        # loop with 20 iterations
  Z <- Z^2+C             # the central difference equation
  X[,,k] <- exp(-abs(Z)) # capture results
}
write.gif(X, "Mandelbrot.gif", col=jet.colors, delay=80)

