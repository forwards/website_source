# code contributed by Paul Murrell to convert R logo to Forwards logo

# grConvert 0.1-0
# https://sjp.co.nz/projects/grconvert/
library(grConvert)
convertPicture("Rlogo.svg", "Rlogo-cairo.svg")

# grImport2 0.1-3
# https://sjp.co.nz/projects/grimport2/
library(grImport2)
Rlogo <- readPicture("Rlogo-cairo.svg")

# Nothing visible
library(grid)
# grid.newpage()
grid.rect(gp=gpar(col=NA, fill="grey80"))
grid.picture(Rlogo)

# With gridSVG 1.5-1
# install.packages("gridSVG", repos="http://R-Forge.R-project.org")
library(gridSVG)
gridsvg("Rlogo-gridSVG.svg")
grid.picture(Rlogo, ext="gridSVG")
dev.off()

# Figure out which path is the "R"
grid.ls()
paths <- grid.grep(gPath("gTree", "gTree", "picComplexPath"),
                   grep=TRUE, global=TRUE, strict=TRUE)
grid.edit(paths[[1]], gp=gpar(col="black"))
grid.edit(paths[[2]], gp=gpar(col="red"))

# Modify the "R" fill with "magma" colour scheme from 'viridis'
library(viridis)
# Generate N colors for the gradient fill
cols <- magma(10)
fill <- linearGradient(cols, x0=.5, x1=.5)
gridSVG.newpage()
grid.picture(Rlogo, ext="gridSVG")
paths <- grid.grep(gPath("gTree", "gTree", "picComplexPath"),
                   grep=TRUE, global=TRUE, strict=TRUE)
grid.gradientFill(paths[[2]], fill)
grid.export("RForwardsLogo-gridSVG.svg")

# white version
gridSVG.newpage()
grid.rect(gp=gpar(col=NA, fill="white"))
grid.picture(Rlogo, ext="gridSVG")
paths <- grid.grep(gPath("gTree", "gTree", "picComplexPath"),
                   grep=TRUE, global=TRUE, strict=TRUE)
grid.gradientFill(paths[[2]], fill)
grid.export("RForwardsLogo-gridSVG-white.svg")

# Adding the "FORWARDS"
# First draw the label using (Cairo) SVG device, so we can capture
# it as a shape
# font <- "Ubuntu Medium"
# Work in Cairo PDF device so get consistent results (even in RStudio!)
cairo_pdf("temp.pdf")
# Ensure display list is on
dev.control("enable")
font <- "Open Sans Extrabold"
# gridSVG.newpage()
# Control size and shape of logo a bit more carefully, so we can
# accurately position label with logo
bounds <- Rlogo@summary
ratio <- bounds@yscale[1]/bounds@xscale[2]
# Also drop the margin to make calculations easier
grid.picture(Rlogo, expansion=0,
             width=1, height=ratio, y=1, just="top", ext="gridSVG")
paths <- grid.grep(gPath("gTree", "gTree", "picComplexPath"),
                   grep=TRUE, global=TRUE, strict=TRUE)
# How big should the text be?
devWidth <- par("din")[1]
w <- convertWidth(grobWidth(textGrob("FORWARDS",
                                     gp=gpar(fontfamily=font,
                                             fontface="bold"))),
                  "inches", valueOnly=TRUE)
scale <- devWidth/w
# Where should the text be?
y <- convertY(grobY(nullGrob(y=0, vp="picture.shape::picture.scale"), 270),
              "inches")
grid.text("FORWARDS",
          y=y - unit(5, "mm"), just="top",
          gp=gpar(fontfamily=font, col="#8f8f96", cex=scale))
# Get rid of the logo for this bit
grid.remove("import", grep=TRUE)
dev.copy(svg, "RForwards-label.svg", bg="transparent")
dev.off() # Cairo SVG device
dev.off() # Cairo PDF device
# Import label back in (as shape)
label <- readPicture("RForwards-label.svg")
gridSVG.newpage()
grid.picture(Rlogo, expansion=0,
             width=1, height=ratio, y=1, just="top", ext="gridSVG")
paths <- grid.grep(gPath("gTree", "gTree", "picComplexPath"),
                   grep=TRUE, global=TRUE, strict=TRUE)
grid.gradientFill(paths[[2]], fill)
grid.picture(label, expansion=0, name="label")
# Subtle gradient on the label
labelFill <- linearGradient(c(rgb(203,206,208,max=255),
                              rgb(132,131,139,max=255)),
                            y0=1, y1=0,
                            gradientUnits="coords")
registerGradientFill("greyscale", labelFill)
letters <- grid.grep(gPath("label", "gTree", "gTree",
                           "picComplexPath", "picPath"),
                     grep=TRUE, global=TRUE)
for (i in seq_along(letters)) {
    grid.gradientFill(letters[[i]], label="greyscale")
}
grid.export("forwards.svg")

# extra code to create favicon
library(rsvg)
rsvg_png("RForwardsLogo-gridSVG-white.svg", "../favicon.ico",
         width = 48, height = 48)
rsvg_png("RForwardsLogo-gridSVG-white.svg", "../apple-touch-icon.png",
         width = 256, height = 256)

# tidy up
img <- setdiff(list.files(pattern = "(.svg|.pdf|.png)"),
               c("forwards.svg", "Rlogo.svg"))
sapply(img, file.remove)

