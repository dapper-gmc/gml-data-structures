var _t = argument0;
var _v = argument1;

if (_t == undefined) {
	return ds_binary_tree_create(_v);
}

var _new;
if (_v <= _t[1]) {
    _new = ds_binary_tree_add(_t[0], _v);
	_t[@ 0] = _new
}
else {
	_new = ds_binary_tree_add(_t[2], _v);
    _t[@ 2] = _new
}

return _t;