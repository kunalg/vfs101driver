CC=gcc
CFLAGS=-ggdb
LIBUSB=libusb-1.0
CFLAGS += $(shell pkg-config --cflags $(LIBUSB))
LDFLAGS += $(shell pkg-config --libs $(LIBUSB))

V=0
ifeq ($(V), 0)
  Q:=@
else
  Q:=
endif

all: src/proto

src/proto: src/proto.o
	@echo "  LD $@"
	$(Q)$(CC) $(LDFLAGS) $< -o $@

src/proto.o: src/proto.c src/*.h
	@echo "  CC $@"
	$(Q)$(CC) $(CFLAGS) -c $< -o $@

clean: 
	@echo "  RM src/proto src/proto.o"
	$(Q)rm -f src/proto src/proto.o
