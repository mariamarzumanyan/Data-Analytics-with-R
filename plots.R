#Scatter Plots

# Add a smooth trend line  
ggplot(data, aes(x , y)) +
  geom_point() +
  geom_smooth()

#Use stat_smooth() instead of geom_smooth()
ggplot(data, aes(x , y )) +
  geom_point() +
  stat_smooth(method = "lm", se = FALSE)
  

#Specific quantiles can be specified
ggplot(data, aes(x , y)) +
  geom_jitter(alpha = 0.25) +
  # Add a quantile stat, at 0.05, 0.5, and 0.95
  stat_quantile(quantiles = c(0.05, 0.5, 0.95))+
  # Add a summary stat of normal confidence limits
  stat_summary(fun.data = mean_cl_normal, position = posn_d)

#Fit the linear regression
ggplot(data, aes(x , y , color = category)) +
  geom_jitter() +
  geom_smooth(method = "lm", se = FALSE) +
  # Fix the coordinate ratio
  coord_fixed()+ 
  # Turn clipping off
  coord_cartesian(expand = 0, clip = "off") +
  theme_classic() +
  # Remove axis lines
  theme(axis.line = element_blank())

# Update the plot
ggplot(data, aes(x , y , color = category, size = disp)) +
  geom_point() +
  scale_color_brewer(palette = "Paired") +
  # Grid facet on gear and vs
  facet_grid(rows = vars(gear), cols = vars(vs))

# Bar Plots
# Plot x vs. y
ggplot(data, aes(x , y)) +
  # Add a bar summary stat of means, colored skyblue
  stat_summary(fun.y = mean, geom = "bar", fill = "skyblue") +
  # Add an errorbar summary stat std deviation limits
  stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), geom = "errorbar", width = 0.1)
  
# Define a dodge position object with width 0.9
posn_d <- position_dodge(width = 0.9)

# For each summary stat, update the position to posn_d
ggplot(data, aes(x, y, color = year, fill = year)) +
  stat_summary(fun.y = mean, geom = "bar", position = posn_d, alpha = 0.5) +
  stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), geom = "errorbar", position = posn_d, width = 0.1)
  
  # Heatmaps
  # A palette of 9 reds
red_brewer_palette <- brewer.pal(9, "Reds")

# Update the plot
ggplot(data, aes(x , y , fill = year)) +
  geom_tile() +
  facet_wrap(facets = vars(site), ncol = 1) +
  # Update scale to use n-colors from red_brewer_palette
  scale_fill_gradientn(colors = red_brewer_palette)
  
  # Using data, plot x vs. y, colored, grouped, and filled by year
ggplot(data, aes(x , y , color = year, group= year, fill = year)) +
  # Add a line summary stat aggregated by mean
  stat_summary(fun.y = mean, geom = "line") +
  # Add a ribbon summary stat with 10% opacity, no color
  stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), geom = "ribbon", alpha = 0.1, color = NA)
  
  
