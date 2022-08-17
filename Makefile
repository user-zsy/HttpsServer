
.PHONY: all obj clean

SRC+=$(wildcard *.c utils/*.c)
TMPOBJ:=$(SRC:%.c=%.o)

#APP_FLAGS:= -L./lib -lmp4v2 -lstdc++ -lpthread -lrt -lm -Wl,--no-as-needed -ldl
#COMPLIER_FLAGS:= -g -Wall -fPIC -I./utils -I./mp4v2
APP_FLAGS:=-L./lib -levent -levent_openssl -lssl -lcrypto -ldl -lpthread -lrt -lm 
COMPLIER_FLAGS:= -g -Wall -fPIC -I./include -I./include/openssl   -I./event2

OBJ:=TestHttpsServer


CC=arm-himix200-linux-gcc

obj: $(OBJ)
$(OBJ) : $(TMPOBJ)
	$(CC) -o $@  $^ $(APP_FLAGS)

$(TMPOBJ) : %.o:%.c
	$(CC) $(COMPLIER_FLAGS) -c $^ -o $@
	
clean:
	rm -f $(TMPOBJ)
	rm -f $(OBJ)
