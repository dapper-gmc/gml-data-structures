show_debug_message("----------------------------------------------------------------------");
show_debug_message("Starting Benchmarks")
show_debug_message("----------------------------------------------------------------------");

benchmark_list_prepend();
benchmark_list_append();
benchmark_mm_malloc();

show_debug_message("----------------------------------------------------------------------");
show_debug_message("Benchmarking Completed")
show_debug_message("----------------------------------------------------------------------");