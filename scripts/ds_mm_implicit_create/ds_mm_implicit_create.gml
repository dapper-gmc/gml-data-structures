/// @func ds_mm_implicit_init()
///
/// @desc Create a 32-bit memory manager, using a first-fit policy,
///       an implicit free list, and (unimplemented) boundary tag 
///       coalescing using header and footer tags

/**
 * - We'll define a word as 4 bytes (32 bits).
 
 * - We'll use 32 bits in the boundary tags (31 bits for size, and 1
 *   for free or not).
 
 * - By ensuring that blocks are of even size, we can actually
 *   keep track of blocks that are up to 2^32 words long
 
 * - We'll align to double words- keeps blocks even.
 *   Aligning to double words also proofs for 64 bit code.
 
 * - Because of the way we do fences, tags are always aligned
 *   at 4 mod 8, and payloads are aligned at 0 mod 8 (that is, they
 *   are 64-bit aligned. Thus, 64-bit values will not straddle two 
 *   64-bit words.
 */

/**
 * Because global variables are evil, and because we can't replace 
 * the global memory management system anyway, we'll use 
 * "object-oriented" memory managers, such that several independent 
 * memory managers can exist together concurrently.
 */

var mm;

var buffer = buffer_create(2 * WSIZE, buffer_fixed, 1);

mm[0] = buffer;

// This is an index to the first real block- when the 
// buffer is empty, it is an index to the second boundary
// tag.
mm[1] = WSIZE;

ds_mm_implicit_init(mm);

return mm;