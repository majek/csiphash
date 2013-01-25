
all:
	gcc -O3 csiphash.c test.c -g -Wall -Wextra -Wno-unused-parameter -o siphashtest && ./siphashtest
