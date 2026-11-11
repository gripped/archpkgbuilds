# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pysequoia
pkgname=python-pysequoia
pkgver=0.1.36
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
sha512sums=('98a322152a81785e269ecd2dfc50389df20cff377a7dd8ecfd32b0d950a286fb43bd499b708402fd8dfceb22dd4696390574f12d343cf9d21bdcd04bfc900f99')
b2sums=('d0523694654008926f7921446bfde40522957853655dd686dc00e619032c5aa059007989f61f61fd3d4449f965f370ebb6838dba7eca92dc55baf71e27e034e9')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
