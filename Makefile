

obj-m := main.o

PWD := $(shell pwd)
KDIR := $(PWD)/linux-6.17



all:
	$(MAKE) -C $(KDIR) M=$(PWD)  modules


clean: 
	$(MAKE) -C $(KDIR) M=$(PWD) clean



