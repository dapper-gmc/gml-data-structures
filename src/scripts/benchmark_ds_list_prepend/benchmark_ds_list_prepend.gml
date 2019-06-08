var ls = ds_list_create();

var i;
for (i = 0; i < 100000; i++) {
    ds_list_insert(ls, 0, 1);
}