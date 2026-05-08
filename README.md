# openjug
A compiled resource for parametrically modelled (OpenSCAD) pompfen components for the sport of Jugger in the United States. Heavily inspired by the work of [Reid Dye](https://github.com/reid23/yet-another-pompfen-store) in California and everyone from [Jugger CPH/Sköll](https://docs.google.com/document/d/1G3YccTNKzTjZdDeqR7QNmc1y7YO0-5ojyMMpAc2Ee3U) in Denmark. Not endorsed by or officially affiliated with either of those parties, or the USNJA.

> [!IMPORTANT]
> This is only an initial phase of the repo, it is not complete. I intend to describe my pompfen system in detail + include additional files, diagrams, and resources. For now it is just a place to host the 3D printed parts

### TLDR
- You can find the parametric models (to customize your own) in [parametrics](parametrics)
- You can find ready-made STLs in [finished-models](finished_models)
- You can find slicer modifier volumnes in [slicer_modifiers](slicer_modifiers)
- Working with the parametrics requires [OpenSCAD](https://openscad.org/) to be installed on your machine, as well as the [BOSL2](https://github.com/BelfrySCAD/BOSL2/) library
- See my TODOs [here](TODO.md). I'm too lazy to use issue tracking myself, but feel free to make suggestions or contribute that way! I'll add a better contributor guide down the line

### Motive
I want to see an end to the era of pompfen that are cumbersome to wield, slow to repair, and filled with wildly excess amounts of adhesive. I undertook an effort to create modularized pompfen that are simultaneously simple to customize, standardizable, affordable, and incredibly efficient to assemble or strip. **NOTE**: There is an obvious equipment hurdle. You need access to a 3D printer that can print TPU, and preferably you'd also be using Reid Dye's [coring jig](https://www.printables.com/model/1233976-pompf-coring-jig/files) or a variant for your blades. 

> [!TIP]
> You may be asking: why this, instead of Reid's system?
>
> It's up to you! This doesn't exist in response to or competition with Reid's system, and in fact requires similar equipment.\
> We simply were inspired in similar directions at the same time. I highly recommend checking out his work at one of the above links, it's quite impressive.
>
> So what's different?
> - All files are different
> - Reid's system is comprehensive, covering 3D parts, blades, covers, and everything else. Every material is specialty
> - My system assumes either old-fashioned or no covers, and basic bladefoams. The only specialty material is the TPU
> - My system assumes no staff deadzone foam (though it can be added)

### Part Types & Printing Notes
- Pommel: The bottom cap of a pompfen, under the handle
    - US minimum diameter is 5cm. Maximum depth allowed before reaching 5cm varies
- Staff Delimiter: Markers of staff handle "deadzone" between the grips
    - Minimum space between delimiters is 45cm. Quantitative rules for valid delimiters vary, qualitatively they must be sufficiently distinct from core to ensure refs can tell when hands are in the deadzone
- Tip Bookend: Internal component capping the top of the core, between the blade and the tip. Secures bladefoam and prevents core-through-tip
- Grip Bookend: Internal component that slides down the core, sitting at the bottom of the blade. Secures bladefoam

### Printing Notes
- All parts have only been tested in the US with [SirayaTech TPU Filament 85A](https://siraya.tech/products/flex-tpu-85a-filament)
- All parts should be printed in the realm of 17-18% infill (gyroid).
- Pommels should have an infill modifier in a cone from the base of the core channel to the base of the pommel, at 30% infill

### Part Credits
- Pommels: Designed by [Thalia Wood](https://github.com/polygeist111)
- Staff Delimiters: Designed by [Thalia Wood](https://github.com/polygeist111)
- Tip Bookend: Original design by [Pit](https://forum.jugger.org/viewtopic.php?p=107246#p107246), parameterized by [Felix](https://forum.jugger.org/viewtopic.php?p=107261&sid=4c20624096d330caf44e5186d9a03c37#p107261)
- Grip Bookend: Original design by [Pit](https://forum.jugger.org/viewtopic.php?p=107246#p107246), parameterized by [Felix](https://forum.jugger.org/viewtopic.php?p=107261&sid=4c20624096d330caf44e5186d9a03c37#p107261)