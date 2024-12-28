# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=copr-cli
pkgver=2.0
pkgrel=2
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
  'python-six'
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
sha512sums=('142033867dc8c417db0ad0a577a7d8c4f7fc35b0fc1627e7908e4347fab3a8b75134c1a016ede311375deb8945558937a020cd59068c5f9fd6565aad5d15287c')

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
