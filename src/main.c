#include <linux/kernel.h>
#include <linux/module.h>

int __init my_init(void) { return 0; }

void __exit my_exit(void) {}

module_init(my_init);
module_exit(my_exit);

MODULE_LICENCE();
MODULE_AUTHOR();
