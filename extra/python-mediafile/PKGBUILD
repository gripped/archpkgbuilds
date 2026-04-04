# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgname=python-mediafile
pkgver=0.16.0
pkgrel=1
pkgdesc='Elegant audio file tagging'
arch=(any)
url='https://github.com/beetbox/mediafile'
license=(MIT)
depends=(
  python
  python-mutagen
  python-filetype
)
makedepends=(
  git
  python-build
  python-poetry-core
  python-installer
)
source=("$pkgname::git+https://github.com/beetbox/mediafile#tag=v$pkgver")
sha512sums=('3ed19ec59f9d1aad3a643c937d41b90a560db5b176e2518c5e1656f264078e32574ce001fe66d78779577dbddbeee8bc17c80364c05a032313a62349e154c225')
b2sums=('47b3240e64dcf1dc33b32a959aa27a2d2fe9292a2e6fc0bc5263a8702731831ca213bd9e5237e3b5f0f8fb8d56a74e1e4e78ea49e38518c58aab132ce9aeb981')

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
