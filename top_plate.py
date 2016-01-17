#!/usr/bin/env python

import math

def quad_append(holes, x, y, dx, dy, diameter):
    assert isinstance(holes, list)
    assert isinstance(x, float)
    assert isinstance(y, float)
    assert isinstance(dx, float)
    assert isinstance(dy, float)
    assert isinstance(diameter, float)
    holes.append([x + dx/2, y + dy/2, diameter])
    holes.append([x - dx/2, y + dy/2, diameter])
    holes.append([x + dx/2, y - dy/2, diameter])
    holes.append([x - dx/2, y - dy/2, diameter])

def main():
    scad_file = open("top_plate.scad", "wa")

    points = []

    # Python uses radians for angles:
    pi = math.pi
    degrees0 = 0
    degrees90 = pi/2
    degrees180 = pi
    degrees270 = pi + pi/2
    degrees360 = 2 * pi

    # The over dimensions of the base with 4 rounded courners:
    base_radius =  15.00
    base_dx =      138.00
    base_dy = 	   282.00

    # The cutout is the rectangular area for the lift handle and 2 buttons.
    # Two of the corners are rounded:
    cutout_radius = 16.00
    cutout_dx =     cutout_radius
    cutout_dy =	    180.00

    # There are 6 corners that outline the entire base plus cutout.
    # This is oriented with +X pointing forward (i.e. cutout facing front):
    corners = [
      ( base_dx/2 - base_radius,  base_dy/2 - base_radius, # NE base corner
	base_radius, degrees0,   degrees90),
      (-base_dx/2 + base_radius,  base_dy/2 - base_radius, # NW base corner
	base_radius, degrees90,  degrees180),
      (-base_dx/2 + base_radius, -base_dy/2 + base_radius, # SW base corner
	base_radius, degrees180, degrees270),
      ( base_dx/2 - base_radius, -base_dy/2 + base_radius, # SE base corner
	base_radius, degrees270, degrees360),
      ( base_dx/2, -cutout_dy/2 + cutout_radius,	   # S cutout corner
        cutout_radius, degrees270, degrees180),
      ( base_dx/2,  cutout_dy/2 - cutout_radius,	   # N cutout corner
        cutout_radius, degrees180, degrees90) ]

    # Now visit each *corner* to trace the outline:
    for corner in corners:
	# Extract the *corner* values:
	center_x = corner[0]
	center_y = corner[1]
	radius = corner[2]
	start_angle = corner[3]
	end_angle = corner[4]
	
	# Step through the angles:
	steps = 12
	delta_angle = (end_angle - start_angle) / steps
	#print("detla_angle={0}".format(delta_angle))
	for step in range(steps + 1):
	    angle = start_angle + step * delta_angle
	    #print("  angle={0}".format(angle))
	    x = center_x + radius * math.cos(angle)
	    y = center_y + radius * math.sin(angle)
	    points.append([x, y])

    # Write the polygon to *scad_file*:
    paths = [range(len(points))]
    scad_file.write("projection(cut=true) difference() {\n")
    scad_file.write("  linear_extrude(height=1, center=true, convextity=5)\n")
    scad_file.write(
      "    polygon(points={0}, paths={1}, convexity=4);\n".
      format(points, paths))

    # Now build up a list of *holes* to place:
    holes = []
    camera_x = -25.00
    camera_y = 0.00
    raspi_x = camera_x
    raspi_y = -70.00

    holes.append( [base_dx/2 - 28.00, -37.00, 3.20] )	# Dust Bin Switch
    quad_append(holes, raspi_x, raspi_y, 49.00, 58.00, 3.1)	# RasPi2 Holes
    quad_append(holes, camera_x, camera_y + 12.5/2, 21.00, 12.50, 2.2) # Camera
    holes.append( [camera_x, camera_y, 9.0] )		# Camera view hole

    # Now cut out notches for the rounded part of the base recepticle:
    notch_dx = 25.00
    notch_dy = 2*32.00	# We make the cube twice the required dy.
    notch_x = -base_dx/2 + 24.00 + notch_dx/2
    notch_y = base_dy/2
    scad_file.write("  translate([{0}, {1}])\n".
      format(notch_x,  notch_y))
    scad_file.write("    cube([{0}, {1}, 2], center=true);\n".
      format(notch_dx, notch_dy))
    scad_file.write("  translate([{0}, {1}])\n".
      format(notch_x, -notch_y))
    scad_file.write("    cube([{0}, {1}, 2], center=true);\n".
      format(notch_dx, notch_dy))

    # Output each *hole* to *scad_file:
    for hole in holes:
	# Grab the *hole* values:
	x = hole[0]
	y = hole[1]
	diameter = hole[2]
	radius = diameter/2

	# Write out a cylinder to cause the hole to be drilled:
	scad_file.write(
	  "  translate([{0}, {1}, 0])\n".format(x, y, radius))
	scad_file.write(
	  "    cylinder(h=10, r={0}, center=true, $fn=16);\n".
	  format(radius))
    scad_file.write("}\n")
    scad_file.close()    

if __name__ == "__main__":
    main()
