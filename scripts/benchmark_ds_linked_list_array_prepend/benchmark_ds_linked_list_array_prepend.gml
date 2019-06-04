// Linked List

var _ls = ds_linked_list_array_create();

for (i = 0; i < 100000; i++) {
    ds_linked_list_array_prepend(_ls, 1);
}