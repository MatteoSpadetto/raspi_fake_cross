NAME = ads1115
CC=gcc
CFLAGS=-I. -lwiringPi -lpthread
DEPS = $(NAME).h
OBJ = main_$(NAME).o $(NAME).o 

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

$(NAME): $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)
	rm -f main_$(NAME).o
	rm -f $(NAME).o

clean:
	rm -f main_$(NAME).o
	rm -f $(NAME).o
	rm -f app $(NAME)