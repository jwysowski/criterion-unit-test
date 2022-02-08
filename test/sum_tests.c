#include <criterion/criterion.h>
#include "sum.h"

Test(sum_tests, passing) {
	double x1, x2, res;

	x1 = 3.4;
	x2 = 3.6;
	res = sum(x1, x2);

	cr_expect(res == x1 + x2, "3.4 + 3.6 should be 7.");
}
