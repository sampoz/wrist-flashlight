// Wrist handlight cover 4 great awesomeness
// Print revision 1

base_radius = 26.01;
base_height = 4;
lilypad_hole_radius = 25;
lilypad_hole_heigth = 7.5;
lilypad_hole_offset_z = 1;

difference(){
		 // base
		 cylinder(base_height, base_radius, base_radius);
		 // lilypad-via + inner magnets
		 translate([0, 0,lilypad_hole_offset_z]){
					cylinder(lilypad_hole_heigth, lilypad_hole_radius, lilypad_hole_radius);
		 }
}
