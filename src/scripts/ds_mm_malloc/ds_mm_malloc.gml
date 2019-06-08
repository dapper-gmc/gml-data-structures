var mm = argument0; // memory manager
var size = argument1; // bytes to allocate

var func = mm[MEM_MAN_MALLOC];

return script_execute(func, mm, size);