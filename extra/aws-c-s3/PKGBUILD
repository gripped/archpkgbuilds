# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-c-s3
pkgver=0.11.4
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4a2d34a92eafe66f0edfe2483ca4fb16c48b610bfc9cccb13b00108d587fe9c9')

build() {
  cd $pkgname-$pkgver
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DBUILD_SHARED_LIBS=ON \
    -DENABLE_NET_TESTS=OFF
  cmake --build build
}

check() {
  cd $pkgname-$pkgver
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
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
}
