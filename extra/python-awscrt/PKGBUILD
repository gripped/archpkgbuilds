# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: TheEdgeOfRage on AUR

pkgname=python-awscrt
_pkgname=aws-crt-python
pkgver=0.31.0
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
source=("git+$url.git#tag=v$pkgver")
sha256sums=('46841c0ae3d0fecc737700a76abc7147c3bb76a7c961ab2f6007f8bad1f1e6c8')

prepare() {
  cd $_pkgname
  sed -i "s/^__version__ = .*/__version__ = '$pkgver'/" awscrt/__init__.py
}

build() {
  cd $_pkgname
  export AWS_CRT_BUILD_USE_SYSTEM_LIBS=1
  export AWS_CRT_BUILD_USE_SYSTEM_LIBCRYPTO=1
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m unittest discover test
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
