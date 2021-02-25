MESSAGE = "Message";

// Spacing Between Letters
KERNING = 1; // [0.5:0.05:2]

// How tall the letters are
SIZE = 150;

// Total Letter Thickness
HEIGHT = 11;

// Wall Thickness
WALL = 2;

// Back Plane Thickness
BACK = 1;

// Choose anything from: fonts.google.com
FONT = "Roboto";

// Walls placed inside or outside of the font border lines
BORDER = 1; // [0:Outside, 1:Inside]

$fn = SIZE/5 + 40;


if (BORDER) { // True is outboard
	difference() {
		offset = 0.05;
		linear_extrude(HEIGHT)
			text(MESSAGE, size=SIZE, font=FONT, spacing=KERNING+offset);
		translate([0, 0, BACK])
			linear_extrude(HEIGHT + BACK)
				offset(delta=-WALL)
					text(MESSAGE, size=SIZE, font=FONT, spacing=KERNING+offset);
	}
}
else { // False is inboard
	difference() {
		linear_extrude(HEIGHT)
			offset(delta=WALL)
				text(MESSAGE, size=SIZE, font=FONT, spacing=KERNING);
		translate([0, 0, BACK])
			linear_extrude(HEIGHT + BACK)
				text(MESSAGE, size=SIZE, font=FONT, spacing=KERNING);
	}
}
