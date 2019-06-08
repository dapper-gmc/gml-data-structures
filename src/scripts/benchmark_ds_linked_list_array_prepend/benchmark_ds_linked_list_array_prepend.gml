// Linked List

var ls = ds_linked_list_array_create();

var i;
for (i = 0; i < 100000; i++) {
    ds_linked_list_array_prepend(ls, 1);
}