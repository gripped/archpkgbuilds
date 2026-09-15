# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: TheEdgeOfRage on AUR

pkgname=python-awscrt
pkgver=0.36.3
pkgrel=1
pkgdesc='A common runtime for AWS Python projects'
arch=(x86_64)
url='https://github.com/awslabs/aws-crt-python'
license=('Apache-2.0')
depends=(
  aws-c-auth
  aws-c-cal
  aws-c-common
  aws-c-event-stream
  aws-c-http
  aws-c-io
  aws-c-mqtt
  aws-c-s3
  aws-checksums
  glibc
  python
)
makedepends=(
  cmake
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-websockets)
source=("$pkgname::git+$url.git#tag=v$pkgver")
b2sums=('f5639200dc4559cff4ace22c19ae0c1cde5f2c70bd7c1bc538fe22792b2a26c4b279605865593a853600bede7ca144537ded2cdb8f8ce16582d42dbab31f871d')

prepare() {
  cd $pkgname
  sed -i "s/^__version__ = .*/__version__ = '$pkgver'/" awscrt/__init__.py
}

build() {
  cd $pkgname
  export AWS_CRT_BUILD_USE_SYSTEM_LIBS=1
  export AWS_CRT_BUILD_USE_SYSTEM_LIBCRYPTO=1
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m unittest discover test
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
