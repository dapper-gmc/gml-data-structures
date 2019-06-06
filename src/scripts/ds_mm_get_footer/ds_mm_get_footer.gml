var mm = argument0;
var head_handle = argument1;

var size = ds_mm_get_block_size(mm, head_handle);

return head_handle + size - WSIZE;