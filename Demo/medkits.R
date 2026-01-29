library(extrafont)

waffle(
  parts = parts / 10, 
  rows = 3, 
  colors = c("#969696", "#1879bf", "#009bda"),
  use_glyph = "medkit", 
  size = 8
) + 
  expand_limits(
    y = c(0, 4)
  )