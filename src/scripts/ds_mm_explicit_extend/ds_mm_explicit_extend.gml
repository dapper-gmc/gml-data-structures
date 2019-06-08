// Extend the heap by a set amount
var mm = argument0;
var words = argument1;

// Allocate an even number of words to maintain alignment
words = (words + 1) & ~1;

var new_size = buffer_get_size(mm[0]) + words * WSIZE;

var old_end = buffer_seek(mm[0], buffer_seek_end, 0);

// We'll presume the resize always works, since it returns nothing
buffer_resize(mm[0], new_size);

//////// Bookkeeping
// Create a new free block from the words allocated; note that
// in doing so, we subsume the old epilogue pointer (which is three bytes)
var new_head = old_end - WSIZE;

ds_mm_explicit_mark_free(mm, new_head, words);

// THEN, add a new epilogue FENCE block (there's
// guaranteed to be space for it, since we had one before
// and we're allocating a new free block of the given size
var next_block = ds_mm_explicit_next_block(mm, new_head);

buffer_seek(mm[0], buffer_seek_start, next_block);
buffer_write(mm[0], buffer_u32, FENCE);

ds_mm_explicit_coalesce(mm, new_head);