# Maintainer: David Runge <dvzrv@archlinux.org>

_name=crc32c
pkgname=python-crc32c
pkgver=2.8
pkgrel=2
pkgdesc="A python package implementing the crc32c algorithm in hardware and software"
arch=(x86_64)
url="https://github.com/ICRAR/crc32c"
license=(
  BSD-3-Clause
  LGPL-2.1-or-later
)
depends=(
  glibc
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('f20734b2372e9c584c0755991606345cba256b6d3cf4926dca58ad0f0b107da55cdbeaaab26250d771f15dfad31392483078a7e133ae283ee5510c0d79bd489b')
b2sums=('6a434a622bfa967dd26df82d934dc2074daf4c8e4affa94f74336c83657f4582da3edab66ed2f4081c853545eba8748f4c808c64ae0da25699f4570cb6dfa8fa')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH" pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE.* -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
