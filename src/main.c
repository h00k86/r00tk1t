

#include <linux/kernel.h>
#include <linux/module.h>

#include "config.h"

static int __init my_init(void) { 
	
	printk(KERN_INFO "module inserted\n");	
	return 0;
}

static void __exit my_exit(void) {

	printk(KERN_INFO "module removed\n");	
}


module_init(my_init);
module_exit(my_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("h00k86");
MODULE_DESCRIPTION("A rootkit ");
