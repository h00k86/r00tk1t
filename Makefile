

obj-m := src/main.o


KDIR := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)
BUILD_DIR := $(PWD)/build


ccflags-y := -I$(PWD)/include




all:
	$(MAKE) -C $(KDIR) M=$(PWD)  modules
	@mkdir -p $(BUILD_DIR)

clean: 
	$(MAKE) -C $(KDIR) M=$(PWD) clean
	@rm -rf $(BUILD_DIR)

