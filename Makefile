

obj-m := src/main.o


KDIR := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

ccflags-y := -I$(PWD)/include

BUILD_DIR := $(PWD)/build



all:
	$(MAKE) -C $(KDIR) M=$(BUILD_DIR)  modules
	@mkdir -p $(BUILD_DIR)
	@cp src/*.ko $(BUILD_DIR)/

clean: 
	$(MAKE) -C $(KDIR) M=$(BUILD_DIR) clean
	@rm -rf $(BUILD_DIR)

