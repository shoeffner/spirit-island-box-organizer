Disclaimer: This is still WIP. Things will change, as I do not own the game and can only test new components when I meet my friend who owns it.


# Spirit Island Insert Box

This 3D printing project remixes parts of [Anemic's Spirit Island + BC + JE Organizer](https://www.thingiverse.com/thing:4269765).
The remixed parts can be found in the directory [SIBCJEOrg](SIBCJEOrg).
I also added a few own designs build in OpenSCAD.

For the card boxes I always assume standard sized sleeves around the cards.

You can find the remixing and new files in the root directory, the exported STL files are in the directory [stl](stl).

Anemic's original license was [CC-BY-4.0](https://creativecommons.org/licenses/by/4.0/).
I release these files under the same license.


## Print settings

I sliced everything with slic3r and print using OctoPrint on an Anet A8 (with Marlin).

See also slic3r/SpiritIslandBox.ini for more details.
Note that those settings include filament and printer settings, you might want to use them as inspiration only.

In general, I used 0.4 mm layer height (there is nothing which needs fine details) and no infill nor supports, but for some models infill is recommended.

In the table below, I show for each model whether I used infill or not, and
what other things are important, plus how many times you need to print each model.


Model                Num Config    Time Comments                                                        OpenSCAD file
-------------------- --- --------- ---- --------------------------------------------------------------- -----------------------
`PresenceBox_Box`      6 Infill       ?                                                                 `PresenceBox.scad`
`PresenceBox_Lid`      6 Infill      35 Rotate around X by 180 degrees (i.e., print upside down)        `PresenceBox.scad`
`DahanBox_Pt_1`        1 No infill    ? Consider `DahanTray_v2`                                         `DahanBox.scad`
`DahanBox_Pt_2`        1 No infill    ? Consider `DahanTray_v2`                                         `DahanBox.scad`
`DahanBox_Pt_3`        1 No infill    ? Consider `DahanTray_v2`                                         `DahanBox.scad`
`EnergyBox_Pt_1`       1 No infill    ? Consider `Energy_Tray`                                          `EnergyBox.scad`
`EnergyBox_Pt_2`       1 No infill    ? Consider `Energy_Tray`                                          `EnergyBox.scad`
`EnergyBox_Pt_3`       1 No infill    ? Consider `Energy_Tray`                                          `EnergyBox.scad`
`ElementTray`          1 Infill       ? This fits only just right, might need slight scaling            `ElementTray.scad`
`Smaller_BWDBS_Box`    5 No infill   50 One for each: Beast, Wilds, Disease, Badlands, Strife           `Smaller_BWDBS_Box.scad`
`Cards_Unique`         1 No infill    ? Or use two `Cards_Generic_Big` for all big cards                `Cards.scad`
`Cards_Minor`          1 No infill    ? Or use two `Cards_Generic_Big` for all big cards                `Cards.scad`
`Cards_Major`          1 No infill    ? Or use two `Cards_Generic_Big` for all big cards                `Cards.scad`
`Cards_Events`         1 No infill    ? Or use two `Cards_Generic_Big` for all big cards                `Cards.scad`
`Cards_Fear`           1 No infill    ? Or use two `Cards_Generic_Big` for all big cards                `Cards.scad`
`Cards_Blight`         1 No infill    ? Or use two `Cards_Generic_Big` for all big cards                `Cards.scad`
`Cards_Aspects`        1 No infill    ? Or use two `Cards_Generic_Big` for all big cards                `Cards.scad`
`Cards_Invaders`       1 No infill    ? Or use the `Cards_Generic_Small` for Invaders + Reminders       `Cards.scad`
`Cards_Reminders`      1 No infill    ? Or use the `Cards_Generic_Small` for Invaders + Reminders       `Cards.scad`


## To do

- A fear box and an energy box. They have to be about 1cm higher and wider than the BWDBS box.
- The `PresenceBox_Lid` is not tested yet, I don't know if it works for reminder tokens.
- The card boxes have to be tested, the individual ones as well as the generic ones. The last try (not yet in history) was too small for sleeved cards.
- Solution for cities, towns, explorers needs to be found (or printed from Anemic's organizier)
- Need to add images of the results etc.


## License

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/80x15.png" /></a>

This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.
