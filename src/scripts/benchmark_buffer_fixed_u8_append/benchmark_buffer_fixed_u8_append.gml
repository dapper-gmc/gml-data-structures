var buf = buffer_create(400000, buffer_fixed, buffer_u8);

var i;

for (i = 0; i < 100000; i++) {
	buffer_write(buf, buffer_f32, 1);	
}