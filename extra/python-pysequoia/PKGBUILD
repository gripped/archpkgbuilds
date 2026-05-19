# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pysequoia
pkgname=python-pysequoia
pkgver=0.1.34
pkgrel=1
pkgdesc="Provides OpenPGP facilities in Python through the Sequoia PGP library"
arch=(x86_64)
url="https://github.com/wiktor-k/pysequoia"
license=(Apache-2.0)
groups=(sequoia)
depends=(
  libgcc
  glibc
  python
)
makedepends=(
  clang
  python-build
  python-installer
  python-maturin
  python-wheel
)
source=($_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('460ca8079d087aa80678b3ff3d592fa0c06ca2c1c4ef64a85df7b3c6ab7594471badb1f786cacf6b41d4a9f0d154a004a4914857a5fa5837fbdef7fcc0d57780')
b2sums=('24c83c4ce82ae4d88349b950f6633f7b5bdd2a55f8afc8f7f709be726240a4b2f22734bb64de2f33185989ba4f41cbaf79d09ced1df0009432b22d3e7999b09c')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
