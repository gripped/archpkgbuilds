# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=python-evdev
pkgver=1.9.2
pkgrel=2
pkgdesc="Python bindings for the Linux input subsystem"
url="https://python-evdev.readthedocs.io/en/latest/"
arch=(x86_64)
license=(BSD-3-Clause)
depends=(
  glibc
  python
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("git+https://github.com/gvalkov/python-evdev#tag=v$pkgver")
b2sums=('0b8949b3ad9c7664ca8fae2dd30e26e5c4f3a83bd549bba62c97cccef60f0e1f3b11e7c1d511640e940d3e4061ff6236f68ed630f35e39adfd1a3ede4e070779')

prepare() {
  cd $pkgname
}

build() {
  python -m build --wheel --no-isolation $pkgname
}

package() {
  python -m installer --destdir="$pkgdir" $pkgname/dist/*.whl
  install -Dm644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
