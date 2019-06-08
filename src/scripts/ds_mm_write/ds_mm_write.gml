var mm = argument0; // memory manager
var type = argument1;
var handle = argument2;
var val = argument3;

var func = mm[MEM_MAN_WRITE];

return script_execute(func, mm, type, handle, val);