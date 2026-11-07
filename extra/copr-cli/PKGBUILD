# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=copr-cli
pkgver=2.8
pkgrel=1
pkgdesc="CLI tool to run copr"
url="https://github.com/fedora-copr/copr"
license=('GPL-2.0-or-later')
arch=('any')
depends=(
  'python'
  'python-copr'
  'python-humanize'
  'python-jinja'
  'python-requests'
  'python-rich'
)
makedepends=(
  'asciidoc'
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-responses'
)
source=("git+$url.git#tag=copr-cli-$pkgver-1")
b2sums=('b2696f0ba28802f7c1217bcd2f3c211a63cecd3ce38b7eba1b6059adede5e3d37954788a34e73dca8745126fd3cbf7e63c38599615998d5f4a1f4cc9ad4e9f68')

build() {
  cd copr/cli
  python -m build --wheel --no-isolation
  a2x -d manpage -f manpage man/copr-cli.1.asciidoc
}

check() {
  cd copr/cli
  python -m pytest
}

package() {
  cd copr/cli
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/man/man1" man/*.1
}
