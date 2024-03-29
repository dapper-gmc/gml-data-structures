/// @func ds_linked_list_array_prepend(ls, x)
/// @desc Prepend the specified element to a specified linked list
/// @arg ls A linked list
/// @arg x The element to prepend

var _ls = argument0;
var _x = argument1;

var _n;

// Set data of new node
_n[1] = _x;

// Set new node's next pointer to the first node
_n[0] = _ls[0];

// Set list's first node to pointer to the head
_ls[@ 0] = _n;

// Increment list size
_ls[@ 1] = _ls[1] + 1;