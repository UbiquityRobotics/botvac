#!/bin/sh

# Convert .scad file to .svg:
openscad top_plate.scad -o top_plate.svg
# Force the units in the .svg file to mm, supress filling, set stroke to .001mm:
cat top_plate.svg | sed						\
  -e 's/" height/mm" height/'					\
  -e 's/" viewBox/mm" viewBox/'					\
  -e 's/fill="lightgray"/fill="" fill-opacity="0"/'		\
  -e 's/stroke-width="0.5"/stroke-width="0.001"/' > 		\
  /tmp/top_plate.svg
# Convert .svg file to .pdf:
inkscape --file=/tmp/top_plate.svg --without-gui --export-pdf=top_plate.pdf
