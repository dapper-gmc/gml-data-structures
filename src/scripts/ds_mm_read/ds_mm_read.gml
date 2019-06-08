var mm = argument0; // memory manager
var type = argument1;
var handle = argument2; // bytes to allocate

var func = mm[MEM_MAN_READ];

return script_execute(func, mm, type, handle);