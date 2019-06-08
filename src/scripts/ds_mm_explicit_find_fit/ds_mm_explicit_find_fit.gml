var mm = argument0;
var size = argument1;

// Read the head's next pointer
var first = ds_mm_explicit_read(mm, buffer_u32, 0);

// We subtract 4 from next here because the linked list 
// is intrusive and we need to go outside of it to get the
// item the list is attached to.
var next = first;
var tag = ds_mm_get_block_size(mm, next - 4);
var free = tag & 1;
var tag_size = tag >> 1;

for (; tag_size > 0;) {
	
	// If free
	if (free == 1) {
		// If of proper size
		if (tag_size >= size) {
			return next - 4;
		}
	}
	next = ds_mm_explicit_read(mm, buffer_u32, next);
	tag = ds_mm_explicit_read(mm, buffer_u32, next - 4);
	free = tag & 1;
    tag_size = tag >> 1;
}

return undefined;