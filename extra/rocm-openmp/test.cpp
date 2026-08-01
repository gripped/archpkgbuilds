// Smoke test for C++ OpenMP target offloading. The containers stay on the host
// and only raw pointers are mapped: this build has no GPU libc or libc++, so
// nothing inside a target region may allocate, print or use the STL.
#include <omp.h>

#include <cmath>
#include <cstdio>
#include <vector>

namespace {
constexpr int n = 1000000;
}

int main()
{
    if (omp_get_num_devices() < 1) {
        std::puts("FAILED: no OpenMP offload device found");
        return 1;
    }

    bool ran_on_device = false;
#pragma omp target map(from: ran_on_device)
    ran_on_device = !omp_is_initial_device();

    if (!ran_on_device) {
        std::puts("FAILED: target region fell back to the host");
        return 1;
    }

    std::vector<double> a(n, 1.0), b(n, 2.0), c(n, 0.0);
    double *ap = a.data(), *bp = b.data(), *cp = c.data();

#pragma omp target teams distribute parallel for \
    map(to: ap[0:n], bp[0:n]) map(from: cp[0:n])
    for (int i = 0; i < n; i++)
        cp[i] = ap[i] + 3.0 * bp[i];

    double checksum = 0.0;
    for (double v : c)
        checksum += v;

    const double expected = 7.0 * n;
    if (std::fabs(checksum - expected) > 1.0e-9 * expected) {
        std::printf("FAILED: got %.15e, expected %.15e\n", checksum, expected);
        return 1;
    }

    std::printf("PASSED: offloaded to device 0 of %d available\n",
                omp_get_num_devices());
    return 0;
}
