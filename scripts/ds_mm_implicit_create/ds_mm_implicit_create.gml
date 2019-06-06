/**
    Create a 32-bit memory manager, using a first-fit policy, an
	implicit free list, and boundary-tag coalescing (giving blocks
	both header and footer tags).
*/

// Because global variables are evil, and because we can't replace the global
// memory management system anyway, we'll use "object-oriented" memory managers,
// such that several independent memory managers can exist together concurrently.

var mm;

var buffer = buffer_create(2 * WSIZE, buffer_fixed, 1);

mm[0] = buffer;

// This needs to be an index to the first real block
// (when empty, it is an index to the second boundary tag)
mm[1] = 4;

ds_mm_implicit_init(mm);

return mm;

// Probably want to align buffer to double word size

// A word is 32 bits
// We used 3 words in the header
// The minimum block size is 4 words
// ALSO if blocks are aligned- lower-order address blocks are always 0 (4 and 8)
// Instead of storing an always-0 bit, use it as an allocation flag- THAT'S benefit of alignment

// Why did we want to align to a double word? To keep offsets the same? To reduce fragmentation?
// Reduction of fragmentation makes sense
// 
// If we align to a double word, what advantage do we gain?
//
//    we maintain alignment- alignment of what, exactly?
//    If we're given an address (40) adding 4 gives us a word and adding 8 gives
//
//    bach had three headers. So, at a minimum, 3 words per header = 6 words total. 
//    Minimum would be 8 words.

//  with double word alignment, headers are always aligned at 4 mod 8 because of the 
//  first fence, and payloads are aligned at 0 mod 8
//  
//  So, minimum of 4 words
//  A word is 4 bytes = 32 bits
//  Headers are 3 words = 12 bytes
//  However, a user allocates in BYTES, not words
//  So if we ask for 4 bytes, we wind up allocating 4 words = 16 bytes
//  So if we ask for 3 bytes,  without alignment, we allocate 3.75 bytes. 
//  It's better to alloc in word sizes.

// The real magic in my original implementation is the pointer arithmetic in next_blk

// A block also has a list elem which contains pointers to the next block and the previous block

// A word is 32 bits

// That means the boundary tag is 3 words

// So, it makes sense that I would have my minimum word size be 3
// A double word is 8 bytes

// Okay, so in our project, we allocated the memory manager on the heap- we used static variables to keep
// track of the free lists

// I'd rather wrap the memory manager itself in a struct, since it's not going to be a global thing anyway.

//