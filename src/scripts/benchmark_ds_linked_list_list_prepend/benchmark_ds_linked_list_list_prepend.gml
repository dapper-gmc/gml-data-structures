// Linked List

var _ls = ds_linked_list_list_create();

for (i = 0; i < 100000; i++) {
    ds_linked_list_list_prepend(_ls, 1);
}