/// @func ds_mm_implicit_init()
///
/// @desc Create a 32-bit memory manager, using a first-fit policy,
///       an implicit free list, and (unimplemented) boundary tag 
///       coalescing using header and footer tags

/**
 * - We'll define a word as 4 bytes (32 bits).
 
 * - We'll use 96 bits in the boundary tags (31 bits for size, and 1
 *   for free or not, and next/prev list pointers).
 
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
    - So now, when I allocate, I:
        1) Move along the free block list, looking for the right location
        2) Chop off as much space as I need
        3) Update the previous pointer to either:
            a) what is left of the chopped off space, or
            b) the next free block in the list after this one (which we are
               claiming for our own)

- So, when I free a block, now I have to update its pointers to the next
  and previous free block.
    - How do I do that?
    - In C, we allocated a list variable, which had a head and a tail
        - and each head and tail has a prev and next pointer

        - the head and the tail would start out pointing at each other

    - When we added new space, we'd first coalesce:
        - There four cases: (behind me = free or not) X (after me = free or not)

    - Then, we'd push the new node to the front of the list.

So you'd have 4 list pointers that existed outside of the heap, and the
remaining list pointers would remain inside of the very same heap.

I can use an arary for those 4 list pointers outside of the heap.
In fact, I only need two pointers, since the prev of head and the next of tail
can/should always be null.

So... in C, those things were flatly off the heap. There was no question about it.
But, here, I cannot have the list point to each other, unless they are indeed on the heap.

Am I just essentially re-coded my ds_linked_list_heap?
	- Yeah, I basically am. THAT only has a head, though- not a head and a tail that
	  need to point to each other. I suppose I can use constant values to refer to the 
	  head and the tail, though. -1 and -2?
	  
Soooo...the memory manager has an address of a list, which also has an address of
the memory manager.

But unlike with the ds_linked_list_heap, we aren't going to be allocating new elements
in exactly the same way- we're going to be creating them directly on the heap, and 
hooking them right into the list.
*/

/**
 * Because global variables are evil, and because we can't replace 
 * the global memory management system anyway, we'll use 
 * "object-oriented" memory managers, such that several independent 
 * memory managers can exist together concurrently.
 */
 
var mm;

var buffer = buffer_create(6 * WSIZE, buffer_fixed, 1);

mm[0] = buffer;

// Another way of doing this would be defining some enum types, and
// switching based on the type to determine the function.
mm[MEM_MAN_MALLOC] = ds_mm_explicit_malloc;
mm[MEM_MAN_REALLOC] = -1;
mm[MEM_MAN_FREE] = -1;
mm[MEM_MAN_READ] = ds_mm_explicit_read;
mm[MEM_MAN_WRITE] = ds_mm_explicit_write;

ds_mm_explicit_init(mm);

return mm;