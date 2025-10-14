# Maintainer: David Runge <dvzrv@archlinux.org>

_name=crc32c
pkgname=python-crc32c
pkgver=2.7.1.post0
pkgrel=1
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
sha512sums=('22fe3324c6e5acccfe00f849ddb32c5ed77addd3a0759ded49a52a35888b810b73c419e1719b88856317b4d92b0b15c54650900cafe914c42a0db841c4600ae8')
b2sums=('aa772f260e041fb10757954c6542b5b550031b21ef5174daf3b238c9220c827ac6ab62e10f27efa2fd1c4be07e5b0ca05548343be9810ea544e89c15e22b9030')

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
