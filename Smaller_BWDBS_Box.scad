// This is a slightly smaller and thinner version of the token-tray
// Beast_Wilds_Disease_Badlands_Strife_Tray.stl.

// Requires Beast_Wilds_Disease_Badlands_Strife_Tray.stl from https://www.thingiverse.com/thing:4269765
//
// Place Beast_Wilds_Disease_Badlands_Strife_Tray.stl in a directory SIBCJEOrg next to this file, i.e.,
// SIBCJEOrg/Beast_Wilds_Disease_Badlands_Strife_Tray.stl must be a valid path.

difference()
{
    translate([0, 197, -70]) 
    {
        import("SIBCJEOrg/Beast_Wilds_Disease_Badlands_Strife_Tray.stl");
    };
    
    translate([-39, -84, 2])
    {
        cube([38, 83, 50]);
    };
    
    translate([-41, -85, 23])
    {
        cube([41, 85, 10]);
    };
} // difference