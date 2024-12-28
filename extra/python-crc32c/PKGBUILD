# Maintainer: David Runge <dvzrv@archlinux.org>

_name=crc32c
pkgname=python-crc32c
pkgver=2.7.1
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
sha512sums=('7a91d83bc1ecbacd2942243b8aa9f11cb548649d941d9dc1e8b241cca02aab105134eb8622ecc56bd9088fe6718e0899dec087ba6ccfa4dd22e52c800c902c51')
b2sums=('4d0e4d8f16b4e1e0bb2ef88dd1a7350b10b9f483c4f0150277a83a213aee0495498de8a6f082f8c097a4d61bd4838be7386de325cd26167efe27716a4c7de05b')

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
