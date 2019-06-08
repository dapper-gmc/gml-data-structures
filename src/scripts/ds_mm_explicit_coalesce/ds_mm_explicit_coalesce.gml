var mm = argument0;
var handle = argument1;

// TODO: Actual coalescence
// For now, we just take the newly-freed block handle and add it to the list

// Where the head node's next pointer is located on the heap
var head_next = 0;

// Where the list node after the head node is located
var first = ds_mm_explicit_read(mm, buffer_u32, head_next);

// Okay, we'll exlpore later.
// we read the handle's prev and next and adjust appropriately
// but the handles typically pointer to blocks... when they point
// to the head and tail, things have to change. ugh.

var handle_next = handle + 4;
var handle_prev = handle + 8;

ds_mm_explicit_write(mm, head_next, buffer_u32, handle_next);
ds_mm_explicit_write(mm, first + 4, buffer_u32, handle_next);

ds_mm_explicit_write(mm, handle_next, buffer_u32, first);
ds_mm_explicit_write(mm, handle_prev, buffer_u32, 0);