var _ls = argument0;
var _x = argument1;

var _n = ds_list_create();

// Set new node's pointer to next node
ds_list_add(_n, _ls[| 0]);

// Set data of new node
ds_list_add(_n, _x);

// Set list's first node pointer to the head
_ls[| 0] = _n;

// Increment list size
_ls[| 1] = _ls[| 1] + 1;