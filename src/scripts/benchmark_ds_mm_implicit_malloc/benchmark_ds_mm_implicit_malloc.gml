var mm = ds_mm_implicit_create();

var _t = get_timer();

//for (i = 0; i < 1; i++) {
	ds_mm_implicit_malloc(mm, 4);
//}

show_debug_message(
	"Allocation: " +
	string(get_timer() - _t) +
	" microseconds");