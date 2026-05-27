# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-flufl.bounce
_name="${pkgname#python-}"
pkgver=5.0.1
pkgrel=1
pkgdesc="Email bounce detectors"
arch=(any)
url="https://gitlab.com/warsaw/flufl.bounce"
license=(Apache-2.0)
depends=(
  python
  python-atpublic
)
makedepends=(
  python-build
  python-installer
  python-hatchling
)
checkdepends=(
  python-pytest
  python-sybil
)
provides=(python-flufl-bounce)
replaces=(python-flufl-bounce)
source=($url/-/archive/$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('ce000455ff39a6b95bc84cf8ecf02948f734ea3f8d1c468d4fb8cdd841d7ec4388a95c6f354589382e6256e7ec14b9981e63a54fb690686bbbfb4e1c88784837')
b2sums=('012ef3e2243b8b364966716a231c52b331fa8622d6873ad37f19365dad8c6be62dd4e5316d597e2d8865304e6d43defd0a7e883f655f33d757e913b86c4135d8')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )

  cd $_name-$pkgver
  PYTHONPATH="$PWD/src:$PYTHONPATH" pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
