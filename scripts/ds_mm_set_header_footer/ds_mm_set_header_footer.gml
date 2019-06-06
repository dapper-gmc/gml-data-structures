var mm = argument0;
var header = argument1;
var size = argument2;
var inuse = argument3;

var tag = size << 1;
tag = tag | inuse;

ds_mm_implicit_write(mm, header, buffer_u32, tag);

var footer = ds_mm_get_footer(mm, header);

ds_mm_implicit_write(mm, footer, buffer_u32, tag);