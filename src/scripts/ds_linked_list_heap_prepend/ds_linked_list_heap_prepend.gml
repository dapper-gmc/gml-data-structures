/// @func ds_linked_list_array_prepend(ls, x)
/// @desc Prepend the specified element to a specified linked list
/// @arg ls A linked list
/// @arg x The element to prepend

var ls = argument0;
var val = argument1;

var heap = ls[2];

// First, allocate space on the heap
// (One word and two references)
var node_p = ds_mm_malloc(heap, 128);
var head = ls[0];

// Store the data and the next pointer
ds_mm_write(heap, buffer_f64, node_p, val);
ds_mm_write(heap, buffer_f64, node_p + 64, ls[0]);

// Set the new head node of the heap
ls[@ 0] = node_p;

// Increment list size
ls[@ 1] = ls[1] + 1;