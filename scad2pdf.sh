#!/bin/sh

# Convert .scad file to .svg:
openscad top_plate.scad -o top_plate.svg
# Force the units in the .svg file to mm:
cat top_plate.svg | sed -e 's/" height/mm" height/' -e 's/" viewBox/mm" viewBox/' > /tmp/top_plate.svg
# Convert .svg file to .pdf:
inkscape --file=/tmp/top_plate.svg --without-gui --export-pdf=top_plate.pdf
