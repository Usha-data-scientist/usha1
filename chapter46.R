46.HOW TO INTEGRATE R WITH PHP

x <- rnorm(6,0,1)
png(filename="test.png", width=500, height=500)
hist(x, col="red")
dev.off()
args <- commandArgs(TRUE)
cols <- args[1]
fname <- args[2]
x <- rnorm(cols,0,1)
fname = paste(fname, "png", sep = ".")
png(filename=fname, width=500, height=500)
hist(x, col="red") dev.off()
