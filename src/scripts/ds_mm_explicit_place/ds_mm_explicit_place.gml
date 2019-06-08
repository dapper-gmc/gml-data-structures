var mm = argument0;
var handle = argument1;
var awords = argument2;

var size = ds_mm_explicit_get_block_size(mm, handle);

if size - awords >= MIN_EXPLICIT_BLOCK_SIZE_WORDS {
	ds_mm_explicit_mark_used(mm, handle, awords);
	var new_block = ds_mm_next_block(mm, handle);
	ds_mm_explicit_mark_free(mm, new_block, size - awords);
	
	// add split-off block to free list
	
	// Where the head node's next pointer is located on the heap
	var head_next = 0;

	// Where the list node after the head node is located
	// This code is duplicated in coalesce: should abstract
	var first = ds_mm_explicit_read(mm, buffer_u32, head_next);

	var new_next = new_block + 4;
	var new_prev = new_block + 8;

	ds_mm_explicit_write(mm, head_next, buffer_u32, new_next);
	ds_mm_explicit_write(mm, first + 4, buffer_u32, new_next);

	ds_mm_explicit_write(mm, new_next, buffer_u32, first);
	ds_mm_explicit_write(mm, new_prev, buffer_u32, 0);
}
else {
	ds_mm_explicit_mark_used(mm, handle, size);
}

// Have to remove the free block now
var next = ds_mm_explicit_read(mm, buffer_u32, handle + 4);
var prev = ds_mm_explicit_read(mm, buffer_u32, handle + 8);
	
ds_mm_explicit_write(mm, prev, buffer_u32, next);
ds_mm_explicit_write(mm, next + 4, buffer_u32, prev);