##
## EPITECH PROJECT, 2023
## B-ASM-400-BDX-4-1-asmminilibc-edouard.belhomme
## File description:
## Makefile
##

CC = gcc

AS = nasm

LD = ld

OUTPUT = libasm.so

SRC = 	src/strlen.asm	\
		src/strchr.asm	\
		src/strrchr.asm	\
		src/memset.asm	\
		src/memcpy.asm	\
		src/strcmp.asm	\
		src/memmove.asm	\
		src/strncmp.asm	\
		src/strcasecmp.asm \
		src/strstr.asm	\
		src/strpbrk.asm	\
		src/strcspn.asm

OBJECTS = $(SRC:.asm=.o)

ASFLAGS = -f elf64

LDFLAGS = -shared -o $(OUTPUT)

all: $(OUTPUT)

%.o:	%.asm
	$(AS) $(ASFLAGS) $< -o $@

$(OUTPUT): $(OBJECTS)
	$(LD) $(LDFLAGS) $(OBJECTS)

clean:
	rm -f $(OBJECTS) $(OUTPUT) *.gc* test

fclean:	clean

re:	clean all

test:	all $(TEST_OBJ)
		gcc -lcriterion --coverage -ldl -I./include -o test tests/*.c
		./test

.PHONY: all clean fclean re