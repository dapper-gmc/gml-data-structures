# GML Data Structures and Algorithms 
Per Niklaus Wirth, Algorithms + Data Structures = Programs. An appreciation and
understanding of these fundamental building blocks is essential to writing
performant code- especially in time-constrained environments like video game
programming.

To that end, this repository contains a GameMaker Studio 2 project that
implements and benchmarks a variety of useful data structures and algorithms
using GML.


# Implementation Conventions

GML in particular provides a fun and challenging environment in which to
develop data structures. In particular, it lacks lightweight objects (for the
moment, anyway). However- it does have a few built-in data structures,
including dynamic arrays and lists, as well as buffers, which can be used 
similarly. Of course, using these structures in this way demands caution 
of any programmer so attempting; in absence of a formal way to an object 
to its type, or operations to data, one must lean on strong conventions 
to minimize error.

The result is reminescent of a functional programming style:

```gml

// Create list
var _ls = ds_linked_list_create();

// Add to list
ds_linked_list_add(_ls, 0);

```

# Implemented Data Structures

## Lists

### Linked Lists

#### Linked List (Using Arrays As Nodes)

#### Linked List (Using Built-In Lists as Nodes)

## Trees

### Binary Tree (Using Arrays as Nodes)

## Utility

### Memory Manager

#### Implicit First-Fit Manager (Using a Buffer for the Heap)

# Notes

- Due to variation in caching, the first or first several runs of any benchmark
  may be signficantly slower than subsequent runs.
