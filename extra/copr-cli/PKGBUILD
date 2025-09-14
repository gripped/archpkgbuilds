# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=copr-cli
pkgver=2.2
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
  'python-setuptools'
)
makedepends=(
  'asciidoc'
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-responses'
)
source=("git+$url.git#tag=copr-cli-$pkgver-1")
sha512sums=('8778a4ddf16d187c4d8f8a66482ff5bf991af190b50ef00d6b35a5961308092b2f963bfd2554805fa5ac6d2c1b0aeea20fa15a481c9a12f05fcdc5483d3bb367')

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
