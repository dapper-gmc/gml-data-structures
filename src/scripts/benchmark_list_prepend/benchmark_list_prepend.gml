/// @func benchmark_list_prepend()
/// @desc Benchmark the addition of an element to the front of
//        various list implementations

time_func(benchmark_ds_list_prepend);
time_func(benchmark_ds_linked_list_array_prepend);
time_func(benchmark_ds_linked_list_list_prepend);
time_func(benchmark_ds_linked_list_heap_implicit_prepend);
time_func(benchmark_ds_linked_list_heap_explicit_prepend);