# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgname=python-mediafile
pkgver=0.14.0
pkgrel=2
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
sha512sums=('5c6e2f462b121eee241ca5883e245c90c44777c1362271b18a03460e76f3ff7ce460aeb85f2ab7919aa69be09fb133a61cd043e1cdcc925b1804668f3bfb6b6e')
b2sums=('a72e18cc94dd393b245c2bb966d7e2f370a091575920027949a7f4973b189deb036032b19dee6027fde7a28e66ab7e183e248ed7a8da91c26544a9e8b19da8fb')

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
