// This file generates three puzzle parts of the energey tray for smaller print beds.
// If you have a large print bed, print the Energy_Tray.stl directly, as the puzzle
// pieces require some post-processing (especially polishing/rasping the puzzle noses,
// and optionally glueing them together).
//
// Requires https://github.com/jernst/josl
// Requires Energy_Tray.stl from https://www.thingiverse.com/thing:4269765
//
// Place Energy_Tray.stl in a directory SIBCJEOrg next to this file, i.e.,
// SIBCJEOrg/Energy_Tray.stl must be a valid path.
//
// Place the contents of https://github.com/jernst/josl in your libraries folder,
// refer to https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Libraries for details.
//
// You can also try to generate a puzzle from the _thin.stl version etc., but your 
// mileage may vary.
//
// To generate each individual part, toggle the comments at the end of this file.


use <josl/josl/cuts/puzzle.scad>

module EnergyTray() {
    rotate([0, 0, 90-5.3])
        translate([-207.666, -436.318, -2])
            import("SIBCJEOrg/Energy_Tray.stl");
}


module FullPuzzle() {
    Puzzle(apart=20, y=[78])
    {
        translate([-80, 0, 0])
        {
            rotate([0, 0, -90])
            {
                Puzzle(apart=20, y=[12])
                {
                    translate([-80, 0, 0])
                    {
                        EnergyTray();
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

//Part1();
//Part2();
//Part3();
//EnergyTray();
FullPuzzle();

