



KDIR := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)
BUILD_DIR := $(PWD)/build

ccflags-y := -I$(PWD)/include


obj-m := src/mymodule.o 
module-objs := src/main.o src/net.o

all:
	$(MAKE) -C $(KDIR) M=$(PWD)  modules
	@mkdir -p $(BUILD_DIR)
	@cp src/*.ko $(BUILD_DIR)/


load:
	sudo insmod $(BUILD_DIR)/mymodule.ko


unload:
	sudo rmmod mymodule





clean: 
	$(MAKE) -C $(KDIR) M=$(PWD) clean
	@rm -rf $(BUILD_DIR)

