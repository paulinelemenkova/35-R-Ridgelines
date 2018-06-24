# library
library(ggridges)
library(ggplot2)

# ЧАСТЬ-1 для тектоники
# шаг-1. вчитываем таблицу. делаем датафрейм.
MDF <- read.csv("Morphology.csv", header=TRUE, sep = ",")
MDF <- na.omit(MDF) 
row.has.na <- apply(MDF, 1, function(x){any(is.na(x))}) 
sum(row.has.na) 
head(MDF)

# шаг-2. сшиваем столбцы по категориям (тектоника: 4 плиты)
MDTt = melt(setDT(MDF), measure = patterns("^plate"), value.name = c("tectonics"))
head(MDTt)
levels(MDTt$variable) = c("Philippine Plate" , "Pacific Plate", "Mariana Plate", "Caroline Plate")
head(MDTt)

# шаг-3. делаем короткий датафрейм из 2-х нужных категорий: названия 4 плит и значения точек по каждой
dat <- data.frame(group = MDTt$variable,
                  pweight = MDTt$tectonics,
                  tectonics = MDTt$tectonics)

# шаг-4. делаем график с гребешками
ggplot(dat, aes(x = tectonics, y = group, fill = group)) + 
	geom_density_ridges(scale = .95, jittered_points=TRUE, rel_min_height = .01,
                      point_shape = "|", point_size = 3, size = 0.25,
                      position = position_points_jitter(height = 0)) +
	scale_fill_manual(values = c("lightsteelblue1", "plum1", "turquoise1", "lightgoldenrod1")) +
	theme_ridges() +
	theme(legend.position = "none",
	plot.title = element_text(family = "Times New Roman", face = 2, size = 12),
	plot.subtitle = element_text(family = "Times New Roman", face = 1, size = 12),
	axis.title.y = element_text(family = "Times New Roman", face = 1, size = 12),
    axis.title.x = element_text(family = "Times New Roman", face = 1, size = 12),
    axis.text.x = element_text(family = "Times New Roman", face = 3, size = 12),
    axis.text.y = element_text(family = "Times New Roman", face = 3, size = 12)) +
	labs(title = 'Mariana Trench',
       subtitle = 'Ridgeline Plot on Tectonics: Density Distribution of the Observation Points by Plates') 


# ЧАСТЬ-2 для глубин
# шаг-1. вчитываем таблицу. делаем датафрейм.
MDD <- read.csv("Depths.csv", header=TRUE, sep = ",")
MDD <- na.omit(MDD) 
row.has.na <- apply(MDD, 1, function(x){any(is.na(x))}) 
sum(row.has.na) 
head(MDD)

# шаг-2. сшиваем столбцы по категориям (тектоника: 4 плиты)
MDDl = melt(setDT(MDD), measure = patterns("^profile"), value.name = c("depth"))
head(MDDl)

# шаг-3. делаем короткий датафрейм из 2-х нужных категорий: названия 4 плит и значения точек по каждой
dat <- data.frame(group = MDDl$variable,
                  pweight = MDDl$depth,
                  depth = MDDl$depth)
 
# шаг-4. делаем график с гребешками
ggplot(dat, aes(x = depth, y = group, fill = group)) + 
	geom_density_ridges(scale = 0.95, jittered_points=FALSE, color = "blue", size = 0.2) +
	labs(title = 'Mariana Trench',
       subtitle = 'Ridgeline Plot on Bathymetry: Density Distribution of Depth Observation Points') +
       scale_fill_viridis(discrete = T, option = "B", direction = -1, begin = .1, end = .9)+
    theme_ridges() +
    theme(legend.position = "none",
	plot.title = element_text(family = "Times New Roman", face = 2, size = 12),
	plot.subtitle = element_text(family = "Times New Roman", face = 1, size = 12),
	axis.title.y = element_text(family = "Times New Roman", face = 1, size = 12),
    axis.title.x = element_text(family = "Times New Roman", face = 1, size = 12),
    axis.text.x = element_text(family = "Times New Roman", face = 3, size = 10),
    axis.text.y = element_text(family = "Times New Roman", face = 3, size = 10))
    
    
    
