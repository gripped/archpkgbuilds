# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=copr-cli
pkgver=2.9
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
b2sums=('c80bd40506f556968c627dcebf6fec12eb6a328f1591e40276bb8132b7d5169e9974eba80b1d7b1d2b2b075b3f537c404b3f890ef628aa3f89dd0d19bc5ffae5')

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
