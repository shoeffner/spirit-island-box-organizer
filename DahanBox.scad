// This file generates three puzzle parts of the Dahan Tray for smaller print beds.
// If you have a large print bed, print the Dahan_Tray_v2.stl directly, as the puzzle
// pieces require some post-processing (especially polishing/rasping the puzzle noses,
// and optionally glueing them together).
//
// Requires https://github.com/jernst/josl
// Requires Dahan_Tray_v2.stl from https://www.thingiverse.com/thing:4269765
//
// Place Dahan_Tray_v2.stl in a directory SIBCJEOrg next to this file, i.e.,
// SIBCJEOrg/Dahan_Tray_v2.stl must be a valid path.
//
// Place the contents of https://github.com/jernst/josl in your libraries folder,
// refer to https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Libraries for details.
//
// You can also try to generate a puzzle from the _thin.stl version etc., but your 
// mileage may vary.
//
// To generate each individual part, toggle the comments at the end of this file.

use <josl/josl/cuts/puzzle.scad>

module DahanTray() {
    rotate([0, 0, -90])
        translate([0, 282, 0])
            import("SIBCJEOrg/Dahan_Tray_v2.stl");
}


module FullPuzzle() {
    Puzzle(apart=20, y=[95])
    {
        translate([-80, 0, 0])
        {
            rotate([0, 0, -90])
            {
                Puzzle(apart=20, y=[25])
                {
                    translate([-100, 0, 0])
                    {
                        DahanTray();
                    }
                }
            }
        }
    }
}

module Part1() {
    difference()
    {
        FullPuzzle();

        translate([-100, 0, 0])
            cube([400, 400, 400]);
    }
}

module Part2() {
    difference()
    {
        FullPuzzle();

        translate([-400, -200, 0])
            cube([400, 400, 400]);
    }
}

module Part3() {
    difference()
    {
        FullPuzzle();
        
        Part1();
        Part2();
    }
}

//DahanTray();
Part1();
Part2();
Part3();

