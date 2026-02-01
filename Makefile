

obj-m := src/main.o


KDIR := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

ccflags-y := -I$(PWD)/include

BUILD_DIR := $(PWD)/build



all:
	@mkdir -p $(BUILD_DIR)
	$(MAKE) O=$(BUILD_DIR) -C $(KDIR) M=$(PWD)  modules

clean: 
	$(MAKE) -C $(KDIR) M=$(PWD) clean
	@rm -rf $(BUILD_DIR)

