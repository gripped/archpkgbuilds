# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Mubashshir <ahmubashshir@gmail.com>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgname=python-confuse
pkgver=2.3.1
pkgrel=1
pkgdesc='Painless YAML config files for Python'
arch=(any)
url=https://github.com/beetbox/confuse
license=(MIT)
depends=(
  python
  python-typing_extensions
  python-yaml
)
makedepends=(
  git
  python-build
  python-poetry-core
  python-installer
  python-click
  python-tomli
  python-sphinx
  python-sphinx_rtd_theme
)
checkdepends=(python-pytest)
source=("$pkgname::git+https://github.com/beetbox/confuse#tag=v$pkgver")
b2sums=('80f069e85f6fc979b7380422f9b1c29cd58116e56e65ccd27248d2d3b415fa06928ebdb9cffa1c9fe3d2a95ac29a2a873c0d1d86590f961c68eb914c35430874')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m unittest discover -vs .
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim: ts=2 sw=2 et:
