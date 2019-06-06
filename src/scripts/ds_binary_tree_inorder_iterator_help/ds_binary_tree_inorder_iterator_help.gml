var _t = argument0;
var _iter = argument1;

if _t != undefined {
	ds_binary_tree_inorder_iterator_help(_t[0], _iter);
	ds_iterator_add(_iter, _t[1]);
	ds_binary_tree_inorder_iterator_help(_t[2], _iter);
}
