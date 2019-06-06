var buf = buffer_create(400000, buffer_fast, buffer_u8);

var i;

for (i = 0; i < 400000; i++) {
	buffer_write(buf, buffer_u8, 1);	
}