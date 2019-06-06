var mm = argument0;
var type = argument1;
var handle = argument2;

buffer_seek(mm[0], buffer_seek_start, handle);

return buffer_read(mm[0], type);