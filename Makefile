# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jhakonie <jhakonie@student.hive.fi>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/07/29 17:09:53 by ksuomala          #+#    #+#              #
#    Updated: 2020/09/07 13:57:58 by jhakonie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS = main.c get_grid.c backtracker.c mod_grid.c dynamic_mem.c isvalid.c

NAME = fillit

CC = gcc -g -Wall -Werror -Wextra -c

INCL = -I libft/

OBJS = $(SRCS:.c=.o)

LIB = libft/libft.a

all: $(NAME)

$(NAME): $(OBJS)
	gcc -Wall -Werror -Wextra -o $(NAME) $(OBJS) $(LIB)

$(OBJS): $(SRCS) $(LIB)
	$(CC) $(SRCS) $(INCL)

clean: cleanlib
	rm -f $(OBJS)

fclean: clean fcleanlib
	rm -f $(NAME)

cleanlib:
	make clean -C libft/

fcleanlib:
	make fclean -C libft/

re: fclean $(NAME)

$(LIB):
	make -C libft/

lldb: $(OBJS)
	gcc -Wall -Werror -Wextra -g -o $(NAME) $(OBJS) $(LIB)