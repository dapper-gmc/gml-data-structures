// TODO: These conflict with the other macros I define for the
// implicit list!!!

// A word is 4 bytes
// #macro WSIZE 4
// #macro DSIZE 8

// Size of a boundary tag
// This has size, plus in-use bit and 2 next/prev pointers
#macro EXPLICIT_BSIZE 3

// Increment the size of the heap by 1024 words at time
// #macro CHUNKSIZE 1024

// Two blocks (64 bits) for the boundary tags, and two for data
#macro MIN_EXPLICIT_BLOCK_SIZE_WORDS 8

// The first bit in a boundary tag will be an in-use flag (1 for in use)
// The remaining bits will encode the length of a block (in words)
// Therefore, a fence (in-use block of size 0) will simply be "1".
// #macro FENCE 1