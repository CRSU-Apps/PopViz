library(hershey)
library(readtext)
library(ggplot2)
library(ggsvg)
library(glue)

letter <- hershey[hershey$char == 'Z' & hershey$font == 'scriptc',]

svg_text <- .GetSvgText(filename="eyes.svg", colour="#45b6ff", start_proportion = 0.35, end_proportion = 0.65)
svg_text <- .GetSvgText(filename="svgs/person-super-narrow.svg", colour="#45b6ff")
options(repr.plot.width = 5, repr.plot.height =2)
ggplot(letter) +
  geom_point_svg(
    mapping  = aes(x, y),
    svg      = svg_text,
    # size     = 10 * 0.3
    # size     = 10
    svg_width = 100
  ) +
  geom_point(mapping  = aes(x, y))