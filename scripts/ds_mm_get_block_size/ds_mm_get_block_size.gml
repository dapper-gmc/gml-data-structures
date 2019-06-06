var mm = argument0;
var block_handle = argument1;

var tag = ds_mm_implicit_read(mm, buffer_u32, block_handle);

return tag >> 1;