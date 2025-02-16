# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=python-evdev
pkgver=1.9.0
pkgrel=1
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
b2sums=('f4d5967bfccd81ab2c4e6bac10af7547cae4f3af60afc2f9b5f022183aa5641c7e0c75cb441113a899ac3d1163b7cf22d732005741b8e82482638af8fece4a36')

prepare() {
  cd $pkgname
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE
}

# vim:set sw=2 sts=-1 et:
