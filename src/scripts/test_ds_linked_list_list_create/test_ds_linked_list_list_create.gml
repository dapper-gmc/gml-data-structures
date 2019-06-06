var _ls = ds_linked_list_list_create();

var head = ds_linked_list_list_head(_ls);
var is_empty = ds_linked_list_list_empty(_ls);

if (head != undefined) {
	show_error("Head is not set to null", true);
}

if (!is_empty) {
	show_error("List is not empty", true);	
}