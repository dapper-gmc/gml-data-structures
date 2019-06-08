var heap = ds_mm_explicit_create();

var ls = ds_linked_list_heap_create(heap);

var i;
for (i = 0; i < 1000; i++) {
    ds_linked_list_heap_prepend(ls, 1);
}