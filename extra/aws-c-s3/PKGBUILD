# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-s3
pkgver=0.12.0
pkgrel=1
pkgdesc='C99 library implementation for communicating with the S3 service, designed for maximizing throughput on high bandwidth EC2 instances'
arch=(x86_64)
url='https://github.com/awslabs/aws-c-s3'
license=(Apache-2.0)
depends=(
  aws-c-auth
  aws-c-cal
  aws-c-common
  aws-c-http
  aws-c-io
  aws-checksums
  glibc
)
makedepends=(cmake)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('698d249c2fe57f3a51ebfacb2c8957b774f3d555503a2bbc47812d356005ea39240cbf1449be0eca64c0a63fac3cadd16fd2eb66f1db0d694c693ee8dc16107b')

build() {
  cmake -S $pkgname-$pkgver -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DBUILD_SHARED_LIBS=ON \
    -DENABLE_NET_TESTS=OFF
  cmake --build build
}

check() {
  local skip_tests=(
    # These requires an AWS account with a specially configure S3 bucket.
    parallel_read_stream_from_file_sanity_test
    parallel_read_stream_from_large_file_test
    test_add_user_agent_header
    test_s3_client_get_max_active_connections
    test_s3_client_queue_requests
    test_s3_client_update_connections_finish_result
    test_s3_meta_request_body_streaming
    test_s3_request_create_destroy
    test_s3_update_meta_requests_trigger_prepare
  )
  local skip_tests_pattern="${skip_tests[0]}$(printf '|%s' "${skip_tests[@]:1}")"
  ctest --test-dir build --output-on-failure -E "$skip_tests_pattern"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
