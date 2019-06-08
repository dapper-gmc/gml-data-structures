// Memory is broken up into blocks

// A block has a boundary tag which includes:
//   1) an in-use bit
//   2) the size of the block (in words)

var mm = argument0;

// First, we construct the initial heap- the buffer has space for two fence
// boundary tags, so we can just place those

var buffer = mm[0];

buffer_write(buffer, buffer_u32, FENCE);
buffer_write(buffer, buffer_u32, FENCE);

// Then, we initialize the list pointer to the location of the epilogue tag
mm[@ 1] = 4;

// Finally, we extend the heap.
if (ds_mm_implicit_extend(mm, CHUNKSIZE) == undefined) {
	return -1;	
}
return 0;