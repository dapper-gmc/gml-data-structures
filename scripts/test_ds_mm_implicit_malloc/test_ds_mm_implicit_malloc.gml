var mm = ds_mm_implicit_create();

var handle1 = ds_mm_implicit_malloc(mm, 5);

show_debug_message("First block free: " + string(ds_mm_get_block_free(mm, handle1)));
show_debug_message("First block size: " + string(ds_mm_get_block_size(mm, handle1)));

var next = ds_mm_next_block(mm, handle1);

show_debug_message("Next block free: " + string(ds_mm_get_block_free(mm, next)));
show_debug_message("Next block size: " + string(ds_mm_get_block_size(mm, next)));

var handle2 = ds_mm_implicit_malloc(mm, 32);

show_debug_message("First block free: " + string(ds_mm_get_block_free(mm, handle1)));
show_debug_message("First block size: " + string(ds_mm_get_block_size(mm, handle1)));

var next = ds_mm_next_block(mm, handle1);

show_debug_message("Second block free: " + string(ds_mm_get_block_free(mm, next)));
show_debug_message("Second block size: " + string(ds_mm_get_block_size(mm, next)));

var next = ds_mm_next_block(mm, next);

show_debug_message("Third block free: " + string(ds_mm_get_block_free(mm, next)));
show_debug_message("Third block size: " + string(ds_mm_get_block_size(mm, next)));