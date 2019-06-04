// Provides a wrapper around a list or a queue to make
// a universal iterator interface

// We can convert this into whatever is fastest.
// This way, by using an interface, we aren't tied to a specific data
// structure if a faster way of creating an iterator presents itself

var _q = ds_queue_create();

return _q;