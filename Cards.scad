// Choose which cards
box = "Unique powers";   stack_height =  58; big = true;  holes = true;
//box = "Minor powers";    stack_height =  55; big = true;  holes = true;
//box = "Major powers";    stack_height =  32; big = true;  holes = true;
//box = "Events";          stack_height =  31; big = true;  holes = true;
//box = "Fear cards";      stack_height =  24; big = true;  holes = true;
//box = "Blighted island"; stack_height =  15; big = true;  holes = true;
//box = "Aspects";         stack_height =   9; big = true;  holes = false;
//box = "Invaders";        stack_height =   8; big = false; holes = false;
//box = "Reminders";       stack_height =   5; big = false; holes = false;
// generic card boxes
//box = ""; /* big */      stack_height = 115; big = true;  holes = true;
//box = ""; /* small */    stack_height =  15; big = false; holes = true;

big_height = 90;
big_width = 63.5;
small_height = 68;
small_width = 46;

card_height = big ? big_height : small_height;
card_width = big ? big_width : small_width;

// Card properties
card_height_mm = card_height + 3.5;  // + 3.5 for sleeve
card_width_mm = card_width + 3.5;  // + 3.5 for sleeve
card_grasp_mm = 7;

card_base_thickness_mm = 0.34;
card_sleeve_factor = 2;
card_thickness_mm = card_base_thickness_mm * card_sleeve_factor;

box_wall_thickness_mm = 1.5;
box_length_mm = stack_height
              + 2 * box_wall_thickness_mm;
box_width_mm = card_height_mm 
             + 2 * box_wall_thickness_mm;
box_height_mm = card_width_mm 
              + box_wall_thickness_mm;

echo("WxHxD", box_width_mm, box_height_mm, box_length_mm);

module Holes() {
    holes_height_mm = box_height_mm - card_grasp_mm - 2 * box_wall_thickness_mm;
    holes_width_mm = box_width_mm - 2 * box_wall_thickness_mm;
    
    circles_height = 3;
    circles_width = 4;
    
    roundness = 4;
    
    radius_mm = min(holes_height_mm, holes_width_mm) / max(circles_width, circles_height) / 2;
    
    blank_space_height_mm = (holes_height_mm - (2 * radius_mm) * circles_height) / (circles_height + 1);
    blank_space_width_mm = (holes_width_mm - (2 * radius_mm) * circles_width) / (circles_width + 1);

    for(i = [0:circles_width - 1], j = [0:circles_height - 1])
    {
        translate([0, 
                   box_wall_thickness_mm + blank_space_width_mm / 2 + holes_width_mm * i / circles_width + radius_mm, 
                   box_wall_thickness_mm + blank_space_height_mm / 2 + holes_height_mm * j / circles_height + radius_mm])
            rotate([0, 90, 0])
                cylinder(box_length_mm, r=radius_mm, $fn=roundness);
    }
    
    for(i = [0:circles_width - 2], j = [0:circles_height - 2])
    {
        translate([0, 
                   box_wall_thickness_mm + blank_space_width_mm / 2 + holes_width_mm * i / circles_width + 2.6 * radius_mm, 
                   box_wall_thickness_mm + blank_space_height_mm / 2 + holes_height_mm * j / circles_height + 2.3 * radius_mm])
            rotate([0, 90, 0])
                cylinder(box_length_mm, r=radius_mm, $fn=roundness);
    }
}


module Box() 
{
    difference()
    {
        difference()
        {
            // outer box
            cube([box_length_mm, 
                  box_width_mm, 
                  box_height_mm]);
            // inner box
            translate([box_wall_thickness_mm, 
                       box_wall_thickness_mm, 
                       box_wall_thickness_mm]) 
            {
                cube([box_length_mm - 2 * box_wall_thickness_mm,
                      box_width_mm - 2 * box_wall_thickness_mm,
                      box_height_mm - box_wall_thickness_mm]);
            };
            
            // cut-out
            translate([0,
                       box_wall_thickness_mm,
                       box_height_mm - card_grasp_mm])
            {
                cube([box_length_mm,
                      box_width_mm - 2 * box_wall_thickness_mm,
                      card_grasp_mm]);
            };

            text_size = 6;
            translate([text_size / 2 + box_length_mm / 2, 
                       box_wall_thickness_mm / 6, 
                       (box_height_mm - card_grasp_mm) / 2])
                rotate([90, -90, 0])
                    linear_extrude(box_wall_thickness_mm)
                        text(box, size=text_size, halign="center");
            if (big) 
            {
                translate([box_length_mm / 2 + box_wall_thickness_mm, box_width_mm / 2, box_wall_thickness_mm / 2])
                    rotate([0, 0, 90])
                        linear_extrude(box_wall_thickness_mm)
                            text(box, size=text_size, halign="center");
            }
        };
        
        if (holes)
        {
            Holes();
        } 
    }
}

Box();