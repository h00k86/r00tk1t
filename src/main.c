

#include "include/config.h"
#include <linux/kernel.h>
#include <linux/module.h>


static int __init my_init(void) { 
	
	printk(KERN_INFO "module inserted");	
	return 0;
}

static void __exit my_exit(void) {

	printk(KERN_INFO "module removed");	
}


module_init(my_init);
module_exit(my_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("h00k86");
MODULE_DESCRIPTION("A rootkit ");
