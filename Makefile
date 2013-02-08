
all:
	gcc -O3 csiphash.c test.c -g -Wall -Wextra -ggdb -o siphashtest && ./siphashtest
