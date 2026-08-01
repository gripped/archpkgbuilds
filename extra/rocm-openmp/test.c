/* Smoke test for C OpenMP target offloading: checks that amdclang builds a
 * target region, that it actually executes on the GPU rather than falling back
 * to the host, and that mapped data survives the round trip. */
#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

enum { n = 1000000 };

int main(void)
{
    if (omp_get_num_devices() < 1) {
        puts("FAILED: no OpenMP offload device found");
        return 1;
    }

    int ran_on_device = 0;
#pragma omp target map(from: ran_on_device)
    ran_on_device = !omp_is_initial_device();

    if (!ran_on_device) {
        puts("FAILED: target region fell back to the host");
        return 1;
    }

    double *a = malloc(n * sizeof *a);
    double *b = malloc(n * sizeof *b);
    double *c = malloc(n * sizeof *c);
    if (!a || !b || !c) {
        puts("FAILED: out of memory");
        return 1;
    }
    for (int i = 0; i < n; i++) {
        a[i] = 1.0;
        b[i] = 2.0;
        c[i] = 0.0;
    }

#pragma omp target teams distribute parallel for \
    map(to: a[0:n], b[0:n]) map(from: c[0:n])
    for (int i = 0; i < n; i++)
        c[i] = a[i] + 3.0 * b[i];

    double checksum = 0.0;
    for (int i = 0; i < n; i++)
        checksum += c[i];

    const double expected = 7.0 * n;
    if (fabs(checksum - expected) > 1.0e-9 * expected) {
        printf("FAILED: got %.15e, expected %.15e\n", checksum, expected);
        return 1;
    }

    free(a);
    free(b);
    free(c);

    printf("PASSED: offloaded to device 0 of %d available\n",
           omp_get_num_devices());
    return 0;
}
