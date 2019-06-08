// Memory is broken up into blocks

// A block has a boundary tag which includes:
//   1) an in-use bit
//   2) the size of the block (in words)

var mm = argument0;

// First, we construct the initial heap- the buffer has space for two fence
// boundary tags, so we can just place those

var buffer = mm[0];

// The first 16 bytes are irrevocably assigned to act as the head and the tail
// in the free list
buffer_write(buffer, buffer_u32, 8); // Head points to tail
buffer_write(buffer, buffer_u32, 0); // This doesn't matter, but advances the buffer
buffer_write(buffer, buffer_u32, 0); // This doesn't matter, but advances the buffer
buffer_write(buffer, buffer_u32, 0); // Tail points to head

buffer_write(buffer, buffer_u32, FENCE); // Prologue
buffer_write(buffer, buffer_u32, FENCE); // Epilogue

// Finally, we extend the heap.
if (ds_mm_explicit_extend(mm, CHUNKSIZE) == undefined) {
	return -1;	
}
return 0;