use <BOSL2/std.scad>
//use <BOSL2/beziers.scad>

/*[ Core Diameter ]*/
// Outer diameter of a CF core in mm
cf_diam = 16.0; // [14.0:0.5:20.0]

cf_standard = 16.0 + 0.0; // + 0 just hides from customizer visibility
cf_radius = cf_diam * 0.5;
cf_deviation = cf_diam - cf_standard; // reference value for adjusting control points based on deviation

/*[ Padding Thickness ]*/
// Depth of padding off the core, in mm
padding_depth = 0.0; // [0.0:0.1:3.0]

/*[ Pommel Diameter ]*/
// Total pommel width in mm. 5cm (50mm) is US legal minimum, but modeller allows smaller
pommel_diam = 50.0; // [34.0:0.5:70.0]

pommel_standard = 50.0 + 0.0; // + 0 just hides from customizer visibility
pommel_radius = pommel_diam * 0.5;
pommel_deviation = pommel_diam - pommel_standard;

/*[ Spacer Diameter ]*/
// Total spacer width in mm. US has no legal minimum, but should be noticably protrusive from core (rec. 40mm)
spacer_diam = 40.0; // [30.0:0.5:50.0]

spacer_standard = 30.0 + 0.0; // + 0 just hides from customizer visibility
spacer_radius = spacer_diam * 0.5;
spacer_deviation = spacer_diam - spacer_standard;

/*[ Viewing Options ]*/
// Show 2D pommel path
show_pommel_path = true; // [true, false]
// Show 3D pommel volume
show_pommel_model = true; // [true, false]
// Show core in model (if show path is on)
show_core = false; // [true. false]
// Show 2D spacer path
show_spacer_path = true; // [true, false]
// Show 3D spacer volume
show_spacer_model = true; // [true, false]



pommel_bez = flatten([ // path is brought to axis during rendering step
    bez_begin([17, 0], 20 + (-0.8 * pommel_deviation), 8 + (0.5 * pommel_deviation)), // end of flat bottom
    bez_tang([pommel_radius, 12], 90, 4, 7), // center of flat side
    bez_tang([12.5 + (cf_deviation / 3) + (padding_depth), 34 - (padding_depth)], 120 - (cf_deviation * 2), 6, 10), // concave intrusion
    bez_joint([cf_radius, 60] /* NOTE: was 46, not 60 */, -10 + (3 * padding_depth), 0, 3 + (padding_depth), 0), // top corner
    bez_end([cf_radius - 0.5, 13], 0, 0) // depth of core cavity
]);

spacer_bez = flatten([ // path is brought to axis during rendering step
    bez_begin([cf_radius, 0], 20 + (-0.8 * spacer_deviation), 4 + (0.5 * spacer_deviation)), // end of flat bottom
    bez_tang([spacer_radius, 9], 90, 4, 7), // center of flat side
    bez_tang([12.5 + (cf_deviation / 3) + (padding_depth), 24 - (padding_depth)], 120 - (cf_deviation * 2), 6, 10), // concave intrusion
    bez_end([cf_radius, 32], -10 + (3 * padding_depth), 3 + (padding_depth)),
    //bez_joint([cf_radius - 1, 32], -10 + (3 * padding_depth), 0, 3 + (padding_depth), 0), // top corner
    //bez_end([cf_radius - 2, 13], 0, 0) // depth of core cavity
]);

//render curve to 2D and 3D
render_work();



module render_work() {
    if (show_pommel_path == true) {
        debug_bezier(bezpath = pommel_bez, N = 3);
    }

    if (show_pommel_model == true) {
        closed = bezpath_close_to_axis(pommel_bez, axis = "Y");
        path = bezpath_curve(closed, splinesteps = 64);
        rotate_sweep(path, 360, $fn = 72);
    }

    if (show_spacer_path == true) {
        right(40)
        debug_bezier(bezpath = spacer_bez, N = 3);
    }

    if (show_spacer_model == true) {
        //closed = bezpath_close_to_axis(spacer_bez, axis = "Y");
        path = bezpath_curve(spacer_bez, splinesteps = 64);
        up(80)
        rotate_sweep(path, 360, $fn = 72);
    }

    if (show_core == true && (show_pommel_model == true || show_spacer_model == true)) {
        up(13)
        cylinder(h = 200, r = cf_radius, $fn = 72);
    } 
    
}