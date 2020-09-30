// I recommend viewing as wireframe if you want to work on this 
// (F11 or View -> Wireframe).
//
// I manually create two STL files from this file.
// 
// This is a box for presence tokens and spirit reminder tokens, 
// designed to be used with or without a lid.
// At the end of this file you will find lines which can either 
// render the box, the lid, or both (including proper spacing).
//
// The original idea for this box is from the CC BY 4.0-licensed
// Anemic's Spirit Island + BC + JE Organizer 
//    https://www.thingiverse.com/thing:4269765
// 
// However, they have all tokens in one tray, individual slots per 
// reminder token, more space in between all slots etc., no lid, 
// but the general layout per individual spirit was a huge inspiration,
// i.e., having a cylinder for the presence and slots for the reminders 
// next to it.

// general settings
wall = 1.5;
separator = wall;

// presence tokens: 44 mm height with 7.5 mm radius
presence_radius = 7.5;
presence_stacked = 44;  // this is too much, but new spirits have one token more etc.

// reminder tokens: 7 mm height (stack of 3, estimate), 20x13 oval
reminder_stacked = 7;
reminder_width = 13;
reminder_height = 20.7;  // adds ~0.7 mm slack

// Lid properties
opening_width = presence_radius;
spacing_lid = .5;

// box outer dimensions
box_width = presence_stacked + 2 * wall;
box_depth = 2 * wall + separator + 2 * presence_radius + reminder_stacked;
box_height = reminder_width + wall;

module Box() {

difference()
{
    // height tokens + wall, walls + separator + 15 mm presence width + 7.5 mm reminder tokens
    cube([box_width, box_depth, box_height]);
    
    translate([wall, wall, wall]) 
        cube([reminder_height, reminder_stacked, reminder_width]);
    
    translate([presence_stacked + wall - reminder_height, wall, wall]) 
        cube([reminder_height, reminder_stacked, reminder_width]);
    
    translate([wall, wall + separator + reminder_stacked + presence_radius, reminder_width + wall])
        rotate([0, 90, 0]) 
            cylinder(presence_stacked, r=presence_radius);
};

} // end Box

module Lid() {

difference()
{
    cube([box_width + 2 * spacing_lid + 2 * wall, 
          box_depth + 2 * spacing_lid + 2 * wall, 
          box_height + wall + reminder_height - reminder_width]);
    
    translate([wall, wall, 0])
    {
        cube([box_width + 2 * spacing_lid, 
              box_depth + 2 * spacing_lid, 
              box_height + spacing_lid]);
        
        // reminder tokens 1
        translate([spacing_lid + wall, 
                   spacing_lid + wall, 
                   box_height]) 
            cube([reminder_height, reminder_stacked, reminder_height - reminder_width]);
        
        // reminder tokens 2
        translate([spacing_lid + wall + presence_stacked - reminder_height, 
                   spacing_lid + wall, 
                   box_height]) 
            cube([reminder_height, reminder_stacked, reminder_height - reminder_width]);
    
        // presence tokens
        translate([spacing_lid + wall, 
                   spacing_lid + wall + separator + reminder_stacked + presence_radius,
                   reminder_width + wall])
            rotate([0, 90, 0]) 
                cylinder(presence_stacked, r=presence_radius);
         
         // opening to see colors from outside
         translate([spacing_lid + wall,
                   spacing_lid + wall + separator + reminder_stacked + presence_radius - opening_width / 2,
                   reminder_width + wall])
             cube([presence_stacked, 
                   opening_width, 
                   2 * wall + spacing_lid + presence_radius]);
    }
}

} // end Lid

//Box();
Lid();
translate([spacing_lid + wall, spacing_lid + wall, 0]) Box();
