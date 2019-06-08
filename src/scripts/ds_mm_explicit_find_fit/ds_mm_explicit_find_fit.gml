var mm = argument0;
var size = argument1;

var next;

var first = ds_mm_explicit_read(mm, buffer_u32, 0); // Read the head's next pointer

// We subtract 4 from next here because the linked list 
// is intrusive and we need to go outside of it to get the
// item the list is attached to.
for (next = first; ds_mm_get_block_size(mm, next - 4) > 0; next = ds_mm_explicit_read(mm, buffer_u32, next)) {
	
	if (ds_mm_get_block_free(mm, next - 4) == 1 && ds_mm_get_block_size(mm, next - 4) >= size) {
		return next - 4;
	}
}
return undefined;