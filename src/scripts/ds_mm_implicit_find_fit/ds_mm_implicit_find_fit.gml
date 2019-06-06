var mm = argument0;
var size = argument1;

var next;
for (next = mm[1]; ds_mm_get_block_size(mm, next) > 0; next = ds_mm_next_block(mm, next)) {
	
	if (ds_mm_get_block_free(mm, next) == 1 && ds_mm_get_block_size(mm, next) >= size) {
		return next;
	}
}
return undefined;