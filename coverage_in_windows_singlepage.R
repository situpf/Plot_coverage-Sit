# setwd("/homes/users/mtormo/scratch/test_rscript_coverage")
# win <- "5k"
# filein <- "basecall_trimmed_sort_primary.mosdepth5k.regions.bed.regions.bed"

args <- commandArgs(trailingOnly=TRUE) #collect data from arguments
win <- args[1]
filein <- args[2]

cov <- read.table(filein, header = F, sep = "\t")
colnames(cov) <- c("chr","start","end","value")
# head(cov)

total_chr <- levels(cov$chr)
total_chr <- c(1:22,"X","Y","MT")
max_length <- max(cov$end)

pdf(sprintf("test_%s_singlepage.pdf",win), width = 15, height = 125)
par(mfrow=c(25,1))
for (i in total_chr){
  print(i)
  plot(cov[cov[1] == i,2], cov[cov[1] == i,4], type = "l",xlab = sprintf("position Chr%s",i),ylab = "coverage", xlim = c(0,max_length), ylim = c(0,50), frame.plot = FALSE, col = "blue", 
       main = sprintf("Mean coverage across Chromosomes. %s windows",win))
}
dev.off()
