// This file generates a remix of the very huge Element_Tray_V2.stl.
//
// Requires Element_Tray_V2.stl from https://www.thingiverse.com/thing:4269765
//
// Place Element_Tray_V2.stl in a directory SIBCJEOrg next to this file, i.e.,
// SIBCJEOrg/Element_Tray_V2.stl must be a valid path.
//

module ElementTray() {
    translate([120.1, 197, -70])
        import("SIBCJEOrg/Element_Tray_V2.stl");
}

module SmallTray() 
{
    difference()
    {
        cut = 7;
        translate([0, 0, -cut])
        {
            difference()
            {
                ElementTray();
                
                cube([50, 100, cut]);
            };
        };
        
        translate([0, 0, 11])
            cube([50, 100, 10]);
    }
}

module SingleCompartment()
{
    translate([-20.5, -4.5, 0])
    difference()
    {
        SmallTray();
        
        cube([20.5, 100, 12]);
        
        translate([20, 22.5, 0])
            cube([21, 100, 12]);
        
        cube([60, 4.5, 12]);
    }
}

module EightCompartments()
{
    translate([0, 18, 0])
    {
        SingleCompartment();
        
        mirror([0, 1, 0])
            SingleCompartment();
        
        mirror([1, 0, 0])
        {
            SingleCompartment();
            mirror([0, 1, 0])
                SingleCompartment();
        }
    }
    mirror([0, 1, 0])
        translate([0, 18, 0])
        {
            SingleCompartment();
            
            mirror([0, 1, 0])
                SingleCompartment();
            
            mirror([1, 0, 0])
            {
                SingleCompartment();
                mirror([0, 1, 0])
                    SingleCompartment();
            }
        }
}
//ElementTray();
EightCompartments();