time_func(benchmark_array_grow_append);
time_func(benchmark_array_alloc_append);
time_func(benchmark_array_alloc_reverse);


time_func(benchmark_array_create);
time_func(benchmark_array_create_append);
time_func(benchmark_array_create_init_append);
time_func(benchmark_array_create_reverse);
time_func(benchmark_array_create_init_reverse);

time_func(benchmark_buffer_grow_u8_append);
time_func(benchmark_buffer_grow_u16_append);
time_func(benchmark_buffer_grow_u32_append);

time_func(benchmark_buffer_fixed_u8_append);
time_func(benchmark_buffer_fixed_u16_append);
time_func(benchmark_buffer_fixed_u32_append);

// This writes 300,000 more values, but the same amount of data
time_func(benchmark_buffer_fast_append);