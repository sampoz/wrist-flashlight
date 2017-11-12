// Wrist handlight 4 great awesomeness

base_radius = 26;
base_height = 5;
lilypad_radius = 25;
lilypad_heigth = 5;
lilypad_offset_z = 1;
lilypad_usb_radius = 5;
lilypad_peg_radius = 0.70;
lilypad_peg_height = 2.5;
lilypad_peg_circumference = 41;

rgb_pad_radius = 5;
rgp_pad_offset = 10;
rgb_peg_radius = 0.70;
rgb_peg_height = 1;
rgb_peg_circumference = 7.5 -rgb_peg_radius;
rgb_pad_global_offset = 25;

resolution = 9;

magnet_diameter = 2;
magnet_height = 0.5;
magnet_offset = 20;

// rgb_pads
difference(){
     for(pad_i = [0 : 1 : 1]){
          rotate([90]){
               translate([(-(rgp_pad_offset) +(pad_i *rgp_pad_offset)*2), lilypad_heigth/2, lilypad_offset_z]){
                    cylinder(lilypad_radius, 0, rgb_pad_radius);
                    for(x = [0 : 1 : 1]){
                         for(y = [0 : 1 : 1]){
                              translate([-(rgb_peg_circumference + rgb_peg_radius)/2 + x*(rgb_peg_circumference + rgb_peg_radius), -rgb_peg_radius*2 +(rgb_pad_radius*y)/2, rgb_pad_global_offset]){
                                   cylinder(rgb_peg_height, rgb_peg_radius, rgb_peg_radius, $fn=resolution);
                              }
                         }
                    }
               }
          }
     }
     translate([0,0,-base_height]){
          cylinder(base_height, base_radius*2, base_radius*2);
     };
     translate([0,0,0]){
          cylinder(base_height*2, base_radius, base_radius);
     };
}

// Lilypad-pegs
for(x = [0 : 1 : 1]){
     translate([-(lilypad_peg_circumference + lilypad_peg_radius)/2 + x*(lilypad_peg_circumference + lilypad_peg_radius),0,0]){
          cylinder(lilypad_peg_height, lilypad_peg_radius, lilypad_peg_radius, $fn=resolution, $fn=resolution);
     }
}

difference(){
     // base
     cylinder(base_height, base_radius, base_radius);
     // lilypad-via
     translate([0, 0,lilypad_offset_z]){
          cylinder(lilypad_heigth, lilypad_radius, lilypad_radius);

     }
		 // magnets
		 for(x = [0 : 1 : 1]){
					for(y = [0 : 1 : 1]){
							 translate([-magnet_offset/2 + x*magnet_offset, -magnet_offset/2 + y*magnet_offset, 0]){
										cylinder(magnet_height, magnet_diameter, magnet_diameter);
							 }
					}
		 }


     // usb-via
     translate([0, 0,lilypad_offset_z+10]){
          cylinder(lilypad_heigth, lilypad_radius, lilypad_radius);
     }
     rotate([-90]){
          translate([0, -lilypad_heigth, lilypad_offset_z]){
               cylinder(lilypad_radius, 0, lilypad_usb_radius);
          }
     }
}
