var mm = ds_mm_implicit_create();

for (i = 0; i < 100000; i++) {
	ds_mm_implicit_malloc(mm, 4);
	if i % 1000 == 0 {
		show_debug_message(i);
	}
}