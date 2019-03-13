##################################################
## title: make-shot-charts
## description: to do with the creation of shot charts
## input: shots dataframe
## output: visual shot charts
##################################################

library(jpeg)
library(grid)
library(ggplot2)
library(ploty)
# court image (to be used as background of plot)
getwd()
court_file <- "./images/nba-court.jpg"
# create raste object
court_image <- rasterGrob(readJPEG(court_file), width = unit(1, "npc"), height = unit(1, "npc"))
# shot chart with court background
klay_shot_chart <- ggplot(data = klay) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Klay Thompson (2016 season)') + theme_minimal()

# 4.1) Shot charts of each player
pdf("./images/andre-iguodala-shot-chart.pdf", width=6.5, height=5)
ggplot(data = andre) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Klay Thompson (2016 season)') + theme_minimal()
dev.off()
pdf("./images/draymond-green-shot-chart.pdf", width=6.5, height=5)
ggplot(data = draymond) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Klay Thompson (2016 season)') + theme_minimal()
dev.off()
pdf("./images/kevin-durant-shot-chart.pdf", width=6.5, height=5)
ggplot(data = kevin) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Klay Thompson (2016 season)') + theme_minimal()
dev.off()
pdf("./images/klay-thompson-shot-chart.pdf", width=6.5, height=5)
ggplot(data = klay) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Klay Thompson (2016 season)') + theme_minimal()
dev.off()
pdf("./images/stephen-curry-shot-chart.pdf", width=6.5, height=5)
ggplot(data = stephen) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Klay Thompson (2016 season)') + theme_minimal()
dev.off()

# 4.2) Facetted Shot Chart
pdf("./images/gsw-shot-charts.pdf", width=8, height=7)
ggplot(data = assemble) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Charts: GSW (2016 season)') + theme_minimal() + facet_wrap(~name)
dev.off()

png("./images/gsw-shot-charts.png", width=8, height=7, bg="transparent")
ggplot(data = assemble) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Charts: GSW (2016 season)') + theme_minimal() + facet_wrap(~name)
dev.off()