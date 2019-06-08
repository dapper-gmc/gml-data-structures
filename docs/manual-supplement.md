# The (Unofficial) GameMaker Studio 2 Manual Supplement

There are a few things that the default documentation does not, at time
of writing, cover. This manual is meant to supplement/clarify some of those
points.


## Data Structure Implementation

### Arrays
Arrays are implemented as wrappers around an underlying C++ array
that keeps track of the array size.

### Stacks
The implementation of a ds\_stack is unknown for sure, but the time
complexity of its operations should be optimal for a queue.

### Queues
The implementation of a ds\_queue is unknown for sure, but the time
complexity of its operations should be optimal for a queue.

### Lists
Lists are essentially implemented as Array Lists. They are very similar
to arrays, and often exhibit worse performance.

### Maps
Maps are currently implemented as hash maps with O(1) insert/access.

### Priority Queues
The implementation of Priority Queues is, at the moment, unknown

### Grids
Grids are almost certainly backed by something akin to a 2D array.

## Data Types
- Built-in values are stored as 32-bit floats
- User-created values are stored as 64-bit floats
- It is currently unknown how script indices, array indices, object indices,
  etc., are currently stored. It's safest to treat them as 64-bit, unsigned
  integers until more information is available. 
  
  
