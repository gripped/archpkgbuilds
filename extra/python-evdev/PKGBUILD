# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=python-evdev
pkgver=1.9.3
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
b2sums=('888556960cd0b91d7d713035c38dc0234452c48d9ce713af709ba98295d81213a0fb98bea94c731ddfccbc1aadc6ee2a2e65bdd696768e507f5300cfb27dc0ea')

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
