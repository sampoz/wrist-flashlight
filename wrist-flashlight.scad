// Wrist handlight 4 great awesomeness
// Print revision 3

base_radius = 27;
base_height = 7;
lilypad_radius = 26;
lilypad_heigth = 7;
lilypad_offset_z = 1;
lilypad_usb_radius = 5;
lilypad_peg_radius = 1;
lilypad_peg_height = 4;
lilypad_peg_circumference = 41.5;

rgb_pad_radius = 12;
rgb_pad_offset = 11.5;
rgb_pad_height = 3;

resolution = 9;

magnet_diameter = 2;
magnet_height = 0.5;
magnet_offset = 25;

// rgb_pads
difference(){
     for(pad_i = [0 : 1 : 1]){
          rotate([90]){
               translate([(-(rgb_pad_offset) +(pad_i *rgb_pad_offset)*2), lilypad_heigth/2, lilypad_offset_z]){
                    difference(){
                         cylinder(lilypad_radius + rgb_pad_height, 0, rgb_pad_radius);
                         translate([0,0,base_radius]){
                              cylinder(rgb_pad_height, rgb_pad_radius-1, rgb_pad_radius-1);
                         }

                    }
               }
          }
     }
     translate([0,0,0]){
          cylinder(base_height*4, base_radius, base_radius);
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
     translate([0, 0,lilypad_offset_z]){
          cylinder(lilypad_heigth, lilypad_radius, lilypad_radius);
     }
     rotate([-90]){
          translate([0, -lilypad_heigth+ lilypad_offset_z, lilypad_offset_z]){
               cylinder(lilypad_radius, 0, lilypad_usb_radius);
          }
     }
}
