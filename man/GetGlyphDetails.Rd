% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GetGlyphDetails.R
\name{GetGlyphDetails}
\alias{GetGlyphDetails}
\title{Get the glyph details based on the number of people on the plot.}
\usage{
GetGlyphDetails(
  glyph_count,
  glyph = NULL,
  glyph_size = NULL,
  glyph_resolution = NULL
)
}
\arguments{
\item{glyph_count}{The number of glyphs on the plot}

\item{glyph}{Name of builtin glyph, or filepath to `.svg` file. Defaults to NULL, where the glyph will be chosen based on `glyph_count`
Builtin glyphs:
- "person"
- "person-narrow"
- "person-super-narrow"
- "person-dress"
- "person-dress-narrow"
- "person-dress-super-narrow"}

\item{glyph_size}{Size of the glyph to render. It is related to the size of the used `.svg` file.
Defaults to NULL where the size is chosen based on `glyph`}

\item{glyph_resolution}{Resolution of the glyph to render.
Defaults to NULL where the resolution is chosen based on `glyph`}
}
\value{
List containing:
- "filename": The path to the glyph file
- "size": the size of the glyph to be rendered
- "resolution": The resolution of each glyph
}
\description{
Get the glyph details based on the number of people on the plot.
}
