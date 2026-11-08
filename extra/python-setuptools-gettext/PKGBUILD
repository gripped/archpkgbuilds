# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-setuptools-gettext
pkgver=0.1.20
pkgrel=1
pkgdesc='Setuptools plugin for building .mo files'
arch=(any)
url=https://github.com/breezy-team/setuptools-gettext
license=(GPL-2.0-or-later)
depends=(
  python
  python-setuptools
)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
)
source=(git+https://github.com/breezy-team/setuptools-gettext.git#tag=v${pkgver})
b2sums=('a1044faa5d0e412e4abbc79aa7887b31a42bbeaebe8db2633feb9cdb9d3b73a93b7ed8da60d1cc40d1a9745aa1665587774cf5ea28bd650b639e13177e57ec21')
validpgpkeys=(DC837EE14A7E37347E87061700806F2BD729A457) # Jelmer Vernooĳ <jelmer@jelmer.uk>

build() {
  cd setuptools-gettext
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="${pkgdir}" setuptools-gettext/dist/*.whl
}

# vim: ts=2 sw=2 et:
