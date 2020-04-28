obj-m := mk_arcade_joystick_rpi.o
KVERSION := $(shell uname -r)

ifneq (,$(findstring -v7, $(KVERSION)))
CFLAGS_mk_arcade_joystick_rpi.o := -DRPI2
endif

ifneq (,$(findstring -tegra, $(KVERSION)))
CFLAGS_mk_arcade_joystick_rpi.o := -DNANO
endif

all:
	$(MAKE) -C /lib/modules/$(KVERSION)/build M=$(PWD) modules

clean:
	$(MAKE) -C /lib/modules/$(KVERSION)/build M=$(PWD) clean
