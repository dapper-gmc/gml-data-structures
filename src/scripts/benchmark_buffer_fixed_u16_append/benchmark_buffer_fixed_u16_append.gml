var buf = buffer_create(400000, buffer_fixed, buffer_u16);

var i;

for (i = 0; i < 100000; i++) {
	buffer_write(buf, buffer_f64, 1);	
}