var mm = argument0;
var header = argument1;

var size = WSIZE * ds_mm_get_block_size(mm, header);

return header + size;