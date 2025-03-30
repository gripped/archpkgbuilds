# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=copr-cli
pkgver=2.1
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
sha512sums=('5ba765e351d2b72fb198f559611e31dd0a46ddad8653a7a81f498ce2aa48df41ee9033e0204c8bbc645956bd4127cb0a3bdfc48c0bee7bb236f97ee1fe0bd31d')

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
