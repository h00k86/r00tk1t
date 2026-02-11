



KDIR := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)
BUILD_DIR := $(PWD)/build







ccflags-y := -I$(PWD)/include/


obj-m := mymodule.o 
mymodule-objs := src/main.o src/net.o src/proc.o




MODULE_FILES:= *.o *.ko *.symvers *.mod.c *.mod *.order






all:
	$(MAKE) -C $(KDIR) M=$(PWD)  modules
	@mkdir -p $(BUILD_DIR)
	@pwd
	@mv $(MODULE_FILES) $(BUILD_DIR)/


load:
	sudo insmod $(BUILD_DIR)/mymodule.ko


unload:
	sudo rmmod mymodule





clean: 
	$(MAKE) -C $(KDIR) M=$(PWD) clean
	@rm -rf $(BUILD_DIR)

