// Given: a heap conforming to a specific interface
// allocate space on the heap...

// We'll use a linked list as the top-level object
// However, the nodes will be allocated on the heap

// We need to keep track of the heap where the 
// nodes are stored- otherwise, we'd have to keep
// track, for each node, which heap we store it on
var heap = argument0;

var ls;

ls[2] = heap;
ls[1] = 0;
ls[0] = -1; // Pointer to the first node

// TODO I'm really not sure that this is going to work out well.
// I'd probably prefer to just keep pointers as 32 bit ints,
// and update the memory manager to work with 64 bit indices at
// some later time.
// So, using -1 is out. It's probably better to allocate the space on the heap

// I could add a variable here to change the type of
// data allocated for each value, if desired.
// For now, we'll hardcode it as an f_64.

return ls;