show_debug_message("----------------------------------------");
var mm = ds_mm_explicit_create();

var handle1 = ds_mm_explicit_malloc(mm, 5);
var block = ds_mm_explicit_get_block(handle1);

show_debug_message("First allocated block: " + string(block));
show_debug_message("First block free: " + string(ds_mm_get_block_free(mm, block)));
show_debug_message("First block size: " + string(ds_mm_get_block_size(mm, block)));

var next = ds_mm_explicit_next_block(mm, block);

show_debug_message("Next block free: " + string(next));
show_debug_message("Next block free: " + string(ds_mm_get_block_free(mm, next)));
show_debug_message("Next block size: " + string(ds_mm_get_block_size(mm, next)));

var handle2 = ds_mm_explicit_malloc(mm, 32);
block = ds_mm_explicit_get_block(handle1);

show_debug_message("First allocated block: " + string(block));
show_debug_message("First block free: " + string(ds_mm_get_block_free(mm, block)));
show_debug_message("First block size: " + string(ds_mm_get_block_size(mm, block)));

var next = ds_mm_explicit_next_block(mm, block);

show_debug_message("Next block: " + string(next));
show_debug_message("Second block free: " + string(ds_mm_get_block_free(mm, next)));
show_debug_message("Second block size: " + string(ds_mm_get_block_size(mm, next)));

var next = ds_mm_explicit_next_block(mm, next);

show_debug_message("Next block free: " + string(next));
show_debug_message("Third block free: " + string(ds_mm_get_block_free(mm, next)));
show_debug_message("Third block size: " + string(ds_mm_get_block_size(mm, next)));