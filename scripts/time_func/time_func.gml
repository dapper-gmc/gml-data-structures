/// @func time_func(script)
/// @desc Time the provided script
/// @arg script The script to time

var script = argument0;

var _t = get_timer();

script_execute(script);

show_debug_message(
	"Script: " +
	script_get_name(script) + 
	"; " + string(get_timer() - _t) +
	" microseconds");