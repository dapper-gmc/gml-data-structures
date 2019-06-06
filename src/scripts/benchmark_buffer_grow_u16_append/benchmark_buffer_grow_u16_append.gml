var buf = buffer_create(10, buffer_grow, buffer_u16);

var i;

for (i = 0; i < 100000; i++) {
	buffer_write(buf, buffer_f32, 1);	
}