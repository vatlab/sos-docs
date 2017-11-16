data = read.csv('DEG_list.csv')
pdf('result.pdf')
plot(data$log2FoldChange, data$stat)
dev.off()
