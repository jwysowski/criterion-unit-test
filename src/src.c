#include <stdio.h>
#include <stdlib.h>
#include "sum.h"

int main(int argc, char **argv) {
	double x1, x2, res;
	char *ptr = NULL;

	printf("Hi! Calculating sum of: %s, %s.\n", *(argv + 1), *(argv + 2));

	x1 = strtod(argv[1], &ptr);
	x2 = strtod(argv[2], &ptr);

	res = sum(x1, x2);

	printf("Result is: %.2f.\n", res);
	return 0;
}
