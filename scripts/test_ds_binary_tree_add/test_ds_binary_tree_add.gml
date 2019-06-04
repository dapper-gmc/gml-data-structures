var _t = ds_binary_tree_create(5);

ds_binary_tree_add(_t, 4);
ds_binary_tree_add(_t, 6);
ds_binary_tree_add(_t, 1);
ds_binary_tree_add(_t, 8);
ds_binary_tree_add(_t, 3);

var _iter = ds_binary_tree_inorder_iterator(_t);

var next;
while ds_iterator_has_next(_iter) {
	next = ds_iterator_next(_iter);
	show_debug_message(next);
}