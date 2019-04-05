##
## EPITECH PROJECT, 2017
## Makefile
## File description:
## 
##

SRC		=	strlen.asm		\
			strchr.asm		\
			memset.asm		\
			memcpy.asm		\
			strcmp.asm		\
			strncmp.asm		\
			memmove.asm		\
			rindex.asm		\
			strstr.asm		\
			strpbrk.asm		\
			strcspn.asm		\
			strcasecmp.asm

NAME	=	libasm.so

ASFLAGS	=	-f elf64

AS		=	nasm

OBJ		=	$(SRC:.asm=.o)

%.o: %.asm
	@$(AS) -o $@ $< $(ASFLAGS)

all:	$(NAME)

$(NAME): $(OBJ)
		ld -shared -o $(NAME) $(OBJ)

clean:
	rm -f *.o
	rm -f *~

fclean: clean
	rm -f $(NAME)

re:	fclean all
