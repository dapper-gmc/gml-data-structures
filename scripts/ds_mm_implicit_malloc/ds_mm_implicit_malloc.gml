var mm = argument0;
var size = argument1;

var asize, awords;

// First, determine the size of the block:
//     Either minimum size or something else

// Ignore stupid allocations
if size == 0 {
	return undefined;
}
else {
	asize = size + 2; // account for boundary tags
	asize = (asize + DSIZE - 1) & ~(DSIZE - 1); // align to double word
	awords = max(MIN_BLOCK_SIZE_WORDS, asize / WSIZE);
}

// Then, search the list of blocks for a free block
var handle = ds_mm_implicit_find_fit(mm, awords);

// If we can't find something the first time, extend
// and try again.

// We'll make the assumption that we don't want users attempting to allocate more than
// CHUNKSIZE * 4 bytes are a time. We could have a min/max guard to handle that.
if handle == undefined {
	ds_mm_implicit_extend(mm, CHUNKSIZE);
	
	// TODO: we actually already know where to place it- we
	// can have the extend function return it. Otherwise,
	// there's no reason this should not work
	handle = ds_mm_implicit_find_fit(mm, awords);
}

// Then, place the block in the right place and possibly split
ds_mm_implicit_place(mm, handle, awords);

return handle;