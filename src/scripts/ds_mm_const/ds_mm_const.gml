// We use an array to model a memory manager

// We'll define the spaces 10-14 (inclusive) as special
// slots in an array, to create a common interface for
// these memory managers.

#macro MEM_MAN_MALLOC 10
#macro MEM_MAN_REALLOC 11
#macro MEM_MAN_FREE 12
#macro MEM_MAN_READ 13
#macro MEM_MAN_WRITE 14