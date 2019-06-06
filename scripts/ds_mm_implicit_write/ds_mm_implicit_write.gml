// Unfortunately, we can't read from arbitrary places to/from the buffer- 
// we first have to seek to them.

// This function provides a wrapper for writing to a specific index.

var mm = argument0;
var handle = argument1; // expressed in bytes from start
var type = argument2;
var val = argument3;

var buffer = mm[0];

buffer_seek(buffer, buffer_seek_start, handle);
buffer_write(buffer, type, val);