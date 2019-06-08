// Given: a heap conforming to a specific interface
// allocate space on the heap...

// We'll use a linked list as the top-level object
// However, the nodes will be allocated on the heap

// We need to keep track of the heap where the 
// nodes are stored- otherwise, we'd have to keep
// track, for each node, which heap we store it on
var heap = argument0;

var ls;

ls[3] = heap;
ls[2] = 0;  // size

// Tails and heads are two ints pointers each 
// (next and prev pointers to places in the heap)
var head = ds_mm_malloc(heap, 8);
var tail = ds_mm_malloc(heap, 8);

// Head next pointer points to tail
ds_mm_write(heap, buffer_u32, head, tail); 

// tail prev pointer points to head
ds_mm_write(heap, buffer_u32, tail + 4, head);

/*
// I could add a variable here to change the type of
// data allocated for each value, if desired.
// For now, we'll hardcode it as an f_64, since
// most things in GM are that.
*/

return ls;