var mm = argument0;
var handle = argument1;
var awords = argument2;

var size = ds_mm_get_block_size(mm, handle);

if size - awords >= MIN_BLOCK_SIZE_WORDS {
	ds_mm_implicit_mark_used(mm, handle, awords);
	var next = ds_mm_next_block(mm, handle);
	ds_mm_implicit_mark_free(mm, next, size - awords);
}
else {
	ds_mm_implicit_mark_used(mm, handle, size);
}