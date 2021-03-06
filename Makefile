obj-m := xmm7360_usb.o

KVERSION := $(shell /bin/uname -r)
KDIR := /lib/modules/$(KVERSION)/build
PWD := $(shell pwd)

default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean

install:
	$(MAKE) -C $(KDIR) M=$(PWD) modules_install

load:
	-/sbin/rmmod xmm7360
	/sbin/insmod xmm7360.ko

dkms-add:
	/usr/sbin/dkms add xmm7360_usb/1.0

dkms-build:
	/usr/sbin/dkms build xmm7360_usb/1.0

dkms-build:
	/usr/sbin/dkms install xmm7360_usb/1.0

dkms-remove:
	/usr/sbin/dkms remove xmm7360_usb/1.0 --all
